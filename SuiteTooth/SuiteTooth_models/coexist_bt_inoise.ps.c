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

/* coexist_bt_inoise.ps.c */                                                       
/* Interference noise model for radio link Transceiver Pipeline */

/* Modified for HSI's Bluetooth coexistence models */

/****************************************/
/*		  Copyright (c) 1993-2001		*/
/*		by OPNET Technologies, Inc.		*/
/*		(A Delaware Corporation)		*/
/*	7255 Woodmont Av., Suite 250  		*/
/*		   Bethesda, MD, U.S.A. 		*/
/*			All Rights Reserved.		*/
/****************************************/

#include "opnet.h"
#include "Coexist_Pipeline.h"

#if defined (__cplusplus)
extern "C"
#endif
void
coexist_bt_inoise (Packet * pkptr_prev, Packet * pkptr_arriv)
	{
	int			arriv_match, prev_match;
	double		prev_rcvd_power, arriv_rcvd_power;
	double		arriv_noise_accum, prev_noise_accum;
	/* Coexist added */
	Objid		tx_objid;
	int			tx_type;
	Objid		txi_objid;
	int			txi_type;
	double		arrive_tx_freq, prev_tx_freq;	
	double		arrive_tx_bw, prev_tx_bw;

	/** Evaluate a collision due to arrival of 'pkptr_arriv'	**/
	/** where 'pkptr_prev' is the packet that is currently		**/
	/** being received.											**/
	FIN (coexist_bt_inoise (pkptr_prev, pkptr_arriv));

	/* If the previous packet ends just as the new one begins, this is not	*/
	/* a collision (just a near miss, or perhaps back-to-back packets).		*/ 
	if (op_td_get_dbl (pkptr_prev, OPC_TDA_RA_END_RX) != op_sim_time ())
		{
		/* Increment the number of collisions in previous packet. */
		op_td_set_int (pkptr_prev, OPC_TDA_RA_NUM_COLLS, 
				op_td_get_int (pkptr_prev, OPC_TDA_RA_NUM_COLLS) + 1);

		/* Determine if previous packet is valid or noise. */
		prev_match = op_td_get_int (pkptr_prev, OPC_TDA_RA_MATCH_STATUS);

		/* Determine if arriving packet is valid or noise. */
		arriv_match = op_td_get_int (pkptr_arriv, OPC_TDA_RA_MATCH_STATUS);
		
		/* Get received power levels for both packets. */
		prev_rcvd_power = op_td_get_dbl (pkptr_prev, OPC_TDA_RA_RCVD_POWER);
		arriv_rcvd_power = op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_RCVD_POWER);

		/* If the arriving packet is valid, calculate		*/
		/* interference of previous packet on arriving one.	*/
		if (arriv_match == OPC_TDA_RA_MATCH_VALID)
			{
			/* Obtain extra tx attributes for Coexist */
			tx_objid	= op_td_get_int (pkptr_arriv, OPC_TDA_RA_TX_OBJID);	
			op_ima_obj_attr_get(tx_objid, "Coexistence Transceiver Type", &tx_type);
			txi_objid	= op_td_get_int (pkptr_prev, OPC_TDA_RA_TX_OBJID);	
			op_ima_obj_attr_get(txi_objid, "Coexistence Transceiver Type", &txi_type);
			if (tx_type == COEXIST_TR_TYPE_BLUETOOTH)
				{
				/* For Bluetooth we need to see if this is a real collision */
				arrive_tx_freq	= op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_TX_FREQ);
				arrive_tx_bw	= op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_TX_BW);
				prev_tx_freq	= op_td_get_dbl (pkptr_prev, OPC_TDA_RA_TX_FREQ);
				prev_tx_bw		= op_td_get_dbl (pkptr_prev, OPC_TDA_RA_TX_BW);
				if (txi_type == COEXIST_TR_TYPE_BLUETOOTH)
						{
						}

				//printf("Arrive %lf to %lf and prev %lf to %lf\n", arrive_tx_freq, arrive_tx_bw, prev_tx_freq, prev_tx_bw);
				if ((arrive_tx_freq >= prev_tx_freq + prev_tx_bw) || (arrive_tx_freq + arrive_tx_bw <= prev_tx_freq))
					{
					/* This is not a real collision set add no more interference noise */					

					}
				else
					{
					/* This is a real collision add the noise */
					arriv_noise_accum = op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_NOISE_ACCUM);
					op_td_set_dbl (pkptr_arriv, OPC_TDA_RA_NOISE_ACCUM,
						arriv_noise_accum + prev_rcvd_power);
					/* Increment number of collisions in arriving packet. */
					op_td_set_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS, 
						op_td_get_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS) + 1);
					}
				}
			else
				{
				arriv_noise_accum = op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_NOISE_ACCUM);
				op_td_set_dbl (pkptr_arriv, OPC_TDA_RA_NOISE_ACCUM,
					arriv_noise_accum + prev_rcvd_power);
				/* Increment number of collisions in arriving packet. */
				op_td_set_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS, 
					op_td_get_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS) + 1);
				}
			}

		/* And vice-versa. */
		if (prev_match == OPC_TDA_RA_MATCH_VALID)
			{
			/* Obtain extra tx attributes for Coexist */
			tx_objid	= op_td_get_int (pkptr_prev, OPC_TDA_RA_TX_OBJID);	
			op_ima_obj_attr_get(tx_objid, "Coexistence Transceiver Type", &tx_type);
			txi_objid	= op_td_get_int (pkptr_arriv, OPC_TDA_RA_TX_OBJID);	
			op_ima_obj_attr_get(txi_objid, "Coexistence Transceiver Type", &txi_type);
			if (tx_type == COEXIST_TR_TYPE_BLUETOOTH)
				{
				/* For Bluetooth we need to see if this is a real collision */
				arrive_tx_freq	= op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_TX_FREQ);
				arrive_tx_bw	= op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_TX_BW);
				prev_tx_freq	= op_td_get_dbl (pkptr_prev, OPC_TDA_RA_TX_FREQ);
				prev_tx_bw		= op_td_get_dbl (pkptr_prev, OPC_TDA_RA_TX_BW);
				if (txi_type == COEXIST_TR_TYPE_BLUETOOTH)
						{
						}
				//printf("Arrive %lf to %lf and prev %lf to %lf\n", arrive_tx_freq, arrive_tx_bw, prev_tx_freq, prev_tx_bw);
				if ((arrive_tx_freq >= prev_tx_freq + prev_tx_bw) || (arrive_tx_freq + arrive_tx_bw <= prev_tx_freq))
					{
					/* This is not a real collision set add no more interference noise */					
					}
				else
					{
					prev_noise_accum = op_td_get_dbl (pkptr_prev, OPC_TDA_RA_NOISE_ACCUM);
					op_td_set_dbl (pkptr_prev, OPC_TDA_RA_NOISE_ACCUM,
						prev_noise_accum + arriv_rcvd_power);
					/* Increment number of collisions in arriving packet. */
					op_td_set_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS, 
					op_td_get_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS) + 1);
					}
				}
			else
				{
				prev_noise_accum = op_td_get_dbl (pkptr_prev, OPC_TDA_RA_NOISE_ACCUM);
				op_td_set_dbl (pkptr_prev, OPC_TDA_RA_NOISE_ACCUM,
					prev_noise_accum + arriv_rcvd_power);
				/* Increment number of collisions in arriving packet. */
				op_td_set_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS, 
					op_td_get_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS) + 1);
				}
			}
		}

	FOUT;
	}                
