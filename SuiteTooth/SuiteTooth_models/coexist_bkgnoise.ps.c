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

/* coexist_bkgnoise.ps.c */                                                       
/* Background noise model for radio link Transceiver Pipeline */

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


/***** constants *****/

#define BOLTZMANN			1.379E-23
#define BKG_TEMP			290.0
#define AMB_NOISE_LEVEL		8.6697E-19


/***** procedure *****/

#if defined (__cplusplus)
extern "C"
#endif
void
coexist_bkgnoise (Packet * pkptr)
	{
	double		rx_noisefig, rx_temp, rx_bw;
	double		bkg_temp, bkg_noise, amb_noise;

	/** Compute noise sources other than transmission interference. **/
	FIN (coexist_bkgnoise (pkptr));

	/* Get receiver noise figure. */
	rx_noisefig = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_NOISEFIG);

	/* Calculate effective receiver temperature. */
	rx_temp = (rx_noisefig - 1.0) * 290.0;

	/* Set the effective background temperature. */
	bkg_temp = BKG_TEMP;

	/* Get receiver channel bandwidth (in Hz). */
	rx_bw = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_BW);

	/* Calculate in-band noise from both background and thermal sources. */
	bkg_noise = (rx_temp + bkg_temp) * rx_bw * BOLTZMANN;

	/* Calculate in-band ambient noise. */
	amb_noise = rx_bw * AMB_NOISE_LEVEL;

	/* Put the sum of both noise sources in the packet transmission data attr. */
	op_td_set_dbl (pkptr, OPC_TDA_RA_BKGNOISE, (amb_noise + bkg_noise));

	FOUT;
	}
