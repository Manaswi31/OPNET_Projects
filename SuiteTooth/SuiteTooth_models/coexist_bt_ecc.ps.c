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

/* coexist_bt_ecc.ps.c */
/* Error correction model for radio link Transceiver Pipeline */

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

int 			Initialize_Formats = OPC_TRUE;
List*			Format_List;

static int      pkloss_vars_init = OPC_FALSE;

Stathandle      Gb_bt_pkloss_rate_stat;
double          Gb_bt_pk_reception_count;
double          Gb_bt_pk_loss_count;

Stathandle      Gb_wlan_pkloss_rate_stat;
double          Gb_wlan_pk_reception_count;
double          Gb_wlan_pk_loss_count;





/* Prototypes */
List* 					Read_Formats(void);
Format_Information*  	Get_Format_Info(char* format);

#if defined (__cplusplus)
extern "C"
#endif
void
coexist_bt_ecc (Packet * pkptr)
    {
	int						pklen, num_errs, accept;
	int						i, j;
	int						preamble_errors;
	Objid					rx_ch_obid; 
	double					ecc_thresh;
	List*					error_list;
	char					pk_format[50];
	int*					check_bit;
	int*					current_bit;
	Format_Information*		format_info;
	double bt_pk_loss_rate;
	double wlan_pk_loss_rate;
	Objid  rx_objid;
	int    rx_type;
	int	   payload_errors;



	/** Determine acceptability of given packet at receiver. **/
	FIN (coexist_bt_ecc (pkptr));

	/* Initialize the format list if this is the first invocation */
	if (Initialize_Formats == OPC_TRUE)
		{
		Format_List = Read_Formats();
		Initialize_Formats = OPC_FALSE;
		}
	
	/* Initialize pkloss variables */
	if (!pkloss_vars_init)
		{
		Gb_bt_pk_reception_count   = 0;
		Gb_bt_pk_loss_count        = 0;
		Gb_wlan_pk_reception_count = 0;
        Gb_wlan_pk_loss_count      = 0;
		pkloss_vars_init           = OPC_TRUE;
		}
	rx_objid	= op_td_get_int (pkptr, OPC_TDA_RA_RX_OBJID);
	op_ima_obj_attr_get(rx_objid, "Coexistence Transceiver Type", &rx_type);

	
	/* Do not accept packets that were received	*/
	/* when the node was disabled.				*/
	if (op_td_is_set (pkptr, OPC_TDA_RA_ND_FAIL))
		accept = OPC_FALSE;
	else
		{
		/* Obtain the error correction threshold of the receiver. */
		/* ecc_thresh = op_td_get_dbl (pkptr, OPC_TDA_RA_ECC_THRESH); */

		/* Obtain length of packet. */
		pklen = op_pk_total_size_get (pkptr);

		/* Test if packets have bits. */
		if (pklen == 0)
			op_sim_end("ECC detects a zero length packet", "", "", "");

		/* Obtain number of errors in packet. */
		num_errs = op_td_get_int (pkptr, OPC_TDA_RA_NUM_ERRORS);
		
		if (num_errs == 0)
			{
			/* Accept a perfect packet */
			accept = OPC_TRUE;
			}
		else
			{
			/* There are some errors */
			
			/* Get the packet format */
			op_pk_format(pkptr, pk_format);

			/* Get the format information */
			format_info = Get_Format_Info(pk_format);
			accept=OPC_TRUE;			
			if (format_info->ecc_type == QUICK_CHECK)
				{
				/* No FEC assume dra_ecc calculations */
				
				/* Obtain the error correction threshold of the receiver. */
				ecc_thresh = op_td_get_dbl (pkptr, OPC_TDA_RA_ECC_THRESH);
				/* Check if this too many errors */
				accept = ((((double) num_errs) / pklen) <= ecc_thresh) ? OPC_TRUE : OPC_FALSE;

				}
			else /* Assume FEC Level is the ecc_type */
				{

				/* There are some errors */
			    /* Get the error list */
			    error_list = (List*) op_td_get_ptr(pkptr, OPC_TDA_RA_MAX_INDEX + COEXIST_FIELD_LIST_OF_ERRORS);
				if (format_info->ecc_type == FEC_NONE && format_info->crc == OPC_TRUE)
					{
					num_errs = op_prg_list_size (error_list);
					}
				else if (num_errs != op_prg_list_size(error_list))
					op_sim_end("The number of errors does not correspond with the error list", "", "", "");
				
				/* Set the payload errors to zero */
				preamble_errors = 0;
				payload_errors = 0;
				
				/* FEC is being used go through the error list and see if errors can be corrected */
				for (i = 0; i < num_errs; i++)
					{
					check_bit = (int*) op_prg_list_access(error_list, i);
				
					if (*check_bit >= format_info->preamble_bits)
						{
						/* The error is not in the preamble */
						
						if (*check_bit >= (format_info->preamble_bits + format_info->header_bits))
							{
							/* The error is not in the header*/
							
							if(format_info->ecc_type != FEC_NONE)
								{
								/* FEC is applied to this payload */
							
								/* Compare this error location to all other error locations */
								for (j = 0; j < i; j++)
									{
									current_bit = (int*) op_prg_list_access(error_list, j);
							
									/* Error is in the payload and FEC is applied*/
									switch (format_info->ecc_type)
									{
									case FEC_2_3:   /* 2/3 FEC applied */
										
										if ( ((*check_bit - (format_info->preamble_bits + format_info->header_bits))/15) 
												== ((*current_bit - (format_info->preamble_bits + format_info->header_bits))/15) )
											{
											
											/* Uncorrectable error */
											payload_errors++;
										    if ((format_info->crc == OPC_TRUE) && (payload_errors > format_info->max_payload_errors))
												{
												/* CRC will detect the error and destroy the packet */
												accept = OPC_FALSE;
												i = j = num_errs; /* No need to continue the loop for the destroyed packet */
												}
											}
									break;

									case FEC_1_3:   /* 1/3 FEC applied */
										
										if ( ((*check_bit - (format_info->preamble_bits + format_info->header_bits))/3 
												== (*current_bit - (format_info->preamble_bits + format_info->header_bits))/3) 
												&& ((*check_bit == *current_bit-1) || (*check_bit == *current_bit+1)) )
											{
											
											/* Uncorrectable error */
											payload_errors++;
											
										    if ((format_info->crc == OPC_TRUE) && (payload_errors > format_info->max_payload_errors))
												{
												/* CRC will detect the error and destroy the packet */
												accept = OPC_FALSE;
												i = j = num_errs; /* No need to continue the loop for the destroyed packet */
												}
											}
									break;
									}//end switch
								
									}// end for loop
								} // end FEC applied to payload
													
							else 
								{
								/* No FEC applied */
								payload_errors++;
								/* A single bit error in the payload of NO FEC BT ACL packets cannot be recovered */
								/* This corresponds to Bluetooth DH(1|3|5)                                 */
								if (format_info->crc == OPC_TRUE)
									{
									accept = OPC_FALSE;
									//break;
									}
								}
					
							/* if not crc then assume the number payload errors can be put into a error field */
							if (format_info->crc == OPC_FALSE)
								{
								op_pk_nfd_set (pkptr, "Errors", payload_errors);
								if (pk_format[0] == "H" && pk_format[1] == "V")
									{
									
									}
								
								}
							
						   
							}
						else /* Error is in header */	
							{			
							for (j = 0; j < i; j++)
								{
								current_bit = (int*) op_prg_list_access(error_list, j);
								
								/* ASSUME - 1/3 FEC check */
								if ( ((*check_bit - format_info->preamble_bits)/3 == (*current_bit - format_info->preamble_bits)/3) 
										&& ((*check_bit == *current_bit-1) || (*check_bit == *current_bit+1)) )
									{			
									/* Reject the packet */
									accept = OPC_FALSE;
									i = j = num_errs;
									}
								}//end for loop
							}// end else header error

						}
					else /* Error is in the preamble */
						{
						if ((*check_bit >= format_info->preamble_start_bit) && (*check_bit < format_info->preamble_end_bit))
							{
							/* Error is in an important part of the preamble */
							preamble_errors++;
							}
						
						if (preamble_errors > format_info->max_preamble_errors)
							{
							/* TOO many errors in the preamble */
							accept = OPC_FALSE;
							i = num_errs;
							}
						}// preamble error
					} /* i for loop */
					op_prg_list_free(error_list);
			        op_prg_mem_free(error_list);
				} /* FEC processing else */

			} /* Error processing else */
		}
	
	/* Calculate overall simulation packet loss rate    */
	/*  and write to a global statistic                 */
	/* Currently only for Bluetooth and/or WLAN packets */
	/*  but can be adapted to any receiver type         */
	if (rx_type == COEXIST_TR_TYPE_BLUETOOTH)
		{
		/* This is a Bluetooth packet; increment count of all simulation-wide */
		/*  Bluetooth packets */
		Gb_bt_pk_reception_count += 1.;
		
		/* Uncorrectable errors exist; increment count of all simulation-wide */
		/*  Bluetooth packets lost */
		if (accept == OPC_FALSE)
			Gb_bt_pk_loss_count += 1.;
		
		/* calculate loss rate and write to global stat */
		bt_pk_loss_rate = Gb_bt_pk_loss_count/Gb_bt_pk_reception_count;
		op_stat_write (Gb_bt_pkloss_rate_stat, bt_pk_loss_rate);
		
		}
	else if (rx_type == COEXIST_TR_TYPE_WLAN)
		{
		/* This is a WLAN packet; increment count of all simulation-wide */
		/*  WLAN packets */
		Gb_wlan_pk_reception_count += 1.;
		
		/* Uncorrectable errors exist; increment count of all simulation-wide */
		/*  WLAN packets lost */
		if (accept == OPC_FALSE)
			Gb_wlan_pk_loss_count += 1.;
		
		/* calculate loss rate and write to global stat */
		wlan_pk_loss_rate = Gb_wlan_pk_loss_count/Gb_wlan_pk_reception_count;
		op_stat_write (Gb_wlan_pkloss_rate_stat, wlan_pk_loss_rate);

		}


	/* Place flag indicating accept/reject in the data packet control field. */
	op_pk_nfd_set (pkptr, "Accept", accept);
    
	/* Force the simulation kernel to always accpet the packet. The 			*/
	/* actual discarding of the packet will take place at the MAC layer of the  */
	/* receiving node receiving this packet.                                  	*/
	op_td_set_int (pkptr, OPC_TDA_RA_PK_ACCEPT, OPC_TRUE);


	/* In either case the receiver channel is no longer locked. */
	rx_ch_obid = op_td_get_int (pkptr, OPC_TDA_RA_RX_CH_OBJID);
	op_ima_obj_attr_set (rx_ch_obid, "signal lock", OPC_BOOLINT_DISABLED);

	FOUT;
	}

/********************************************************/
/* FUNCTION		Read_Formats(void);						*/
/* PURPOSE		Read in the format information GDF File */
/* 				and construct a list of fomat info	  	*/
/* 				structures 								*/
/* PARAMETERS	NONE									*/
/* RETURN		List* to the format info list			*/
/********************************************************/

List* 	Read_Formats(void)

	{
	char					file_name[50];
	char					temp_str[50];
	int						i;
	int						file_size, line_size;
	List*					file_list_ptr;
	List*					line_list_ptr;
	List*					format_list;
	Format_Information*		format_info;	

	
	FIN (List* Read_Formats(void));
	
	/* Create the list */
	format_list = op_prg_list_create();
	
	/* Read in the format gdf simulation attribute */
	op_ima_sim_attr_get(OPC_IMA_STRING, "Format Information File", &file_name);
	
	/* Red the file into a list pointer */
	file_list_ptr = op_prg_gdf_read(file_name);
	file_size = op_prg_list_size(file_list_ptr);
	
	/* loop the lines in the file */
	for (i = 0; i < file_size; i++)
		{
		line_list_ptr = op_prg_str_decomp(op_prg_list_access(file_list_ptr, i), ",");
		
		/* Get the number of fields */
		line_size = op_prg_list_size(line_list_ptr);
		if (line_size != FORMAT_FILE_FIELDS)
			op_sim_end("The Format Information file does not have enough fields", "", "", "");
		
		/* Allocate the field info structure */
		format_info = (Format_Information*) op_prg_mem_alloc(sizeof(Format_Information));

		/* Parse the fields */

		/* Field 0 is the format name */
		strcpy(format_info->fmt_name, op_prg_list_access(line_list_ptr, 0));
		
		/* Field 1 is the ecc_type */
		strcpy(temp_str, op_prg_list_access(line_list_ptr, 1));
		
		/* We must check the differenet check types */
		if (strcmp(temp_str, "FEC_NONE") == 0)
			format_info->ecc_type = FEC_NONE;
		else if (strcmp(temp_str, "FEC_2_3") == 0)
			format_info->ecc_type = FEC_2_3;
		else if (strcmp(temp_str, "FEC_1_3") == 0)
			format_info->ecc_type = FEC_1_3;
		else if (strcmp(temp_str, "QUICK_CHECK") == 0)
			format_info->ecc_type = QUICK_CHECK;
		
		/* Field 2 is CRC enabled? */
		strcpy(temp_str, op_prg_list_access(line_list_ptr, 2));
		
		if (temp_str[0] == 'T' || temp_str[0] == 't')
			format_info->crc = OPC_TRUE;
		else if (temp_str[0] == 'F' || temp_str[0] == 'f')
			format_info->crc = OPC_FALSE;
		 
	   
	    /* Other fields are not need for QUICK_CHECK formats */
		if (format_info->ecc_type != QUICK_CHECK)
			{
			/* Field 3 is the number of preamble bits */
			format_info->preamble_bits = atoi(op_prg_list_access(line_list_ptr, 3));
			
			/* Field 4 is the start of the valid preamble bits */
			format_info->preamble_start_bit = atoi(op_prg_list_access(line_list_ptr, 4));
			
			/* Field 5 is the end of the valid preamble bits */
			format_info->preamble_end_bit = atoi(op_prg_list_access(line_list_ptr, 5));
  
			/* Field 6 is allowable number of preamble errors */
			format_info->max_preamble_errors = atoi(op_prg_list_access(line_list_ptr, 6));

			/* Field 7 is the number of header bits */
			format_info->header_bits = atoi(op_prg_list_access(line_list_ptr, 7));
  
			/* Field 8 is allowable number of preamble errors */
			format_info->max_payload_errors = atoi(op_prg_list_access(line_list_ptr, 8));
			}
		
		/* Insert the information into the format list */
		op_prg_list_insert(format_list, format_info, OPC_LISTPOS_TAIL);
		
		/* free the line list ptr */
		op_prg_list_free(line_list_ptr);
		op_prg_mem_free(line_list_ptr);
		}
	/* free the file list ptr */
	op_prg_list_free(file_list_ptr);
	op_prg_mem_free(file_list_ptr);
	
	/* Return the list */
	FRET(format_list);
	}
	
/********************************************************/
/* FUNCTION		Get_Format_Info;						*/
/* PURPOSE		Get the format information from the 	*/
/* 				Format List by using the format name   	*/
/* 				as the index							*/
/* PARAMETERS	string  format name						*/
/*				struct  format information				*/
/* RETURN		NONE									*/
/********************************************************/

Format_Information*  Get_Format_Info(char* format)
	{
	
	int						i;
	int						count;
	Format_Information*     fmt_info;
	
	FIN (void  Get_Format_Info(char* format, Format_Information* fmt_info));
	
	/* Get the size of the Format List */
	count = op_prg_list_size(Format_List);
	
	for (i = 0; i < count; i++)
		{
		/* Get the info */
		fmt_info = (Format_Information*) op_prg_list_access(Format_List, i);
		
		/* Compare names */
		if (strcmp(fmt_info->fmt_name, format) == 0)
			{
			/* Found the info return the structure */
			FRET(fmt_info);
			}
		}

	/* Format was not found */
	op_sim_end("Invalid format", "This format was not in the Format Information GDF", "", "");
	
	FRET(OPC_NIL);
	}

