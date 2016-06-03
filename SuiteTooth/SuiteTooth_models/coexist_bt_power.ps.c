/***********************************************/
// The SuiteTooth model set was developed by
// HIGHLAND SYSTEMS, INC.
//
// It incorporates code available in the public
// domain and other code that is the property of
// OPNET Technologies, Inc.
//
// Inquiries may be addressed to:
// 
// Highland Systems, Inc.
// (703) 312 0830
// info@highsys.com
// www.highsys.com
/***********************************************/

/* coexist_bt_power.ps.c */                                                       
/* Received power model for radio link Transceiver Pipeline */

/* Modified for HSI's Bluetooth coexistence models */

/****************************************/
/*  	  Copyright (c) 1993-2001		*/
/*      by OPNET Technologies, Inc.     */
/*		(A Delaware Corporation)		*/
/*	7255 Woodmont Av., Suite 250  		*/
/*		   Bethesda, MD, U.S.A. 		*/
/*			All Rights Reserved.		*/
/****************************************/

#include "opnet.h"
#include <math.h>
#include "Coexist_Pipeline.h"

/***** constants *****/

#define C					3.0E+08			/* speed of light (m/s) */
#define SIXTEEN_PI_SQ		157.91367		/* 16 times pi-squared */
#define PI                  3.1415926

static const char*	PowI_Err_Hdr = "Error in radio power computation pipeline stage (coexist_power):";
static int Get_Pathloss = OPC_TRUE;
static int Pathloss_Model;

/***** pipeline procedure *****/

#if defined (__cplusplus)
extern "C"
#endif
void
coexist_bt_power (Packet * pkptr)
	{
	double		prop_distance, rcvd_power, path_loss;
	double		tx_power, tx_base_freq, tx_bandwidth, tx_center_freq;
	double		lambda, rx_ant_gain, tx_ant_gain;
	Boolean		sig_lock;
	Objid		rx_ch_obid, rx_obid;
	double		in_band_tx_power, band_max, band_min;
	double		rx_base_freq, rx_bandwidth;
	double		rx_reception_end, pk_reception_end;
	/* Added for coexistence */
	Objid       tx_objid;
	Objid       rx_objid;
	Objid		busy_mon_objid;
	int			tx_type;
	int			rx_type;
	int			ch_index;
	double      max_dist;


	/** Compute the average power in Watts of the		**/
	/** signal associated with a transmitted packet.	**/
	FIN (coexist_bt_power (pkptr));
	//printf("coexist power\n");

	/* Get the pathloss model if this is the first invocation */
	if (Get_Pathloss == OPC_TRUE)
		{
		op_ima_sim_attr_get(OPC_IMA_INTEGER, "Pathloss Model", &Pathloss_Model);
		Get_Pathloss = OPC_FALSE;
		if(op_prg_odb_ltrace_active ("pathloss"))
			{
			printf("bt pathloss is %d\n", Pathloss_Model);
			}

		}

	/* Get transmitter attributes needed in determining signal lock */
	tx_objid	= op_td_get_int (pkptr, OPC_TDA_RA_TX_OBJID);	
	op_ima_obj_attr_get(tx_objid, "Coexistence Transceiver Type", &tx_type);

	/* If the incoming packet is 'valid', it may cause the receiver to	*/
	/* lock onto it. However, if the receiving node is disabled, then	*/
	/* the channel match should be set to noise.						*/
	if (op_td_get_int (pkptr, OPC_TDA_RA_MATCH_STATUS) == OPC_TDA_RA_MATCH_VALID)
		{
		if (op_td_is_set (pkptr, OPC_TDA_RA_ND_FAIL))
			{
			/* The receiving node is disabled.  Change	*/
			/* the channel match status to noise.		*/
			op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
			}
		else if (tx_type == COEXIST_TR_TYPE_WLAN)
			{
			/* The receiving node is enabled. Get the object id	*/
			/* of the receiver channel and the receiver itself.	*/
			rx_ch_obid = op_td_get_int (pkptr, OPC_TDA_RA_RX_CH_OBJID);
			rx_obid    = op_topo_parent (op_topo_parent (rx_ch_obid));

			/* Obtain the status of the receiver. If end of		*/
			/* reception time is in future then this means the	*/
			/* receiver is already busy.						*/
			op_ima_obj_attr_get (rx_obid, "reception end time", &rx_reception_end);
			
			/* If the receiver is already receiving another		*/
			/* packet, then the packet will now be considered	*/
			/* to be noise. This prevents simultaneous			*/
			/* reception of multiple valid packets on any given	*/
			/* radio channel and the entire radio receiver,		*/
			/* since in the	wlan nodes, all the channels use	*/
			/* the same	frequency.								*/
			if (rx_reception_end <= op_sim_time ())
				{
				/* The receiver is idle. Turn on the signal		*/
				/* lock. No need to change the status of the	*/
				/* packet, since it is valid by default.		*/
				sig_lock = OPC_BOOLINT_ENABLED;
				op_ima_obj_attr_set (rx_ch_obid, "signal lock", sig_lock);
				}
			else
				{
				/* At least one channel of the receiver is		*/
				/* busy. We will handle the current packet as	*/
				/* noise.										*/
				op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
				}

			/* Update the reception end time for the receiver	*/
			/* based on the new packet.							*/
			pk_reception_end = op_td_get_dbl (pkptr, OPC_TDA_RA_END_RX);
			
			if (pk_reception_end > rx_reception_end)
				op_ima_obj_attr_set (rx_obid, "reception end time", pk_reception_end);

			/* AW - 9/4/01 - Coexist */
			/* Notify the busy monitor of this WLAN packet */
			op_ima_obj_attr_get (rx_obid, "RX Busy Monitor Objid", &busy_mon_objid);
			/* Change the busy monitor busy until time till the end of reception */
			op_ima_obj_attr_set (busy_mon_objid, "Busy Until Time", pk_reception_end - 1.0e-14);
			/* Get the channel index */
			ch_index = op_td_get_int(pkptr, OPC_TDA_RA_TX_CH_INDEX);
			/* Send the monitor a remote interrupt */
			op_intrpt_schedule_remote (op_sim_time(), ch_index, busy_mon_objid);

			}
		else /* Bluetooth or anything else */
			{
			
			/* The receiving node is enabled.  Get	*/
			/* the address of the receiver channel.	*/
			rx_ch_obid = op_td_get_int (pkptr, OPC_TDA_RA_RX_CH_OBJID);
	
			/* If the receiver channel is already locked,		*/
			/* the packet will now be considered to be noise.	*/
			/* This prevents simultaneous reception of multiple	*/
			/* valid packets on any given radio channel.		*/
			if (op_ima_obj_attr_get (rx_ch_obid, "signal lock", &sig_lock)
				== OPC_COMPCODE_FAILURE)
				{
				op_sim_end (PowI_Err_Hdr,
					"Unable to get signal lock flag from channel attribute.",
					OPC_NIL, OPC_NIL);
				}		
			if (sig_lock)
				op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
			else
				{
				/* Otherwise, the receiver channel will become	*/
				/* locked until the packet reception ends.		*/
				sig_lock = OPC_BOOLINT_ENABLED;
				if (op_ima_obj_attr_set (rx_ch_obid, "signal lock", sig_lock)
					== OPC_COMPCODE_FAILURE)
					{
					op_sim_end (PowI_Err_Hdr,
						"Unable to set receiver channel attribute (signal lock).",
						OPC_NIL, OPC_NIL);
					}		
				}
			}
		}

	/* Get rx attributes */
	rx_objid	= op_td_get_int (pkptr, OPC_TDA_RA_RX_OBJID);	
	op_ima_obj_attr_get(rx_objid, "Coexistence Transceiver Type", &rx_type);

			
	
	/* Get power allotted to transmitter channel. */
	tx_power = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_POWER);
	/* Get transmission frequency in Hz. */
	tx_base_freq = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_FREQ);
	tx_bandwidth = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_BW);
	tx_center_freq = tx_base_freq + (tx_bandwidth / 2.0);

	/* Caclculate wavelength (in meters). */
	lambda = C / tx_center_freq;

	/* Get distance between transmitter and receiver (in meters). */
	prop_distance = op_td_get_dbl (pkptr, OPC_TDA_RA_START_DIST);

	/* When using TMM, the TDA OPC_TDA_RA_RCVD_POWER will already	*/
	/* have a raw value for the path loss. */
	if (op_td_is_set (pkptr, OPC_TDA_RA_RCVD_POWER))
		{
		path_loss = op_td_get_dbl (pkptr, OPC_TDA_RA_RCVD_POWER);
		}
	else
		{
		/* Compute the path loss for this distance and wavelength. */
		/* add indoor propagation loss */
		
		//printf("pathloss model: %d\n", Pathloss_Model);
		if (prop_distance <=  lambda/(4 * PI))
			path_loss = 1;
		
		else 
			{
			if(Pathloss_Model == FREE_SPACE)
				{
				path_loss = (lambda * lambda) / 
					(SIXTEEN_PI_SQ * prop_distance * prop_distance);
				}
			
			else if (Pathloss_Model == INDOOR)
				{
				/* add indoor propagation loss R 3.3, 8 m max dist*/
		
				if (prop_distance <=  lambda/(4 * PI))
					path_loss = 1;
		
				else 
					{
					if (prop_distance > 8)
						max_dist = 8;
					else
						max_dist = prop_distance;
			
					path_loss = (lambda * lambda) / 
						(SIXTEEN_PI_SQ * max_dist * max_dist);
					}
				if (prop_distance > 8 )
					path_loss *= pow((8/prop_distance), 3.3); 
				}
			
			else if (Pathloss_Model == CUSTOM)
				{
				/* Custom pathloss calculation may be inserted here */
				/* Free space equation used as placeholder */
				path_loss = (lambda * lambda) / 
					(SIXTEEN_PI_SQ * prop_distance * prop_distance);
				}
			else 
				{
				op_sim_end (PowI_Err_Hdr,"Invalid pathloss model attribute",
					OPC_NIL, OPC_NIL);
				}			
			}
			
		}

	/* Determine the receiver bandwidth and base frequency. */
	rx_base_freq = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_FREQ);
	rx_bandwidth = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_BW);

	/* Use these values to determine the band overlap with the transmitter.	*/
	/* Note that if there were no overlap at all, the packet would already	*/
	/* have been filtered by the channel match stage.						*/

	/* The base of the overlap band is the highest base frequency. */
	if (rx_base_freq > tx_base_freq) 
		band_min = rx_base_freq;
	else
		band_min = tx_base_freq;
	
	/* The top of the overlap band is the lowest end frequency. */
	if (rx_base_freq + rx_bandwidth > tx_base_freq + tx_bandwidth)
		band_max = tx_base_freq + tx_bandwidth;
	else
		band_max = rx_base_freq + rx_bandwidth;

	/* Compute the amount of in-band transmitter power. */
	if ((rx_type == COEXIST_TR_TYPE_BLUETOOTH))
		{
		/* Bluetooth received a WLAN packet the inband power is 1/22 */
		in_band_tx_power = tx_power * (rx_bandwidth / tx_bandwidth);
		}
	else
		{
		in_band_tx_power = tx_power * (band_max - band_min) / tx_bandwidth;
		}

	/* Get antenna gains (raw form, not in dB). */
	tx_ant_gain = pow (10.0, op_td_get_dbl (pkptr, OPC_TDA_RA_TX_GAIN) / 10.0);
	rx_ant_gain = pow (10.0, op_td_get_dbl (pkptr, OPC_TDA_RA_RX_GAIN) / 10.0);
	

	
	/* Calculate received power level. */
	rcvd_power = in_band_tx_power * tx_ant_gain * path_loss * rx_ant_gain;
	

	/* Assign the received power level (in Watts) */
	/* to the packet transmission data attribute. */
	op_td_set_dbl (pkptr, OPC_TDA_RA_RCVD_POWER, rcvd_power);
	
	FOUT;
	}

