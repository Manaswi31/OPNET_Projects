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

/* coexist_bt_error.ps.c */                                                       
/* Default error allocation model for radio link Transceiver Pipeline */

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
#include <math.h>
#include "Coexist_Pipeline.h"


/* Define a convenient macro for computing	*/
/* factorials using the gamma function.		*/
#define log_factorial(n)		lgamma ((double) n + 1.0)
extern double lgamma (double);



#if defined (__cplusplus)
extern "C"
#endif
void
coexist_bt_error (Packet * pkptr)
	{
	double		pe, r, p_accum, p_exact;
	double		data_rate, elap_time;
	double		log_p1, log_p2, log_arrange;
	int			seg_size, num_errs, prev_num_errs;
	int			invert_errors = OPC_FALSE;
	/* Coexist added */
	List*		error_list;
	double		rx_start_time;
	int			first_bit;
	int			i, j, new_loc;
	int*		error_location;
	int*		prev_error_loc;
	char        pk_type[30];
	Format_Information*		format_info;
	extern Initialize_Formats;
	extern Format_List;
	extern Read_Formats();
	extern Get_Format_Info(char*);

	
	/** Compute the number of errors assigned to a segment of bits within	**/
	/** a packet based on its length and the bit error probability.			**/
	FIN (coexist_btr_error (pkptr));
	/* Obtain the expected Bit-Error-Rate 'pe' */
	pe = op_td_get_dbl (pkptr, OPC_TDA_RA_BER);
	/* Calculate time elapsed since last BER change */
	elap_time = op_sim_time () - op_td_get_dbl (pkptr, OPC_TDA_RA_SNR_CALC_TIME);
	
	/* Use datarate to determine how many bits in the segment. */
	data_rate = op_td_get_dbl (pkptr, OPC_TDA_RA_RX_DRATE);
	seg_size = elap_time * data_rate;

	/* Coexist - Calculate the first bit location of this segment */
	rx_start_time = op_td_get_dbl(pkptr, OPC_TDA_RA_START_RX);
	first_bit = (int) floor((op_td_get_dbl (pkptr, OPC_TDA_RA_SNR_CALC_TIME) - rx_start_time) * data_rate);

	/* Case 1: if the bit error rate is zero, so is the number of errors. 	*/
    if (pe == 0.0 || seg_size == 0)
		num_errs = 0;

	/* Case 2: if the bit error rate is 1.0, then all the bits are in error.	*/
	/* (note however, that bit error rates should not normally exceed 0.5).		*/
	else if (pe >= 1.0)
		num_errs = seg_size;

	/* Case 3: The bit error rate is not zero or one. */
	else
		{
		/* If the bit error rate is greater than 0.5 and less than 1.0, invert	*/
		/* the problem to find instead the number of bits that are not in error	*/
		/* in order to accelerate the performance of the algorithm.  Set a flag	*/
		/* to indicate that the result will then have to be inverted.			*/
		if (pe > 0.5)
			{
			pe = 1.0 - pe;
			invert_errors = OPC_TRUE;	
			}
	
		/* The error count can be obtained by mapping a uniform random number 	*/
		/* in [0, 1[ via the inverse of the cumulative mass function (CMF) 		*/
		/* for the bit error count distribution. 								*/
	
		/* Obtain a uniform random number in [0, 1[ to represent 		*/
		/* the value of the CDF at the outcome that will be produced. 	*/
		r = op_dist_uniform (1.0);

		/* Integrate probability mass over possible outcomes until r is exceeded. 	*/
		/* The loop iteratively corresponds to "inverting" the CMF since it finds	*/
		/* the bit error count at which the CMF first meets or exceeds the value r.	*/
		for (p_accum = 0.0, num_errs = 0; num_errs <= seg_size; num_errs++)
			{
			/* Compute the probability of exactly 'num_errs' bit errors occurring.	*/
	
			/* The probability that the first 'num_errs' bits will be in error 		*/
			/* is given by pow (pe, num_errs). Here it is obtained in logarithmic	*/
			/* form to avoid underflow for small 'pe' or large 'num_errs'.			*/
			log_p1 = (double) num_errs * log (pe);
	
			/* Similarly, obtain the probability that the remaining bits will not 	*/
			/* be in error. The combination of these two events represents one 		*/
			/* possible configuration of bits yielding a total of 'num_errs' errors.*/
			log_p2 = (double) (seg_size - num_errs) * log (1.0 - pe);
	
			/* Compute the number of arrangements that are possible with the same 	*/
			/* number of bits in error as the particular case above. Again obtain 	*/
			/* this number in logarithmic form (to avoid overflow in this case).	*/
			/* This result is expressed as the logarithmic form of the formula for	*/
			/* the number N of combinations of k items from n:  N = n!/(n-k)!k!		*/
			log_arrange = 	log_factorial (seg_size) -
							log_factorial (num_errs) - 
							log_factorial (seg_size - num_errs);
	
			/* Compure the probability that exactly 'num_errs' are present 	*/
			/* in the segment of bits, in any arrangement.					*/
			p_exact = exp (log_arrange + log_p1 + log_p2);
		
			/* Add this to the probability mass accumulated so far for previously 	*/
			/* tested outcomes to obtain the value of the CMF at outcome = num_errs.*/
			p_accum += p_exact;
	
			/*'num_errs' is the outcome for this trial if the CMF meets or exceeds 	*/
			/* the uniform random value selected earlier. 							*/
			if (p_accum >= r)
				break;
			}

		/* If the bit error rate was inverted to compute correct bits instead, then */
		/* Reinvert the result to obtain the number of bits in error. 				*/
		if (invert_errors == OPC_TRUE)
			num_errs = seg_size - num_errs;
		}
	

	/* Increase number of bit errors in packet transmission data attribute. */
	prev_num_errs = op_td_get_int (pkptr, OPC_TDA_RA_NUM_ERRORS);
	op_td_set_int (pkptr, OPC_TDA_RA_NUM_ERRORS, num_errs + prev_num_errs);
    op_pk_format (pkptr, pk_type);
	
	/* Coexist - If there are errors in this segment allocate thier location */
	if (num_errs > 0 && (pk_type[0] != 'w' && pk_type[1] != 'l'))
		{

		/* Initialize the format list if this is the first invocation */
		if (Initialize_Formats == OPC_TRUE)
			{
			Format_List = Read_Formats();
			Initialize_Formats = OPC_FALSE;
			}

		
		/* Get the format information */
		/* We'll use this info to bail on the first bit found in the */
		/*  payload of a Bluetooth DH(1|3|5) packet to increase performance */
		format_info = Get_Format_Info(pk_type);

		
		/* There are some errors */
		if (prev_num_errs == 0)
			{
			/* We not gotten any errors yet so we need to create the list */
			error_list = op_prg_list_create();
			}
		else 
			{
			/* We have previous errors so we need to retrive that list */
			error_list = (List*) op_td_get_ptr(pkptr, OPC_TDA_RA_MAX_INDEX + COEXIST_FIELD_LIST_OF_ERRORS);
			}

		/* Allocate each error */
		for (i = 0; num_errs > i; i++)
			{
			error_location = (int*) op_prg_mem_alloc(sizeof(int));
			/* Set up the new location while loop */
			new_loc = OPC_FALSE;
			while (new_loc == OPC_FALSE)
				{
				new_loc = OPC_TRUE;
				/* Roll the dice on the location in the segment */			
				*error_location = ((int) floor(op_dist_uniform(seg_size))) + first_bit;
				/* Check to see if this is a Bluetooth DH(1|3|5) packet */
				if (format_info->crc == OPC_TRUE && format_info->ecc_type == FEC_NONE)
					{
					/* check to see if the error falls in the payload */
					if (*error_location >= (format_info->preamble_bits + format_info->header_bits))
						{
						/*  discontinue further error allocations, since a single */
						/*  error to the payload of this packet will cause it to fail. */
						i = num_errs;
						prev_num_errs = num_errs;
						}
					}
				/* Make sure this error is not in the same place as a prevous selection */
				for (j = prev_num_errs; j < i; j++)
					{
					prev_error_loc = (int*) op_prg_list_access(error_list, j);
					if (*prev_error_loc == *error_location)
						{
						/* This was already determined to be an error location */
						new_loc = OPC_FALSE;
						break; /* j loop */
						}
					} /* j loop */
				} /* while loop */
			/* This location is unique */
			op_prg_list_insert(error_list, error_location, OPC_LISTPOS_TAIL);
			} /* i loop */

		/* Set the list back into the TD attributes */
		op_td_set_ptr(pkptr, OPC_TDA_RA_MAX_INDEX + COEXIST_FIELD_LIST_OF_ERRORS, error_list);
		}

	/* Assign actual (allocated) bit-error rate over tested segment. */
	if (seg_size != 0)
		op_td_set_dbl (pkptr, OPC_TDA_RA_ACTUAL_BER, (double) num_errs / seg_size);
	else op_td_set_dbl (pkptr, OPC_TDA_RA_ACTUAL_BER, pe);
	FOUT;
	}

