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

/* coexist_wlan_inoise.ps.c */                                                       
/* Interference noise model for radio link Transceiver Pipeline */

/* Modified for HSI's Bluetooth coexistence models */

/****************************************/
/*		  Copyright (c) 1993-2002		*/
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
coexist_wlan_inoise (Packet * pkptr_prev, Packet * pkptr_arriv)
	{
	int			arriv_match, prev_match;
	double		prev_rcvd_power, arriv_rcvd_power;
	double		arriv_noise_accum, prev_noise_accum;

	/** Evaluate a collision due to arrival of 'pkptr_arriv'	**/
	/** where 'pkptr_prev' is the packet that is currently		**/
	/** being received.											**/
	FIN (coexist_wlan_inoise (pkptr_prev, pkptr_arriv));

	/* If the previous packet ends just as the new one begins, this is not	*/
	/* a collision (just a near miss, or perhaps back-to-back packets).		*/ 
	if (op_td_get_dbl (pkptr_prev, OPC_TDA_RA_END_RX) != op_sim_time ())
		{
		/* Increment the number of collisions in previous packet. */
		op_td_set_int (pkptr_prev, OPC_TDA_RA_NUM_COLLS, 
				op_td_get_int (pkptr_prev, OPC_TDA_RA_NUM_COLLS) + 1);

		/* Increment number of collisions in arriving packet. */
		op_td_set_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS, 
				op_td_get_int (pkptr_arriv, OPC_TDA_RA_NUM_COLLS) + 1);

		/* Determine if previous packet is valid or noise. */
		prev_match = op_td_get_int (pkptr_prev, OPC_TDA_RA_MATCH_STATUS);

		/* Determine if arriving packet is valid or noise. */
		arriv_match = op_td_get_int (pkptr_arriv, OPC_TDA_RA_MATCH_STATUS);
		
		/* Get received power levels for both packets. */
		prev_rcvd_power = op_td_get_dbl (pkptr_prev, OPC_TDA_RA_MAX_INDEX + COEXIST_ACTUAL_RX_POWER);
		arriv_rcvd_power = op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_MAX_INDEX + COEXIST_ACTUAL_RX_POWER);

		/* If the arriving packet is valid, calculate		*/
		/* interference of previous packet on arriving one.	*/
		if (arriv_match == OPC_TDA_RA_MATCH_VALID)
			{
			arriv_noise_accum = op_td_get_dbl (pkptr_arriv, OPC_TDA_RA_NOISE_ACCUM);
			op_td_set_dbl (pkptr_arriv, OPC_TDA_RA_NOISE_ACCUM,
				arriv_noise_accum + prev_rcvd_power);
			}

		/* And vice-versa. */
		if (prev_match == OPC_TDA_RA_MATCH_VALID)
			{
			prev_noise_accum = op_td_get_dbl (pkptr_prev, OPC_TDA_RA_NOISE_ACCUM);
			op_td_set_dbl (pkptr_prev, OPC_TDA_RA_NOISE_ACCUM,
				prev_noise_accum + arriv_rcvd_power);
			}
		}

	FOUT
	}                
