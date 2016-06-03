MIL_3_Tfile_Hdr_ 1800 175A modeler 9 56908165 56BBF56F 52 volta chaganti 0 0 none none 0 0 none 2F43E94E 4356 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                ��g�      D  �  �  
z  
~  O  ?}  ?�  ?�  ?�  ?�  AN  AR  ?  K      ApplicationStart Time   �������      sec       @      ����              ����              ����           �Z             ApplicationDuration   �������      sec       @�      ����              ����              ����           �Z             ApplicationLocal Port    �������    ����          ����          ����          ����           �Z             ApplicationRemote Port    �������    ����          ����          ����          ����           �Z             ApplicationRemote IP Address   �������   ����          N.O.N.E      ����      ����           �Z             #ApplicationPacket Interarrival PDF   �������   ����          exponential      ����      ����         constant      constant      exponential      exponential      uniform      uniform          �Z             $ApplicationPacket Interarrival Args   �������      sec          5.0      ����      ����           �Z             ApplicationPacket Size PDF   �������   ����          exponential      ����      ����         constant      constant      exponential      exponential      uniform      uniform         This attribute specifies the   PDF (probability distribution   function) used to determine    time between packet arrivals.        �Z             ApplicationPacket Size Args   �������      bytes          8192      ����      ����         1024      1024      4096      4096      8192      8192         This attribute specifies the   mean length of the packets    being genarted.            �Z             ApplicationFast Send   �������   ����           ����          ����          ����             >Opens with passive open, then does a send to jump to SYN_SENT.�Z             ApplicationRepeat Count    �������       times          ����          ����          ����           �Z             ApplicationImmediate Close    �������    ����              Disabled          ����          ����         Disabled       ����      CLOSE      ����      
SEND w/FIN      ����       �Z                 	   begsim intrpt         
   ����   
   doc file            	nd_module      endsim intrpt             ����      failure intrpts            disabled      intrpt interval         ԲI�%��}����      priority              ����      recovery intrpts            disabled      subqueue                     count    ���   
   ����   
      list   	���   
          
      super priority             ����          .   Objid	\my_id;       Prohandle	\local_port;       TcpT_Port	\remote_port;       #InetT_Address	\remote_inet_ip_addr;       $ApiT_Tcp_App_Handle	\tcp_app_handle;       int	\connect_id;       InetT_Address	\inet_address;       %TcpT_Conn_Open_Options	\conn_options;       "InetT_Address	\local_inet_ip_addr;       Ici*	\command_ici_ptr;       Ici*	\tcp_open_ind_ici_ptr;       FILE*	\pFile;       int	\stream_count;       int	\child_count;       Prohandle	\child_proc;       int	\event;       ApiT_Tcp_App_Handle	\tcp_hndl;       int	\my_peer_id;       BgpT_Conn_Info*	\conn_info_ptr;       TcpT_Event*	\ev_ptr;       Prohandle	\my_pro_handle;       Objid	\my_pro_id;       Objid	\my_node_objid;          Packet*			pkptr;   int				intrpt_type;   int				intrpt_code;   InetT_Address	*remote_addr_ptr;   int				tcp_conn_id;   OpT_uInt32		incoming_payload;   char 			msg0[256];       ;/* Ici that accompanies the data and commands that are 		*/   )/* received from the TCP layer.								*/   Ici*				tcp_status_ind_ici_ptr;           ;/* Structure that carries information about the current		*/   </* interrupt that was received by the parent and messages	*/   +/* associated with that interrupt.							*/   "BgpT_Intrpt_Info*	intrpt_info_ptr;   static Pmohandle	ev_pmh;   .   #include "ip_addr_v4.h"   #include "tcp_api_v3.h"   #include <stdio.h>   #include <bgp.h>   #include <tcp_v3.h>   -//#include "1508_lab3_real_payload_support.h"       3/*	Define constants used in the process model.			*/   "#define	TCP_LAB_GEN_CONN_OPEN		100   ##define	TCP_LAB_GEN_CONN_CLOSE		200   "#define TCP_LAB_GEN_PK_CREATE		300       -/*	State transition macro definitions.					*/   B//#define	CONN_OPEN			((op_intrpt_type () == OPC_INTRPT_SELF) && \   5							 (op_intrpt_code () == TCP_LAB_GEN_CONN_OPEN))       C//#define CONN_ESTABLISHED	((intrpt_type == OPC_INTRPT_REMOTE) &&	\   1						 (intrpt_code == TCPC_IND_CONNECT_REQUEST))       >//#define	PKT_RECEIVE			(op_intrpt_type () == OPC_INTRPT_STRM)       F//#define	CONN_RELEASE		((op_intrpt_type () == OPC_INTRPT_REMOTE) && \   7							 (op_intrpt_code () == TCPC_IND_FIN_RECEIVED ||\   /							  op_intrpt_code () == TCPC_IND_CLOSED))       =//#define	TCP_INTRPT			(intrpt_type == OPC_INTRPT_REMOTE && \   %							 intrpt_code == TCPC_IND_NONE)       "/* Transition condition macros. */   (//#define CONN_OPEN			ev_ptr->event == 0   2#define CONN_ESTABLISHED	ev_ptr->event == OPEN_IND   .#define PKT_RECEIVE			ev_ptr->event == RECEIVE   2#define TCP_INTRPT			ev_ptr->event == OPEN_CONFIRM   .#define CONN_RELEASE		ev_ptr->event == RELEASE       /* TCP event codes */   #define CONN_OPEN 					0   #define OPEN_IND					1   #define OPEN_CONFIRM				2   #define RECEIVE						3   #define RELEASE						4   	       TcpT_Event 			event_record;   Rstatic void tcp_conn_error (const char* msg0, const char* msg1, const char* msg2);   <static TcpT_Event*  tcp_ev_analyze (const char* state_name);   4       /***** Event processing. *****/       static TcpT_Event*   'tcp_ev_analyze (const char* state_name)   	{   -	Boolean				conn_id_trace_active = OPC_FALSE;   	TcpT_Event*			evptr = OPC_NIL;       2	/** Initialize variables for this invocation. **/   #	FIN (tcp_ev_analyze (state_name));   	printf("AT TCP analyze\n");       	/* Record the state name. */   ,	//strcpy (tcb_ptr->state_name, state_name);       -	/* Determine the source of the interrupt. */   ,	//if (op_intrpt_type () == OPC_INTRPT_SELF)   	//	{   7		/* Since this is a self interrupt, we haven't been	*/   6		/* passed an event pointer.  Use the static event	*/   5		/* record to hold information about this event.		*/   	//	evptr = &event_record;   %	//	evptr->event = op_intrpt_code ();   	//	}   	//else   		//{   <		/* All other interrupts are invocations by the manager. */   3		//evptr = (TcpT_Event *) op_pro_argmem_access ();   1		evptr = (TcpT_Event *) op_pro_argmem_access ();   		if (evptr == OPC_NIL)   			{   G			tcp_conn_error ("Unable to get event pointer from argument memory.",   D				"Socket process invoked without event specification.", OPC_NIL);   			}   		//}       	   	FRET (evptr);   	}   %/**** Error handling functions *****/       static void   Etcp_conn_error (const char* msg0, const char* msg1, const char* msg2)   	{   8	/** Print an error message and exit the simulation. **/   )	FIN (tcp_conn_error (msg0, msg1, msg2));   	   M	op_sim_end ("Error in TCP socket process (tcp_conn_v3):", msg0, msg1, msg2);   	   	FOUT;   	}                                          �   �             INIT          
   =   ?/*	Obtain the object ID of this process' surrounding module.	*/   //my_id = op_id_self ();       ,/*	Schedule the start of operation.							*/   B//op_intrpt_schedule_self (op_sim_time (), TCP_LAB_GEN_CONN_OPEN);       )/*	Create the inet IP address 									*/   _//local_inet_ip_addr = inet_address_from_ipv4_address_create (ip_address_create ("192.0.0.2"));       A/* This application must register itself with the TCP API. The	*/   A/* API handle will be used on all subsequent calls to the API.	*/   ,//tcp_app_handle = tcp_app_register (my_id);       @/* Open the output file in which we will add the contents of 	*/   */* received application packets.								*/   E//pFile = fopen ("C:\\op_models\\1508_lab3_server_output.txt", "w");        /*if (!pFile)   	{   =	op_sim_end ("Output file could not be opened.", "", "", "");   	} */       /* Count input streams */   Y//stream_count = op_topo_assoc_count (op_id_self(), OPC_TOPO_ASSOC_IN, OPC_OBJTYPE_STRM);   //stream_count = 10;   .//printf("Stream count : %d\n", stream_count);       ./* Allocate array for child process handles */   R//child_proc = (Prohandle *) op_prg_mem_alloc (stream_count * sizeof (Prohandle));       (//my_peer_id			= conn_info_ptr->peer_id;   9	/* Acces theparent memory to initialize the neighbors	*/   0	/* IP Address and the neighbor AS number.				*/   <//conn_info_ptr	= (BgpT_Conn_Info *)op_pro_parmem_access ();   6/* The other piece of information that the parent 		*/   9	/* passes on to the child is the handle to interface 	*/   	/* with TCP.											*/       0//	tcp_hndl			= conn_info_ptr->tcp_intf_handle;        ;/* First initialize the object IDs corresponding to this**/   #	/* connection process. 									*/    	my_pro_handle = op_pro_self ();   )	my_pro_id	  = op_pro_id (my_pro_handle);   1	my_node_objid = op_topo_parent (op_id_self ());        8/* Acces theparent memory to initialize the neighbors	*/   0	/* IP Address and the neighbor AS number.				*/   ;	conn_info_ptr	= (BgpT_Conn_Info *)op_pro_parmem_access ();       6/* The other piece of information that the parent 		*/   9	/* passes on to the child is the handle to interface 	*/   	/* with TCP.											*/   4	tcp_app_handle			= conn_info_ptr->tcp_intf_handle;    >printf("i  am child: %d\n", conn_info_ptr->tcp_connection_id);       4/* Initialize variables for this invocation. 					*/   1//ev_ptr	= (TcpT_Event *)op_pro_parmem_access ();   !ev_ptr = tcp_ev_analyze ("INIT");           
       
   M   6/*	Determine the Interrupt Type and Interrupt Code.	*/   6/*	This is used to determine state transitions and		*/   !/*	process model logic.								*/   "//intrpt_type = op_intrpt_type ();   "//intrpt_code = op_intrpt_code ();   6/*	Determine the Interrupt Type and Interrupt Code.	*/   6/*	This is used to determine state transitions and		*/   !/*	process model logic.								*/       !ev_ptr = tcp_ev_analyze ("OPEN");       /*switch (ev_ptr->event)   	{   	case TCPC_EV_RECEIVE:   		{   		   		break;   		}       	case TCPC_EV_ABORT:   		break;       	case TCPC_EV_SEG_ARRIVAL:   		{   		   		break;   		}        	case TCPC_EV_TIMEOUT_TIME_WAIT:   		{   		   		break;   		}       		default:   		{   		break;   		}   	}   */           :printf("RECEIVED SERVER CONN ESTAB : %d\n",ev_ptr->event);    intrpt_type = op_intrpt_type ();    intrpt_code = op_intrpt_code ();       ;/* The connection established signal from the TCP Layer	*/    :/* is in form of a REMOTE interrupt with an associated 	*/   /* ICI.													*/   R//if (intrpt_type == OPC_INTRPT_REMOTE && intrpt_code == TCPC_IND_CONNECT_REQUEST)   //	{   /	/* Open the fields of the assosiated ICI.			*/   +//	tcp_open_ind_ici_ptr = op_intrpt_ici ();   	   (	/* Get the conn id from the ICI.					*/   D//	op_ici_attr_get (tcp_open_ind_ici_ptr, "conn id",  &tcp_conn_id);       5	/* Get the remote IP address from the associated 	*/   	/* ICI.												*/   H//	op_ici_attr_get (tcp_open_ind_ici_ptr, "rem addr", &remote_addr_ptr);   >//	remote_inet_ip_addr = inet_address_copy (*remote_addr_ptr);   	   !	/* Get the local port.								*/   E//	op_ici_attr_get (tcp_open_ind_ici_ptr, "local port", &local_port);   	   "	/* Get the remort port.								*/   D//	op_ici_attr_get (tcp_open_ind_ici_ptr, "rem port", &remote_port);       $	/*	Generate trace messsage							*/   (//	if (op_prg_odb_ltrace_active ("tcp"))   //		{   q//		sprintf (msg0, "server: conn id: %d, local_port: %d, remote_port :%d", tcp_conn_id, local_port, remote_port);   ,//		op_prg_odb_print_major (msg0, OPC_NIL);	   //		}   	   h//printf ("server: conn id: %d, local_port: %d, remote_port :%d", tcp_conn_id, local_port, remote_port);   //}   
       
   ����   
          pr_state         �               DATA          J   B   if(CONN_ESTABLISHED){       5/* Call a child process to handle incoming request */   )/* Start listening for new connections */       W//child_proc [child_count++] = op_pro_create ("wban_tcp_bridge_server_child", OPC_NIL);   6//op_pro_invoke (child_proc [child_count++], OPC_NIL);       2printf("**CONNECTION IS ESTABLISHED SERVER** \n");   }       if (PKT_RECEIVE)   	{   4	/*	A packet has been received by the TCP CLient.	*/   	   $	/*	Print trace statements.							*/   	   "	printf("PACKET RECEIVE CHILD\n");   &	if (op_prg_odb_ltrace_active ("tcp"))   J		op_prg_odb_print_major ("Received Data Packet from TCP Layer", OPC_NIL);       %	/* Get the incoming packet.							*/   '	pkptr = op_pk_get (op_intrpt_strm ());   	   	op_pk_print(pkptr);       1	/* Check if there is anything stored in the 		*/   4	/* "payload" field of the incoming application 		*/   	/* packet.											*/   )	if (op_pk_nfd_is_set (pkptr, "payload"))   		{   1		/* Get the "payload" field of the incoming 		*/   !		/* application packet.							*/   6		op_pk_nfd_get (pkptr, "payload", &incoming_payload);   		   4		/* Write whatever is contained in the "payload"	*/   4		/* field in the incoming application packet to 	*/   		/* the output file.								*/   0//		fprintf (pFile, "%s\r\n", incoming_payload);   		}       -	/*	Destroy the received packet and ICI.			*/   #	op_ici_destroy (op_intrpt_ici ());   	op_strm_flush (OPC_STRM_ALL);       5	/*	Issue a RECEIVE command to the TCP Layer. The 	*/   4	/*	receive command specifies that the TCP Client	*/   3	/*	is ready to receive the number of packets as	*/   4	/*	specified as the argument to receive command.	*/   .	tcp_receive_command_send (tcp_app_handle, 1);   	}       if (TCP_INTRPT)   	{   6	/* The application received an OPEN confirm from  	*/   7	/* TCP indicating that the transport connection has */   )	/* been successfully established.					*/   	   5	/*	Issue a RECEIVE command to the TCP Layer. The 	*/   4	/*	receive command specifies that the TCP Client	*/   3	/*	is ready to receive the number of packets as	*/   4	/*	specified as the argument to receive command.	*/   N	printf("***Server : Issued received command from TCP layer at Child ****\n");   .	tcp_receive_command_send (tcp_app_handle, 1);   	   	}   J       
      6/*	Determine the Interrupt Type and Interrupt Code.	*/   6/*	This is used to determine state transitions and		*/   !/*	process model logic.								*/       !ev_ptr = tcp_ev_analyze ("DATA");    intrpt_type = op_intrpt_type ();    intrpt_code = op_intrpt_code ();   
           ����             pr_state         �  �             RELEASE          
   
   if (CONN_RELEASE)   	{   "	/* Destroy the TCP API handle.	*/   *	tcp_app_handle_destroy (&tcp_app_handle);       	/* Close the output file.		*/   	fclose (pFile);   	}           
       
      $ev_ptr = tcp_ev_analyze ("RELEASE");   
           ����             pr_state                    _  (      �     (   �  (  5   �               tr_4             PKT_RECEIVE          ����              ����             ����                       pr_transition      *          �      �  �   �  �   �  �   �  �             tr_4             default          ����              ����             ����                       pr_transition      1         �  }      �  )   �  �             tr_30             CONN_RELEASE          ����              ����             ����                       pr_transition      ?        0  w      �      v   �  �   �            
   tr_63   
       
   default   
       ����          
    ����   
          ����                       pr_transition      C         l   �      �     z     �  Y   �            
   tr_67   
       
   
TCP_INTRPT   
       ����          
    ����   
          ����                       pr_transition      D         �   �      �   �   �            
   tr_68   
       
   CONN_ESTABLISHED   
       ����          
    ����   
          ����                       pr_transition         E                  
ip_addr_v4   oms_stat_support   tcp_api          app_pkt_fmt_1508_lab3      DGeneral Process Description                                            ---------------------------   
   GThe "bursty_source" process model emulates an ON-OFF (active-inactive)    Jtraffic generator model.  Packets are only generated while the process is    Hin the ON state.  The duration for which the process stays in the ON or    OFF state is configurable.        