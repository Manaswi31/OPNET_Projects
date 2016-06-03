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

/* coexist_chanmatch.ps.c */                                                       
/* Modified for IEEE802.11: Channel match to check for many	*/
/* channel parameters like data rate, modulation, etc.		*/

/* Modified for HSI's Bluetooth/WLAN coexistence models */

/****************************************/
/*	    Copyright (c) 1993 - 2002		*/
/*		by OPNET Technologies, Inc.		*/
/*		(A Delaware Corporation)		*/
/*	7255 Woodmont Av., Suite 250  		*/
/*     Bethesda, MD 20814, U.S.A.       */
/*			All Rights Reserved.		*/
/****************************************/

#include "opnet.h"
#include "Coexist_Pipeline.h"


#if defined (__cplusplus)
extern "C"
#endif
void
coexist_chanmatch (Packet * pkptr)
	{
	double		tx_freq, tx_bw, tx_drate, tx_code;
	double		rx_freq, rx_bw, rx_drate, rx_code;
	Vartype		tx_mod;
	Vartype		rx_mod;
	/* Added */
	Objid       tx_objid, tx_node_objid;
	Objid       rx_objid, rx_node_objid;
	int			tx_type, bluetooth_tx_piconet;
	int			rx_type, bluetooth_rx_piconet;
	char					pk_format[50];

	/** Determine the compatibility between transmitter and receiver channels. **/
	FIN (coexist_chanmatch (pkptr));

	/* Obtain transmitting channel attributes. */
	tx_freq		= op_td_get_dbl (pkptr, OPC_TDA_RA_TX_FREQ);
	tx_bw		= op_td_get_dbl (pkptr, OPC_TDA_RA_TX_BW);
	tx_drate	= op_td_get_dbl (pkptr, OPC_TDA_RA_TX_DRATE);
	tx_code		= op_td_get_dbl (pkptr, OPC_TDA_RA_TX_CODE);
	tx_mod		= op_td_get_ptr (pkptr, OPC_TDA_RA_TX_MOD);	

	/* Obtain receiving channel attributes. */
	rx_freq		= op_td_get_dbl (pkptr, OPC_TDA_RA_RX_FREQ);
	rx_bw		= op_td_get_dbl (pkptr, OPC_TDA_RA_RX_BW);
	rx_drate	= op_td_get_dbl (pkptr, OPC_TDA_RA_RX_DRATE);
	rx_code		= op_td_get_dbl (pkptr, OPC_TDA_RA_RX_CODE);
	rx_mod		= op_td_get_ptr (pkptr, OPC_TDA_RA_RX_MOD);	

	
	/* Obtain extra tx attributes for Coexist */
	tx_objid	= op_td_get_int (pkptr, OPC_TDA_RA_TX_OBJID);	
    tx_node_objid = op_topo_parent(tx_objid);
	rx_objid	= op_td_get_int (pkptr, OPC_TDA_RA_RX_OBJID);	
    rx_node_objid = op_topo_parent(rx_objid);

	op_ima_obj_attr_get(tx_objid, "Coexistence Transceiver Type", &tx_type);
	op_ima_obj_attr_get(rx_objid, "Coexistence Transceiver Type", &rx_type);
	
	if (tx_type == COEXIST_TR_TYPE_BLUETOOTH)
		{
		op_ima_obj_attr_get(tx_objid, "Coexistence Bluetooth Piconet", &bluetooth_tx_piconet);
		}	

	if (rx_type == COEXIST_TR_TYPE_BLUETOOTH)
		{
		op_ima_obj_attr_get(rx_objid, "Coexistence Bluetooth Piconet", &bluetooth_rx_piconet);
		}
	
	if ((tx_type == COEXIST_TR_TYPE_BLUETOOTH /*&& rx_type == COEXIST_TR_TYPE_BLUETOOTH*/) && (bluetooth_tx_piconet != bluetooth_rx_piconet))
		{
		op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
		FOUT;
		}
	
	/* For non-overlapping bands, the packet has no	*/
	/* effect; such packets are ignored entirely.	*/
	if ((tx_freq > rx_freq + rx_bw) || (tx_freq + tx_bw < rx_freq))
		{
		if (rx_type == COEXIST_TR_TYPE_BLUETOOTH)
			{
			/* Bluetooth Frequency Hopping might need to account for this packet later */
			op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
			FOUT;
			}
	    else
			{
			op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_IGNORE);
			FOUT;
			}
		}
	

	
	/* if sent from myself - make it noise */
	if (tx_node_objid == rx_node_objid)
		{
		op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
		FOUT;
		}
	
	/* Otherwise check for channel attribute mismatches which would	*/
	/* cause the in-band packet to be considered as noise.			*/
	if ((tx_freq != rx_freq) || (tx_bw != rx_bw) || (tx_type != rx_type) || 
		(tx_code != rx_code) || (tx_mod != rx_mod) || (tx_drate != rx_drate))
		{
		op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
		FOUT;
		}


	
	/* Otherwise the packet is considered a valid transmission which	*/
	/* could eventually be accepted at the error correction stage.		*/
	op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_VALID);

	/* If this is a wlan receiver and a wlan packet need to make sure the receiver and transmitter are in the same subnet. */
	if (rx_type == COEXIST_TR_TYPE_WLAN)
		{
		/* Get the packet format */
		op_pk_format(pkptr, pk_format);

		if (pk_format[0] == 'w' && pk_format[1] == 'l' && pk_format[2] == 'a')
			{
		 	/* Only stations in the same subnet will receive the packet.	*/
		    /* Mark the packet as noise if they are not in the same subnet. */
   			if (op_topo_parent (tx_node_objid) != op_topo_parent(rx_node_objid))
				{
			   op_td_set_int (pkptr, OPC_TDA_RA_MATCH_STATUS, OPC_TDA_RA_MATCH_NOISE);
			   }
			}
		}

	
	
	FOUT;
	}                
