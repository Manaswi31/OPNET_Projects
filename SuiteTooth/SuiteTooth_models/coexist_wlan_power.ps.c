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

/* coexist_wlan_power.ps.c */                                                       
/* Received power model for radio link Transceiver Pipeline */

/* Modified for HSI's Bluetooth coexistence models */

/****************************************/
/*  	  Copyright (c) 1993-2002		*/
/*      by OPNET Technologies, Inc.     */
/*		(A Delaware Corporation)		*/
/*	7255 Woodmont Av., Suite 250  		*/
/*     Bethesda, MD 20814, U.S.A.       */
/*			All Rights Reserved.		*/
/****************************************/

#include "opnet.h"
#include "wlan_support.h"	
#include <math.h>
#include "Coexist_Pipeline.h"


/***** constants *****/

#define C					3.0E+08		/* speed of light (m/s) */
#define SIXTEEN_PI_SQ		157.91367	/* 16 times pi-squared 	*/

static const char*	PowI_Err_Hdr = "Error in radio power computation pipeline stage (dra_power):";


/***** pipeline procedure *****/

#if defined (__cplusplus)
extern "C"
#endif
void
coexist_wlan_power (Packet * pkptr)
	{
	double		prop_distance, rcvd_power, path_loss;
	double		tx_power, tx_base_freq, tx_bandwidth, tx_center_freq;
	double		lambda, rx_ant_gain, tx_ant_gain;
	Boolean		sig_lock;
	Objid		rx_ch_obid, rx_obid;
	double		in_band_tx_power, band_max, band_min;
	double		rx_base_freq, rx_bandwidth;
	double		rx_reception_end, pk_reception_end;
	double*		rx_power_threshold_ptr;
	Objid		tx_objid;
	int			tx_type;
	double		tx_drate, rx_drate;

	/** Compute the average received power in Watts of the		**/
	/** signal associated with a transmitted packet.			**/
	FIN (coexist_wlan_power (pkptr));

	/* Get power allotted to transmitter channel. 				*/
	tx_power = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_POWER);

	/* Get transmission frequency in Hz. 						*/
	tx_base_freq = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_FREQ);
	tx_bandwidth = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_BW);
	tx_center_freq = tx_base_freq + (tx_bandwidth / 2.0);

	/* When using TMM, the TDA OPC_TDA_RA_RCVD_POWER will		*/
	/* already have a raw value for the path loss.				*/
	if (op_td_is_set (pkptr, OPC_TDA_RA_RCVD_POWER))
		{
		path_loss = op_td_get_dbl (pkptr, OPC_TDA_RA_RCVD_POWER);
		}
	else
		{
		/* Caclculate wavelength (in meters). 					*/
		lambda = C / tx_center_freq;

		/* Get distance between transmitter and receiver (in	*/
		/* meters). 											*/
		prop_distance = op_td_get_dbl (pkptr, OPC_TDA_RA_START_DIST);
		
		/* Compute the path loss for this distance and			*/
		/* wavelength. 											*/
		if (prop_distance > 0.0)
			{
			path_loss = (lambda * lambda) / 
				(SIXTEEN_PI_SQ * prop_distance * prop_distance);
			}
		else
			path_loss = 1.0;
		}

	/* Determine the receiver bandwidth and base frequency.		*/
	rx_base_freq = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_FREQ);
	rx_bandwidth = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_BW);

	/* Use these values to determine the band overlap with the	*/
	/* transmitter. Note that if there were no overlap at all,	*/
	/* the packet would already have been filtered by the		*/
	/* channel match stage.										*/
	if ((rx_base_freq > tx_base_freq + tx_bandwidth) || (tx_base_freq > rx_base_freq + rx_bandwidth))
		{
		in_band_tx_power = 0.0;
		}
	else
		{
		/* The base of the overlap band is the highest base			*/
		/* frequency.												*/
		if (rx_base_freq > tx_base_freq) 
			band_min = rx_base_freq;
		else
			band_min = tx_base_freq;
	
		/* The top of the overlap band is the lowest end frequency. */
		if (rx_base_freq + rx_bandwidth > tx_base_freq + tx_bandwidth)
			band_max = tx_base_freq + tx_bandwidth;
		else
			band_max = rx_base_freq + rx_bandwidth;

		/* Compute the amount of in-band transmitter power. 		*/
		in_band_tx_power = tx_power * (band_max - band_min) / tx_bandwidth;
		}
	/* Get antenna gains (raw form, not in dB). 				*/
	tx_ant_gain = pow (10.0, op_td_get_dbl (pkptr, OPC_TDA_RA_TX_GAIN) / 10.0);
	rx_ant_gain = pow (10.0, op_td_get_dbl (pkptr, OPC_TDA_RA_RX_GAIN) / 10.0);

	/* Calculate received power level. 							*/
	rcvd_power = in_band_tx_power * tx_ant_gain * path_loss * rx_ant_gain;

	/* Assign the received power level (in Watts) to the packet	*/
	/* transmission data attribute.		*/
	//op_td_set_dbl (pkptr, OPC_TDA_RA_RCVD_POWER, rcvd_power);
	// Need to trick the wlan statwires
	op_td_set_dbl(pkptr, OPC_TDA_RA_MAX_INDEX + COEXIST_ACTUAL_RX_POWER, rcvd_power);
	
	/* Now we need to check whether the receiver will lock onto	*/
	/* this signal, which depends on the receiver's current		*/
	/* status and the reception power of the signal.			*/
	/* First check the status of the receiver node.				*/
	if (op_td_is_set (pkptr, OPC_TDA_RA_ND_FAIL))
		{
		/* The receiving node is disabled. Change the channel	*/
		/* match status to noise.								*/
		op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
		}
	else
		{
		/* The receiving node is enabled. Get the object id of	*/
		/* the receiver channel and the receiver itself.		*/
		rx_ch_obid = op_td_get_int (pkptr, OPC_TDA_RA_RX_CH_OBJID);
		rx_obid    = op_topo_parent (op_topo_parent (rx_ch_obid));
		
		/* Obtain the status of the receiver. If end of			*/
		/* reception time is in future then this means the		*/
		/* receiver is already busy.							*/
		op_ima_obj_attr_get (rx_obid, "reception end time", &rx_reception_end);
		
		/* Retrieve the packet reception power threshold value	*/
		/* of the WLAN receiver.								*/
		rx_power_threshold_ptr = (double *) op_ima_obj_state_get (rx_ch_obid);
			
		/* If the receiver is already receiving another packet,	*/
		/* then the packet will now be considered to be noise.	*/
		/* This prevents simultaneous reception of multiple		*/
		/* valid packets on any given radio channel and the		*/
		/* entire radio receiver, since in the WLAN nodes, all	*/
		/* the channels use the same frequency.					*/
		if (rx_reception_end <= op_sim_time ())
			{
			/* The receiver is idle. Turn on the signal lock if	*/
			/* the reception power of the packet is higher than	*/
			/* the power threshold. The status of the packet	*/
			/* remains VALID.									*/
			if (rcvd_power > *rx_power_threshold_ptr)
				{
				
				// Get some TDA's to determine if this really valid interference
			   	tx_objid = op_td_get_int (pkptr, OPC_TDA_RA_TX_OBJID);
				op_ima_obj_attr_get(tx_objid, "Coexistence Transceiver Type", &tx_type);
				tx_drate = op_td_get_dbl (pkptr, OPC_TDA_RA_TX_DRATE);
				rx_drate = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_DRATE);
				
				if (tx_drate == rx_drate && tx_type == COEXIST_TR_TYPE_WLAN)
					{
					// This is what the orginal pipeline stage expects
							
					sig_lock = OPC_BOOLINT_ENABLED;
					op_ima_obj_attr_set (rx_ch_obid, "signal lock", sig_lock);

					/* Check the status of the packet. It could be	*/
					/* set to noise in channel match stage because	*/
					/* of imperfect match (interference from		*/
					/* another BSS). If this is the case, since it	*/
					/* is still a powerful packet and arriving the	*/
					/* receiver while it is idling, change its		*/
					/* status to "VALID" and set its "Accept"		*/
					/* field appropriately.							*/
					if (op_td_get_int (pkptr, OPC_TDA_RA_MATCH_STATUS) == OPC_TDA_RA_MATCH_NOISE)
						{
						op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_VALID);
						op_pk_nfd_set (pkptr, "Accept", WLANC_NEIGHBOR_BSS_PKT_REJECT);
						}

					/* Update the reception end time for the receiver based	*/
					/* on the new packet if its power is exceeding the		*/
					/* threshold.											*/
					pk_reception_end = op_td_get_dbl (pkptr, OPC_TDA_RA_END_RX);
					if (pk_reception_end > rx_reception_end)
						op_ima_obj_attr_set (rx_obid, "reception end time", pk_reception_end);	

					// Set stat power here 
					op_td_set_dbl (pkptr, OPC_TDA_RA_RCVD_POWER, rcvd_power); 
					}
				else
					{
					// It might bluetooth or a differnt data rate
					op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
					}
				}
			else
				{
				/* Packet's power is too weak to turn on the	*/
				/* signal lock and to remain a valid packet.	*/
				/* Change its status to noise.					*/
				op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
				}
			}
		else
			{
			/* At least one channel of the receiver is busy. We	*/
			/* will handle the current packet as noise.			*/
			op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
			}

		}

	FOUT;
	}

