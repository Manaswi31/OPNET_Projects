/* Process model C++ form file: wban_tcp_client_trail_child.pr.cpp */
/* Portions of this file copyright 2014 by Riverbed Technology. All rights reserved. */


/*
 =========================== NOTE ==========================
 This file is automatically generated from wban_tcp_client_trail_child.pr.m
 during a process model compilation.

 Do NOT manually edit this file.
 Manual edits will be lost during the next compilation.
 =========================== NOTE ==========================
*/



/* This variable carries the header into the object file */
const char wban_tcp_client_trail_child_pr_cpp [] = "MIL_3_Tfile_Hdr_ 1800 30A modeler 7 56E5DA6C 56E5DA6C 1 volta chaganti 0 0 none none 0 0 none 0 0 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                           ";
#include <string.h>



/* OPNET system definitions */
#include <opnet.h>



/* Header Block */

#include "ip_addr_v4.h"
#include "tcp_api_v3.h"
#include <bgp.h>
#include <tcp_v3.h>
//#include "1508_lab3_real_payload_support.h"

/*	Define constants used in the process model.			*/
#define	TCP_LAB_GEN_CONN_OPEN		100
#define	TCP_LAB_GEN_CONN_CLOSE		200
#define TCP_LAB_GEN_PK_CREATE		300
#define TCP_STRM_IN 				1
#define TCP_STRM_OUT 				0
/*	State transition macro definitions.					*/
/*#define	CONN_OPEN			((op_intrpt_type () == OPC_INTRPT_SELF) && \
							 (op_intrpt_code () == TCP_LAB_GEN_CONN_OPEN))

#define CONN_ESTABLISHED	((intrpt_type == OPC_INTRPT_REMOTE) &&	\
							 (status_ind == TCPC_IND_ESTAB))

#define PKT_SEND			((intrpt_type == OPC_INTRPT_SELF) && \
							 (intrpt_code == TCP_LAB_GEN_PK_CREATE))

#define	PKT_RECEIVE			((op_intrpt_type () == OPC_INTRPT_STRM) &&\
								(op_intrpt_code () == TCP_STRM_OUT))

#define	CONN_RELEASE		((op_intrpt_type () == OPC_INTRPT_SELF) && \
							 (op_intrpt_code () == TCP_LAB_GEN_CONN_CLOSE))

#define PKT_RCV_ZGB 		((op_intrpt_type () == OPC_INTRPT_STRM) && \
								(op_intrpt_code () == TCP_STRM_IN)) */


/* Transition condition macros. */
//#define CONN_OPEN			ev_ptr->event == 0
#define CONN_ESTABLISHED	ev_ptr->event == CONN_ESTAB
#define PKT_SEND			ev_ptr->event == SEND
#define PKT_RECEIVE			ev_ptr->event == RECEIVE
#define PKT_RCV_ZGB			ev_ptr->event == RCV_ZGB
#define CONN_RELEASE		ev_ptr->event == RELEASE

#define CONN_ESTAB					1
#define SEND						2
#define RECEIVE						3
#define RCV_ZGB						4
#define RELEASE						5




static void tcp_lab_app_send_actual_packet ();
static void tcp_conn_error (const char* msg0, const char* msg1, const char* msg2);


/* End of Header Block */

#if !defined (VOSD_NO_FIN)
#undef	BIN
#undef	BOUT
#define	BIN		FIN_LOCAL_FIELD(_op_last_line_passed) = __LINE__ - _op_block_origin;
#define	BOUT	BIN
#define	BINIT	FIN_LOCAL_FIELD(_op_last_line_passed) = 0; _op_block_origin = __LINE__;
#else
#define	BINIT
#endif /* #if !defined (VOSD_NO_FIN) */



/* State variable definitions */
class wban_tcp_client_trail_child_state
	{
	private:
		/* Internal state tracking for FSM */
		FSM_SYS_STATE

	public:
		wban_tcp_client_trail_child_state (void);

		/* Destructor contains Termination Block */
		~wban_tcp_client_trail_child_state (void);

		/* State Variables */
		Objid	                  		my_id                                           ;
		TcpT_Port	              		local_port                                      ;
		TcpT_Port	              		remote_port                                     ;
		InetT_Address	          		remote_inet_ip_addr                             ;
		ApiT_Tcp_App_Handle	    		tcp_app_handle                                  ;
		int	                    		connect_id                                      ;
		InetT_Address	          		inet_address                                    ;
		TcpT_Conn_Open_Options	 		conn_options                                    ;
		InetT_Address	          		local_inet_ip_addr                              ;
		Prg_List*	              		line_list                                       ;
		int	                    		line_index                                      ;
		int	                    		num_lines                                       ;
		double	                 		start_time                                      ;
		Objid	                  		parent_id                                       ;
		Prohandle	              		my_pro_handle                                   ;
		Objid	                  		my_pro_id                                       ;
		Objid	                  		my_node_objid                                   ;
		int	                    		new_variable                                    ;
		BgpT_Conn_Info*	        		conn_info_ptr                                   ;
		TcpT_Event*	            		ev_ptr                                          ;

		/* FSM code */
		void wban_tcp_client_trail_child (OP_SIM_CONTEXT_ARG_OPT);
		/* Diagnostic Block */
		void _op_wban_tcp_client_trail_child_diag (OP_SIM_CONTEXT_ARG_OPT);

#if defined (VOSD_NEW_BAD_ALLOC)
		void * operator new (size_t) throw (VOSD_BAD_ALLOC);
#else
		void * operator new (size_t);
#endif
		void operator delete (void *);

		/* Memory management */
		static VosT_Obtype obtype;
	};

VosT_Obtype wban_tcp_client_trail_child_state::obtype = (VosT_Obtype)OPC_NIL;

#define pr_state_ptr            		((wban_tcp_client_trail_child_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))
#define my_id                   		pr_state_ptr->my_id
#define local_port              		pr_state_ptr->local_port
#define remote_port             		pr_state_ptr->remote_port
#define remote_inet_ip_addr     		pr_state_ptr->remote_inet_ip_addr
#define tcp_app_handle          		pr_state_ptr->tcp_app_handle
#define connect_id              		pr_state_ptr->connect_id
#define inet_address            		pr_state_ptr->inet_address
#define conn_options            		pr_state_ptr->conn_options
#define local_inet_ip_addr      		pr_state_ptr->local_inet_ip_addr
#define line_list               		pr_state_ptr->line_list
#define line_index              		pr_state_ptr->line_index
#define num_lines               		pr_state_ptr->num_lines
#define start_time              		pr_state_ptr->start_time
#define parent_id               		pr_state_ptr->parent_id
#define my_pro_handle           		pr_state_ptr->my_pro_handle
#define my_pro_id               		pr_state_ptr->my_pro_id
#define my_node_objid           		pr_state_ptr->my_node_objid
#define new_variable            		pr_state_ptr->new_variable
#define conn_info_ptr           		pr_state_ptr->conn_info_ptr
#define ev_ptr                  		pr_state_ptr->ev_ptr

/* These macro definitions will define a local variable called	*/
/* "op_sv_ptr" in each function containing a FIN statement.	*/
/* This variable points to the state variable data structure,	*/
/* and can be used from a C debugger to display their values.	*/
#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE
#define FIN_PREAMBLE_DEC	wban_tcp_client_trail_child_state *op_sv_ptr;
#define FIN_PREAMBLE_CODE	\
		op_sv_ptr = ((wban_tcp_client_trail_child_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr));


/* Function Block */

#if !defined (VOSD_NO_FIN)
enum { _op_block_origin = __LINE__ + 2};
#endif

static void
tcp_lab_app_send_actual_packet ()
{
	Packet		*pkptr;
	OpT_uInt32	uint32_data = 5;
	
	FIN (tcp_lab_gen_send_actual_packet ());
	
	/* Create a new formatted packet of type			*/	
	/* app_pkt_fmt_1508_lab3.							*/
	pkptr = op_pk_create_fmt ("app_pkt_fmt_1508_lab3");
	
	/* Add the real payload to the packet.				*/
	//op_pk_nfd_set (pkptr, "payload", (OpT_uInt32) prg_list_access (line_list, line_index));
	op_pk_nfd_set (pkptr, "payload", (OpT_uInt32) 5);
	
	/* increment the line_index. Next time the client 	*/
	/* will send a packet it will include the right		*/
	/* line.											*/
	line_index++;
	
	/*	Print trace statements.							*/
	if (op_prg_odb_ltrace_active ("tcp"))
		{	
		op_prg_odb_print_major ("client: sending packet to the TCP layer", OPC_NIL);
		}

	printf("client: sending packet to the TCP layer\n");
	/* Send the packet on the stream going out of the	*/
	/* module to the TCP layer.							*/
	tcp_data_send (tcp_app_handle, pkptr);

	/* Issue a RECEIVE command to the TCP Layer. The 	*/
	/* receive command specifies that the TCP Client	*/
	/* is ready to receive the number of packets as		*/
	/* specified in the second argument of the receive 	*/
	/* command.											*/
	tcp_receive_command_send (tcp_app_handle, 1);

	/* Check if there is any other data to be sent.		*/
//	if (line_index < num_lines)
//		{
		/* Schedule a self-interrupt so that the client	*/
		/* will send another packet.					*/
//		op_intrpt_schedule_self (op_sim_time () + 5, TCP_LAB_GEN_PK_CREATE);
//		}
//	else
//		{
		/* Schedule a self interrupt for sending the 	*/
		/* CLOSE command								*/ 
//		op_intrpt_schedule_self (op_sim_time () + 5, TCP_LAB_GEN_CONN_CLOSE);
//		}
	
	FOUT;
	}


/***** Event processing. *****/

static TcpT_Event*
tcp_ev_analyze (const char* state_name)
	{
	Boolean				conn_id_trace_active = OPC_FALSE;
	TcpT_Event*			evptr = OPC_NIL;

	/** Initialize variables for this invocation. **/
	FIN (tcp_ev_analyze (state_name));
	printf("AT TCP analyze\n");

	/* Record the state name. */
	//strcpy (tcb_ptr->state_name, state_name);

	/* Determine the source of the interrupt. */
	//if (op_intrpt_type () == OPC_INTRPT_SELF)
	//	{
		/* Since this is a self interrupt, we haven't been	*/
		/* passed an event pointer.  Use the static event	*/
		/* record to hold information about this event.		*/
	//	evptr = &event_record;
	//	evptr->event = op_intrpt_code ();
	//	}
	//else
		//{
		/* All other interrupts are invocations by the manager. */
		//evptr = (TcpT_Event *) op_pro_argmem_access ();
		evptr = (TcpT_Event *) op_pro_argmem_access ();
		if (evptr == OPC_NIL)
			{
			tcp_conn_error ("Unable to get event pointer from argument memory.",
				"Socket process invoked without event specification.", OPC_NIL);
			}
		//}

	
	FRET (evptr);
	}
/**** Error handling functions *****/

static void
tcp_conn_error (const char* msg0, const char* msg1, const char* msg2)
	{
	/** Print an error message and exit the simulation. **/
	FIN (tcp_conn_error (msg0, msg1, msg2));
	
	op_sim_end ("Error in TCP socket process (tcp_conn_v3):", msg0, msg1, msg2);
	
	FOUT;
	}

/* End of Function Block */

/* Undefine optional tracing in FIN/FOUT/FRET */
/* The FSM has its own tracing code and the other */
/* functions should not have any tracing.		  */
#undef FIN_TRACING
#define FIN_TRACING

#undef FOUTRET_TRACING
#define FOUTRET_TRACING

/* Undefine shortcuts to state variables because the */
/* following functions are part of the state class */
#undef my_id
#undef local_port
#undef remote_port
#undef remote_inet_ip_addr
#undef tcp_app_handle
#undef connect_id
#undef inet_address
#undef conn_options
#undef local_inet_ip_addr
#undef line_list
#undef line_index
#undef num_lines
#undef start_time
#undef parent_id
#undef my_pro_handle
#undef my_pro_id
#undef my_node_objid
#undef new_variable
#undef conn_info_ptr
#undef ev_ptr

/* Access from C kernel using C linkage */
extern "C"
{
	VosT_Obtype _op_wban_tcp_client_trail_child_init (int * init_block_ptr);
	VosT_Address _op_wban_tcp_client_trail_child_alloc (VosT_Obtype, int);
	void wban_tcp_client_trail_child (OP_SIM_CONTEXT_ARG_OPT)
		{
		((wban_tcp_client_trail_child_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))->wban_tcp_client_trail_child (OP_SIM_CONTEXT_PTR_OPT);
		}

	void _op_wban_tcp_client_trail_child_svar (void *, const char *, void **);

	void _op_wban_tcp_client_trail_child_diag (OP_SIM_CONTEXT_ARG_OPT)
		{
		((wban_tcp_client_trail_child_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))->_op_wban_tcp_client_trail_child_diag (OP_SIM_CONTEXT_PTR_OPT);
		}

	void _op_wban_tcp_client_trail_child_terminate (OP_SIM_CONTEXT_ARG_OPT)
		{
		/* The destructor is the Termination Block */
		delete (wban_tcp_client_trail_child_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr);
		}


} /* end of 'extern "C"' */




/* Process model interrupt handling procedure */


void
wban_tcp_client_trail_child_state::wban_tcp_client_trail_child (OP_SIM_CONTEXT_ARG_OPT)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	FIN_MT (wban_tcp_client_trail_child_state::wban_tcp_client_trail_child ());
	try
		{
		/* Temporary Variables */
		Packet*			pkptr;
		int				intrpt_type;
		int				intrpt_code;
		int				status_ind;
		Ici*			status_iciptr;
		char            ip_addr_str[25];
		
		/* End of Temporary Variables */


		FSM_ENTER ("wban_tcp_client_trail_child")

		FSM_BLOCK_SWITCH
			{
			/*---------------------------------------------------------*/
			/** state (INIT) enter executives **/
			FSM_STATE_ENTER_FORCED_NOLABEL (0, "INIT", "wban_tcp_client_trail_child [INIT enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [INIT enter execs]", state0_enter_exec)
				{
				/* Obtain the object ID of this process' surrounding module.	*/
				//my_id = op_id_self ();
				
				/* obtain object ID of the parent object (node) */
				//parent_id = op_topo_parent (my_id);
				
				/* Set appropriately the local and the  remote port.			*/
				//local_port = 1024;
				//remote_port = 1026;
				
				
				/* Create the inet IP address 									*/
				
				/* Read the parameters of Remote Address,Remote Port */	
							
				//op_ima_obj_attr_get (parent_id, "Remote IP Address", ip_addr_str);
				//op_ima_obj_attr_get (parent_id, "Remote Port", &remote_port);
				//op_ima_obj_attr_get (parent_id, "Application Start Time", &start_time);
				
				//printf("start time :%f\n", start_time);
				
				/* Schedule the start of operation								*/
				//op_intrpt_schedule_self (op_sim_time ()+start_time, TCP_LAB_GEN_CONN_OPEN);
				
				
				//local_inet_ip_addr = inet_address_from_ipv4_address_create (ip_address_create (ip_addr_str));
				
				/* Create the IP address										*/
				//remote_inet_ip_addr = inet_address_from_ipv4_address_create (ip_address_create ("192.0.0.2"));
				
				/* This application must register itself with the TCP API.  The	*/
				/* API handle will be used on all subsequent calls to the API.	*/
				//tcp_app_handle = tcp_app_register (my_id);
				
				/* Read the lines from the input file.							*/
				//line_list = prg_gdf_read ("//home/student//chaganti//op_models//1508//1508//op_models//1508_lab3_client_input.txt");
				
				/* store the number of lines that the current line has			*/
				//num_lines = prg_list_size (line_list);
				
				/* Set the line_index to zero. Every time we send one line we	*/
				/* will increment the line_index by one.						*/
				//line_index = 0;
				
				/* First initialize the object IDs corresponding to this**/
				/* connection process. 									*/
				
					my_pro_handle = op_pro_self ();
					my_pro_id	  = op_pro_id (my_pro_handle);
					my_node_objid = op_topo_parent (op_id_self ()); 
				
				/* Acces theparent memory to initialize the neighbors	*/
					/* IP Address and the neighbor AS number.				*/
					conn_info_ptr	= (BgpT_Conn_Info *)op_pro_parmem_access ();
				
				/* The other piece of information that the parent 		*/
					/* passes on to the child is the handle to interface 	*/
					/* with TCP.											*/
				tcp_app_handle			= conn_info_ptr->tcp_intf_handle; 
				printf("i  am child: %d client\n", conn_info_ptr->tcp_connection_id);
				
				/* Initialize variables for this invocation. 					*/
				//ev_ptr	= (TcpT_Event *)op_pro_parmem_access ();
				ev_ptr = tcp_ev_analyze ("INIT");
				
				
				}
				FSM_PROFILE_SECTION_OUT (state0_enter_exec)

			/** state (INIT) exit executives **/
			FSM_STATE_EXIT_FORCED (0, "INIT", "wban_tcp_client_trail_child [INIT exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [INIT exit execs]", state0_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				//intrpt_type = op_intrpt_type ();
				//intrpt_code = op_intrpt_code ();
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				
				ev_ptr = tcp_ev_analyze ("OPEN");
				
				/*switch (ev_ptr->event)
					{
					case TCPC_EV_RECEIVE:
						{
						
						break;
						}
				
					case TCPC_EV_ABORT:
						break;
				
					case TCPC_EV_SEG_ARRIVAL:
						{
						
						break;
						}
				
					case TCPC_EV_TIMEOUT_TIME_WAIT:
						{
						
						break;
						}
				
					default:
						{
						break;
						}
					}
				*/
				
				
				printf("RECEIVED CLIENT CONN ESTAB : %d\n",ev_ptr->event);
				
				
				}
				FSM_PROFILE_SECTION_OUT (state0_exit_exec)


			/** state (INIT) transition processing **/
			FSM_TRANSIT_ONLY ((CONN_ESTABLISHED), 1, state1_enter_exec, ;, INIT, "CONN_ESTABLISHED", "", "INIT", "DATA", "tr_67", "wban_tcp_client_trail_child [INIT -> DATA : CONN_ESTABLISHED / ]")
				/*---------------------------------------------------------*/



			/** state (DATA) enter executives **/
			FSM_STATE_ENTER_UNFORCED (1, "DATA", state1_enter_exec, "wban_tcp_client_trail_child [DATA enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [DATA enter execs]", state1_enter_exec)
				{
				if (CONN_ESTABLISHED)
					{
					//tcp_lab_app_send_actual_packet();
					printf("CONNECTION ESTABLISHED CLIENT\n");
					}
				
				if (PKT_RECEIVE)
					{
					/*	A packet has been received by the TCP client.	*/
					
					/*	Print trace statements.							*/
					if (op_prg_odb_ltrace_active ("tcp"))
						{
						op_prg_odb_print_major ("Received Data Packet from TCP Layer", OPC_NIL);
						}
					
					/* Get the incoming packet.							*/
					pkptr = op_pk_get (op_intrpt_strm ());
					
					/*	Destroy the received packet and ICI.			*/
					op_ici_destroy (op_intrpt_ici ());
					op_strm_flush (OPC_STRM_ALL);
					}
				if(PKT_RCV_ZGB)
					
					{
					// pkptr = op_pk_get(op_intrpt_strm());
					
					//tcp_lab_app_send_actual_packet();
					
					
					
					/* Send the packet on the stream going out of the	*/
					/* module to the TCP layer.							*/
					//tcp_data_send (tcp_app_handle, ev_ptr->pk_ptr);
				
				
					/* Issue a RECEIVE command to the TCP Layer. The 	*/
					/* receive command specifies that the TCP Client	*/
					/* is ready to receive the number of packets as		*/
					/* specified in the second argument of the receive 	*/
					/* command.											*/
					//tcp_receive_command_send (tcp_app_handle, 1);
					
					}
					
				}
				FSM_PROFILE_SECTION_OUT (state1_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (3,"wban_tcp_client_trail_child")


			/** state (DATA) exit executives **/
			FSM_STATE_EXIT_UNFORCED (1, "DATA", "wban_tcp_client_trail_child [DATA exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [DATA exit execs]", state1_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				ev_ptr = tcp_ev_analyze ("DATA");
				}
				FSM_PROFILE_SECTION_OUT (state1_exit_exec)


			/** state (DATA) transition processing **/
			FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [DATA trans conditions]", state1_trans_conds)
			FSM_INIT_COND (PKT_RECEIVE)
			FSM_TEST_COND (CONN_RELEASE)
			FSM_TEST_COND (PKT_SEND)
			FSM_TEST_COND (PKT_RCV_ZGB)
			FSM_DFLT_COND
			FSM_TEST_LOGIC ("DATA")
			FSM_PROFILE_SECTION_OUT (state1_trans_conds)

			FSM_TRANSIT_SWITCH
				{
				FSM_CASE_TRANSIT (0, 1, state1_enter_exec, ;, "PKT_RECEIVE", "", "DATA", "DATA", "tr_4", "wban_tcp_client_trail_child [DATA -> DATA : PKT_RECEIVE / ]")
				FSM_CASE_TRANSIT (1, 2, state2_enter_exec, ;, "CONN_RELEASE", "", "DATA", "RELEASE", "tr_30", "wban_tcp_client_trail_child [DATA -> RELEASE : CONN_RELEASE / ]")
				FSM_CASE_TRANSIT (2, 1, state1_enter_exec, ;, "PKT_SEND", "", "DATA", "DATA", "tr_65", "wban_tcp_client_trail_child [DATA -> DATA : PKT_SEND / ]")
				FSM_CASE_TRANSIT (3, 1, state1_enter_exec, ;, "PKT_RCV_ZGB", "", "DATA", "DATA", "tr_66", "wban_tcp_client_trail_child [DATA -> DATA : PKT_RCV_ZGB / ]")
				FSM_CASE_TRANSIT (4, 1, state1_enter_exec, ;, "default", "", "DATA", "DATA", "tr_63", "wban_tcp_client_trail_child [DATA -> DATA : default / ]")
				}
				/*---------------------------------------------------------*/



			/** state (RELEASE) enter executives **/
			FSM_STATE_ENTER_UNFORCED (2, "RELEASE", state2_enter_exec, "wban_tcp_client_trail_child [RELEASE enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [RELEASE enter execs]", state2_enter_exec)
				{
				if (CONN_RELEASE)
					{
					/**	This interrupt indicates that the connection need	**/
					/**	to be closed. Issue a CLOSE ccommand to close this	**/
					/**	end of the connection.								**/
				
					/* Inform the TCP layer as well that this client does	*/
					/* not have any more data to send. 						*/
					tcp_connection_close (tcp_app_handle);
					
					/* Destroy the TCP API handle.							*/
					tcp_app_handle_destroy (&tcp_app_handle);
					}
				
				
				}
				FSM_PROFILE_SECTION_OUT (state2_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (5,"wban_tcp_client_trail_child")


			/** state (RELEASE) exit executives **/
			FSM_STATE_EXIT_UNFORCED (2, "RELEASE", "wban_tcp_client_trail_child [RELEASE exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_client_trail_child [RELEASE exit execs]", state2_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				}
				FSM_PROFILE_SECTION_OUT (state2_exit_exec)


			/** state (RELEASE) transition processing **/
			FSM_TRANSIT_FORCE (2, state2_enter_exec, ;, "default", "", "RELEASE", "RELEASE", "tr_4", "wban_tcp_client_trail_child [RELEASE -> RELEASE : default / ]")
				/*---------------------------------------------------------*/



			}


		FSM_EXIT (0,"wban_tcp_client_trail_child")
		}
	catch (...)
		{
		Vos_Error_Print (VOSC_ERROR_ABORT,
			(const char *)VOSC_NIL,
			"Unhandled C++ exception in process model (wban_tcp_client_trail_child)",
			(const char *)VOSC_NIL, (const char *)VOSC_NIL);
		}
	}




void
wban_tcp_client_trail_child_state::_op_wban_tcp_client_trail_child_diag (OP_SIM_CONTEXT_ARG_OPT)
	{
	/* No Diagnostic Block */
	}

void
wban_tcp_client_trail_child_state::operator delete (void* ptr)
	{
	FIN (wban_tcp_client_trail_child_state::operator delete (ptr));
	Vos_Poolmem_Dealloc (ptr);
	FOUT
	}

wban_tcp_client_trail_child_state::~wban_tcp_client_trail_child_state (void)
	{

	FIN (wban_tcp_client_trail_child_state::~wban_tcp_client_trail_child_state ())


	/* No Termination Block */


	FOUT
	}


#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE

#define FIN_PREAMBLE_DEC
#define FIN_PREAMBLE_CODE

void *
wban_tcp_client_trail_child_state::operator new (size_t)
#if defined (VOSD_NEW_BAD_ALLOC)
		throw (VOSD_BAD_ALLOC)
#endif
	{
	void * new_ptr;

	FIN_MT (wban_tcp_client_trail_child_state::operator new ());

	new_ptr = Vos_Alloc_Object (wban_tcp_client_trail_child_state::obtype);
#if defined (VOSD_NEW_BAD_ALLOC)
	if (new_ptr == VOSC_NIL) throw VOSD_BAD_ALLOC();
#endif
	FRET (new_ptr)
	}

/* State constructor initializes FSM handling */
/* by setting the initial state to the first */
/* block of code to enter. */

wban_tcp_client_trail_child_state::wban_tcp_client_trail_child_state (void) :
		_op_current_block (0)
	{
#if defined (OPD_ALLOW_ODB)
		_op_current_state = "wban_tcp_client_trail_child [INIT enter execs]";
#endif
	}

VosT_Obtype
_op_wban_tcp_client_trail_child_init (int * init_block_ptr)
	{
	FIN_MT (_op_wban_tcp_client_trail_child_init (init_block_ptr))

	wban_tcp_client_trail_child_state::obtype = Vos_Define_Object_Prstate ("proc state vars (wban_tcp_client_trail_child)",
		sizeof (wban_tcp_client_trail_child_state));
	*init_block_ptr = 0;

	FRET (wban_tcp_client_trail_child_state::obtype)
	}

VosT_Address
_op_wban_tcp_client_trail_child_alloc (VosT_Obtype, int)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	wban_tcp_client_trail_child_state * ptr;
	FIN_MT (_op_wban_tcp_client_trail_child_alloc ())

	/* New instance will have FSM handling initialized */
#if defined (VOSD_NEW_BAD_ALLOC)
	try {
		ptr = new wban_tcp_client_trail_child_state;
	} catch (const VOSD_BAD_ALLOC &) {
		ptr = VOSC_NIL;
	}
#else
	ptr = new wban_tcp_client_trail_child_state;
#endif
	FRET ((VosT_Address)ptr)
	}



void
_op_wban_tcp_client_trail_child_svar (void * gen_ptr, const char * var_name, void ** var_p_ptr)
	{
	wban_tcp_client_trail_child_state		*prs_ptr;

	FIN_MT (_op_wban_tcp_client_trail_child_svar (gen_ptr, var_name, var_p_ptr))

	if (var_name == OPC_NIL)
		{
		*var_p_ptr = (void *)OPC_NIL;
		FOUT
		}
	prs_ptr = (wban_tcp_client_trail_child_state *)gen_ptr;

	if (strcmp ("my_id" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->my_id);
		FOUT
		}
	if (strcmp ("local_port" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->local_port);
		FOUT
		}
	if (strcmp ("remote_port" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->remote_port);
		FOUT
		}
	if (strcmp ("remote_inet_ip_addr" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->remote_inet_ip_addr);
		FOUT
		}
	if (strcmp ("tcp_app_handle" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->tcp_app_handle);
		FOUT
		}
	if (strcmp ("connect_id" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->connect_id);
		FOUT
		}
	if (strcmp ("inet_address" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->inet_address);
		FOUT
		}
	if (strcmp ("conn_options" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->conn_options);
		FOUT
		}
	if (strcmp ("local_inet_ip_addr" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->local_inet_ip_addr);
		FOUT
		}
	if (strcmp ("line_list" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->line_list);
		FOUT
		}
	if (strcmp ("line_index" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->line_index);
		FOUT
		}
	if (strcmp ("num_lines" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->num_lines);
		FOUT
		}
	if (strcmp ("start_time" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->start_time);
		FOUT
		}
	if (strcmp ("parent_id" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->parent_id);
		FOUT
		}
	if (strcmp ("my_pro_handle" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->my_pro_handle);
		FOUT
		}
	if (strcmp ("my_pro_id" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->my_pro_id);
		FOUT
		}
	if (strcmp ("my_node_objid" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->my_node_objid);
		FOUT
		}
	if (strcmp ("new_variable" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->new_variable);
		FOUT
		}
	if (strcmp ("conn_info_ptr" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->conn_info_ptr);
		FOUT
		}
	if (strcmp ("ev_ptr" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->ev_ptr);
		FOUT
		}
	*var_p_ptr = (void *)OPC_NIL;

	FOUT
	}

