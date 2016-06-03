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

/* coexist_wlan_rxgroup.ps.c */                                                       
/* Modified receiver group model for IEEE802.11.	*/
/* It uses channel state on radio transmitters and	*/
/* receiver objects to speed up eligible receiver	*/
/* pairs (the state information can be freed at		*/
/* time 0, as it is not used later).				*/

/* Modified for HSI's Bluetooth coexistence models */

/****************************************/
/*	   Copyright (c) 1993 - 2002		*/
/*		by OPNET Technologies, Inc.		*/
/*		(A Delaware Corporation)		*/
/*	7255 Woodmont Av., Suite 250  		*/
/*     Bethesda, MD 20814, U.S.A.       */
/*			All Rights Reserved.		*/
/****************************************/

#include <opnet.h>

#if defined (__cplusplus)
extern "C"
#endif
int
coexist_wlan_rxgroup (Objid tx_ch_objid, Objid rx_ch_objid)	
	{
	typedef struct
		{
		Objid	node_objid;
		Objid	snet_objid;
		double	data_rate;
		} WlanT_Channel_Info;

	WlanT_Channel_Info*		tx_ch_info_ptr;
	WlanT_Channel_Info*		rx_ch_info_ptr;
	static Pmohandle		ch_info_handle = OPC_NIL;
	
	/** Determine the potential for communication between	**/
	/** given transmitter and receiver channel objects.		**/
	FIN (coexist_wlan_rxgroup (tx_ch_objid, rx_ch_objid));

	/* Check if we have already created a handle to store	*/
	/* transmitter as well as receiver channel state. 		*/
	if (ch_info_handle == OPC_NIL)
		{
		ch_info_handle = prg_pmo_define ("WLAN Channel Information", sizeof (WlanT_Channel_Info), 100);
		prg_pmo_properties_set (ch_info_handle, PRGC_MEM_DONT_CLEAR);
		}
	
	/* Obtain transmitter channel information. */
	tx_ch_info_ptr = (WlanT_Channel_Info *) op_ima_obj_state_get (tx_ch_objid);
	if (tx_ch_info_ptr == OPC_NIL)
		{
		/* We need to create this state first... */
		tx_ch_info_ptr = (WlanT_Channel_Info *) prg_pmo_alloc (ch_info_handle);
		tx_ch_info_ptr->node_objid = op_topo_parent (op_topo_parent (op_topo_parent (tx_ch_objid)));
		tx_ch_info_ptr->snet_objid = op_topo_parent (tx_ch_info_ptr->node_objid);
		op_ima_obj_attr_get (tx_ch_objid, "data rate", &(tx_ch_info_ptr->data_rate));
		
		/* ...and set it for future use. */
		op_ima_obj_state_set (tx_ch_objid, tx_ch_info_ptr);
		}
	
	/* Obtain receiver channel information. */
	rx_ch_info_ptr = (WlanT_Channel_Info *) op_ima_obj_state_get (rx_ch_objid);
	if (rx_ch_info_ptr == OPC_NIL)
		{
		/* We need to create this state first... */
		rx_ch_info_ptr = (WlanT_Channel_Info *) prg_pmo_alloc (ch_info_handle);
		rx_ch_info_ptr->node_objid = op_topo_parent (op_topo_parent (op_topo_parent (rx_ch_objid)));
		rx_ch_info_ptr->snet_objid = op_topo_parent (rx_ch_info_ptr->node_objid);
		op_ima_obj_attr_get (rx_ch_objid, "data rate", &(rx_ch_info_ptr->data_rate));
		
		/* ...and set it for future use. */
		op_ima_obj_state_set (rx_ch_objid, rx_ch_info_ptr);
		}
	
	/* Now we are ready to perform eligible receiver checks. */
	
    /* 1. Station should not hear its own transmission.	*/
	if (tx_ch_info_ptr->node_objid == rx_ch_info_ptr->node_objid)
		{
		FRET (OPC_FALSE);
    	}
 
  
	
	/* This is a eligible receiver; return TRUE. */
	FRET (OPC_TRUE);
	}                
