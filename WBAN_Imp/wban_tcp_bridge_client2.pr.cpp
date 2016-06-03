/* Process model C++ form file: wban_tcp_bridge_client2.pr.cpp */
/* Portions of this file copyright 2014 by Riverbed Technology. All rights reserved. */


/*
 =========================== NOTE ==========================
 This file is automatically generated from wban_tcp_bridge_client2.pr.m
 during a process model compilation.

 Do NOT manually edit this file.
 Manual edits will be lost during the next compilation.
 =========================== NOTE ==========================
*/



/* This variable carries the header into the object file */
const char wban_tcp_bridge_client2_pr_cpp [] = "MIL_3_Tfile_Hdr_ 1800 30A modeler 7 568F07C8 568F07C8 1 volta chaganti 0 0 none none 0 0 none 0 0 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                           ";
#include <string.h>



/* OPNET system definitions */
#include <opnet.h>



/* Header Block */

#include "ip_addr_v4.h"
#include "tcp_api_v3.h"
//#include "1508_lab3_real_payload_support.h"

/*	Define constants used in the process model.			*/
#define	TCP_LAB_GEN_CONN_OPEN		100
#define	TCP_LAB_GEN_CONN_CLOSE		200
#define TCP_LAB_GEN_PK_CREATE		300
#define TCP_STRM_IN 				1
#define TCP_STRM_OUT 				0
/*	State transition macro definitions.					*/
#define	CONN_OPEN			((op_intrpt_type () == OPC_INTRPT_SELF) && \
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
								(op_intrpt_code () == TCP_STRM_IN))

static void tcp_lab_app_send_actual_packet ();


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
class wban_tcp_bridge_client2_state
	{
	private:
		/* Internal state tracking for FSM */
		FSM_SYS_STATE

	public:
		wban_tcp_bridge_client2_state (void);

		/* Destructor contains Termination Block */
		~wban_tcp_bridge_client2_state (void);

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

		/* FSM code */
		void wban_tcp_bridge_client2 (OP_SIM_CONTEXT_ARG_OPT);
		/* Diagnostic Block */
		void _op_wban_tcp_bridge_client2_diag (OP_SIM_CONTEXT_ARG_OPT);

#if defined (VOSD_NEW_BAD_ALLOC)
		void * operator new (size_t) throw (VOSD_BAD_ALLOC);
#else
		void * operator new (size_t);
#endif
		void operator delete (void *);

		/* Memory management */
		static VosT_Obtype obtype;
	};

VosT_Obtype wban_tcp_bridge_client2_state::obtype = (VosT_Obtype)OPC_NIL;

#define pr_state_ptr            		((wban_tcp_bridge_client2_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))
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

/* These macro definitions will define a local variable called	*/
/* "op_sv_ptr" in each function containing a FIN statement.	*/
/* This variable points to the state variable data structure,	*/
/* and can be used from a C debugger to display their values.	*/
#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE
#define FIN_PREAMBLE_DEC	wban_tcp_bridge_client2_state *op_sv_ptr;
#define FIN_PREAMBLE_CODE	\
		op_sv_ptr = ((wban_tcp_bridge_client2_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr));


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
	
	/* increment the line_index. Next time the client 	*/
	/* will send a packet it will include the right		*/
	/* line.											*/
	line_index++;
	
	/*	Print trace statements.							*/
	if (op_prg_odb_ltrace_active ("tcp"))
		{	
		op_prg_odb_print_major ("client: sending packet to the TCP layer", OPC_NIL);
		}

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
	if (line_index < num_lines)
		{
		/* Schedule a self-interrupt so that the client	*/
		/* will send another packet.					*/
		op_intrpt_schedule_self (op_sim_time () + 5, TCP_LAB_GEN_PK_CREATE);
		}
	else
		{
		/* Schedule a self interrupt for sending the 	*/
		/* CLOSE command								*/ 
		op_intrpt_schedule_self (op_sim_time () + 5, TCP_LAB_GEN_CONN_CLOSE);
		}
	
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

/* Access from C kernel using C linkage */
extern "C"
{
	VosT_Obtype _op_wban_tcp_bridge_client2_init (int * init_block_ptr);
	VosT_Address _op_wban_tcp_bridge_client2_alloc (VosT_Obtype, int);
	void wban_tcp_bridge_client2 (OP_SIM_CONTEXT_ARG_OPT)
		{
		((wban_tcp_bridge_client2_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))->wban_tcp_bridge_client2 (OP_SIM_CONTEXT_PTR_OPT);
		}

	void _op_wban_tcp_bridge_client2_svar (void *, const char *, void **);

	void _op_wban_tcp_bridge_client2_diag (OP_SIM_CONTEXT_ARG_OPT)
		{
		((wban_tcp_bridge_client2_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))->_op_wban_tcp_bridge_client2_diag (OP_SIM_CONTEXT_PTR_OPT);
		}

	void _op_wban_tcp_bridge_client2_terminate (OP_SIM_CONTEXT_ARG_OPT)
		{
		/* The destructor is the Termination Block */
		delete (wban_tcp_bridge_client2_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr);
		}


} /* end of 'extern "C"' */




/* Process model interrupt handling procedure */


void
wban_tcp_bridge_client2_state::wban_tcp_bridge_client2 (OP_SIM_CONTEXT_ARG_OPT)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	FIN_MT (wban_tcp_bridge_client2_state::wban_tcp_bridge_client2 ());
	try
		{
		/* Temporary Variables */
		Packet*			pkptr;
		int				intrpt_type;
		int				intrpt_code;
		int				status_ind;
		Ici*			status_iciptr;
		/* End of Temporary Variables */


		FSM_ENTER ("wban_tcp_bridge_client2")

		FSM_BLOCK_SWITCH
			{
			/*---------------------------------------------------------*/
			/** state (INIT) enter executives **/
			FSM_STATE_ENTER_UNFORCED_NOLABEL (0, "INIT", "wban_tcp_bridge_client2 [INIT enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [INIT enter execs]", state0_enter_exec)
				{
				/* Obtain the object ID of this process' surrounding module.	*/
				my_id = op_id_self ();
				
				/* Set appropriately the local and the  remote port.			*/
				local_port = 1024;
				remote_port = 1024;
				
				/* Schedule the start of operation								*/
				op_intrpt_schedule_self (op_sim_time () + .01, TCP_LAB_GEN_CONN_OPEN);
				
				/* Create the inet IP address 									*/
				local_inet_ip_addr = inet_address_from_ipv4_address_create (ip_address_create ("172.16.4.90"));
				
				/* Create the IP address										*/
				remote_inet_ip_addr = inet_address_from_ipv4_address_create (ip_address_create ("172.16.5.97"));
				
				/* This application must register itself with the TCP API.  The	*/
				/* API handle will be used on all subsequent calls to the API.	*/
				tcp_app_handle = tcp_app_register (my_id);
				
				/* Read the lines from the input file.							*/
				//line_list = prg_gdf_read ("//home/student//chaganti//op_models//1508//1508//op_models//1508_lab3_client_input.txt");
				
				/* store the number of lines that the current line has			*/
				//num_lines = prg_list_size (line_list);
				
				/* Set the line_index to zero. Every time we send one line we	*/
				/* will increment the line_index by one.						*/
				//line_index = 0;
				}
				FSM_PROFILE_SECTION_OUT (state0_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (1,"wban_tcp_bridge_client2")


			/** state (INIT) exit executives **/
			FSM_STATE_EXIT_UNFORCED (0, "INIT", "wban_tcp_bridge_client2 [INIT exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [INIT exit execs]", state0_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				}
				FSM_PROFILE_SECTION_OUT (state0_exit_exec)


			/** state (INIT) transition processing **/
			FSM_TRANSIT_ONLY ((CONN_OPEN), 2, state2_enter_exec, ;, INIT, "CONN_OPEN", "", "INIT", "OPEN", "tr_32", "wban_tcp_bridge_client2 [INIT -> OPEN : CONN_OPEN / ]")
				/*---------------------------------------------------------*/



			/** state (DATA) enter executives **/
			FSM_STATE_ENTER_UNFORCED (1, "DATA", state1_enter_exec, "wban_tcp_bridge_client2 [DATA enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [DATA enter execs]", state1_enter_exec)
				{
				if (CONN_ESTABLISHED)
					{
					//tcp_lab_app_send_actual_packet();
					printf("CONNECTION ESTABLISHED\n");
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
					 pkptr = op_pk_get(op_intrpt_strm());
					
					/* Send the packet on the stream going out of the	*/
					/* module to the TCP layer.							*/
					tcp_data_send (tcp_app_handle, pkptr);
				
					/* Issue a RECEIVE command to the TCP Layer. The 	*/
					/* receive command specifies that the TCP Client	*/
					/* is ready to receive the number of packets as		*/
					/* specified in the second argument of the receive 	*/
					/* command.											*/
					tcp_receive_command_send (tcp_app_handle, 1);
					
					}
					
				}
				FSM_PROFILE_SECTION_OUT (state1_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (3,"wban_tcp_bridge_client2")


			/** state (DATA) exit executives **/
			FSM_STATE_EXIT_UNFORCED (1, "DATA", "wban_tcp_bridge_client2 [DATA exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [DATA exit execs]", state1_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				}
				FSM_PROFILE_SECTION_OUT (state1_exit_exec)


			/** state (DATA) transition processing **/
			FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [DATA trans conditions]", state1_trans_conds)
			FSM_INIT_COND (PKT_RECEIVE)
			FSM_TEST_COND (CONN_RELEASE)
			FSM_TEST_COND (PKT_SEND)
			FSM_TEST_COND (PKT_RCV_ZGB)
			FSM_DFLT_COND
			FSM_TEST_LOGIC ("DATA")
			FSM_PROFILE_SECTION_OUT (state1_trans_conds)

			FSM_TRANSIT_SWITCH
				{
				FSM_CASE_TRANSIT (0, 1, state1_enter_exec, ;, "PKT_RECEIVE", "", "DATA", "DATA", "tr_4", "wban_tcp_bridge_client2 [DATA -> DATA : PKT_RECEIVE / ]")
				FSM_CASE_TRANSIT (1, 3, state3_enter_exec, ;, "CONN_RELEASE", "", "DATA", "RELEASE", "tr_30", "wban_tcp_bridge_client2 [DATA -> RELEASE : CONN_RELEASE / ]")
				FSM_CASE_TRANSIT (2, 1, state1_enter_exec, ;, "PKT_SEND", "", "DATA", "DATA", "tr_65", "wban_tcp_bridge_client2 [DATA -> DATA : PKT_SEND / ]")
				FSM_CASE_TRANSIT (3, 1, state1_enter_exec, ;, "PKT_RCV_ZGB", "", "DATA", "DATA", "tr_66", "wban_tcp_bridge_client2 [DATA -> DATA : PKT_RCV_ZGB / ]")
				FSM_CASE_TRANSIT (4, 1, state1_enter_exec, ;, "default", "", "DATA", "DATA", "tr_63", "wban_tcp_bridge_client2 [DATA -> DATA : default / ]")
				}
				/*---------------------------------------------------------*/



			/** state (OPEN) enter executives **/
			FSM_STATE_ENTER_UNFORCED (2, "OPEN", state2_enter_exec, "wban_tcp_bridge_client2 [OPEN enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [OPEN enter execs]", state2_enter_exec)
				{
				if (intrpt_code == TCP_LAB_GEN_CONN_OPEN)
					{
					/* This interrupt indicates that an OPEN command should	*/ 
					/* be issued to the TCP Layer to open a connection. 	*/
						
					/* Populate the given options structure with the 		*/
					/* default ones.										*/
					tcp_conn_open_default_options_set (&conn_options);
					
					/* No need to use copy of address. A copy will be   	*/
					/* created by tcp_connection_open_with_options ().		*/
				    tcp_conn_open_options_local_addr_set (&conn_options, local_inet_ip_addr); 
					
					/* Allocate memory for the pointer to					*/
					/* OmsT_Sar_Payload_Process_Callbacks					*/
				//	ser_callbacks_ptr = (OmsT_Sar_Payload_Process_Callbacks*) prg_mem_alloc (sizeof (OmsT_Sar_Payload_Process_Callbacks));
				
					/* Set the callbacks that will translate OPNET packets	*/
					/* into real byte streams set as the payload of real 	*/
					/* TCP messages											*/      
				//	ser_callbacks_ptr->serialize_func = tcp_sar_serialization_callback;
				//	ser_callbacks_ptr->deserialize_func = tcp_sar_deserialization_callback;
					
					/* Set the callbacks into the conn_options that we will	*/
					/* pass to tcp_connection_open_with_options().			*/
				//	conn_options.ser_callbacks_ptr = ser_callbacks_ptr;
					
					/* Open a TCP connection between the client and the 	*/
					/* server. The struct conn_options also contains the	*/
					/* pointers to the callback functions for serialization */
					/* and deserialization.									*/
					connect_id = tcp_connection_open_with_options (&tcp_app_handle, remote_inet_ip_addr, 
						remote_port, TCPC_COMMAND_OPEN_ACTIVE, &conn_options);
						
					/*	Generate trace messsage								*/
					if (op_prg_odb_ltrace_active ("tcp"))
						{
						op_prg_odb_print_major ("client: TCP Active Open", OPC_NIL);
						}
					}
				}
				FSM_PROFILE_SECTION_OUT (state2_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (5,"wban_tcp_bridge_client2")


			/** state (OPEN) exit executives **/
			FSM_STATE_EXIT_UNFORCED (2, "OPEN", "wban_tcp_bridge_client2 [OPEN exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [OPEN exit execs]", state2_exit_exec)
				{
				/* Determine the Interrupt Type and Interrupt Code.		*/
				/* This is used to determine state transitions and		*/
				/* process model logic.									*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				
				/* The connection established signal from the TCP Layer */
				/* is in the form of a REMOTE interrupt with an 		*/
				/* associated ICI. The status field of the ICI 			*/
				/* indicates the call status.							*/
				if (intrpt_type == OPC_INTRPT_REMOTE)
					{
					status_iciptr = op_intrpt_ici ();
					op_ici_attr_get (status_iciptr, "status", &status_ind);
					op_ici_destroy (status_iciptr);
				
					/*	Generate trace messsage							*/
					if (status_ind == TCPC_IND_ESTAB && op_prg_odb_ltrace_active ("tcp"))
						{
						op_prg_odb_print_major ("Received ESTAB indication in OPEN state, proceeding to DATA state.", OPC_NIL);
						}
					}
				}
				FSM_PROFILE_SECTION_OUT (state2_exit_exec)


			/** state (OPEN) transition processing **/
			FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [OPEN trans conditions]", state2_trans_conds)
			FSM_INIT_COND (CONN_ESTABLISHED)
			FSM_DFLT_COND
			FSM_TEST_LOGIC ("OPEN")
			FSM_PROFILE_SECTION_OUT (state2_trans_conds)

			FSM_TRANSIT_SWITCH
				{
				FSM_CASE_TRANSIT (0, 1, state1_enter_exec, ;, "CONN_ESTABLISHED", "", "OPEN", "DATA", "tr_33", "wban_tcp_bridge_client2 [OPEN -> DATA : CONN_ESTABLISHED / ]")
				FSM_CASE_TRANSIT (1, 2, state2_enter_exec, ;, "default", "", "OPEN", "OPEN", "tr_4", "wban_tcp_bridge_client2 [OPEN -> OPEN : default / ]")
				}
				/*---------------------------------------------------------*/



			/** state (RELEASE) enter executives **/
			FSM_STATE_ENTER_UNFORCED (3, "RELEASE", state3_enter_exec, "wban_tcp_bridge_client2 [RELEASE enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [RELEASE enter execs]", state3_enter_exec)
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
				FSM_PROFILE_SECTION_OUT (state3_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (7,"wban_tcp_bridge_client2")


			/** state (RELEASE) exit executives **/
			FSM_STATE_EXIT_UNFORCED (3, "RELEASE", "wban_tcp_bridge_client2 [RELEASE exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_client2 [RELEASE exit execs]", state3_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				}
				FSM_PROFILE_SECTION_OUT (state3_exit_exec)


			/** state (RELEASE) transition processing **/
			FSM_TRANSIT_FORCE (3, state3_enter_exec, ;, "default", "", "RELEASE", "RELEASE", "tr_4", "wban_tcp_bridge_client2 [RELEASE -> RELEASE : default / ]")
				/*---------------------------------------------------------*/



			}


		FSM_EXIT (0,"wban_tcp_bridge_client2")
		}
	catch (...)
		{
		Vos_Error_Print (VOSC_ERROR_ABORT,
			(const char *)VOSC_NIL,
			"Unhandled C++ exception in process model (wban_tcp_bridge_client2)",
			(const char *)VOSC_NIL, (const char *)VOSC_NIL);
		}
	}




void
wban_tcp_bridge_client2_state::_op_wban_tcp_bridge_client2_diag (OP_SIM_CONTEXT_ARG_OPT)
	{
	/* No Diagnostic Block */
	}

void
wban_tcp_bridge_client2_state::operator delete (void* ptr)
	{
	FIN (wban_tcp_bridge_client2_state::operator delete (ptr));
	Vos_Poolmem_Dealloc (ptr);
	FOUT
	}

wban_tcp_bridge_client2_state::~wban_tcp_bridge_client2_state (void)
	{

	FIN (wban_tcp_bridge_client2_state::~wban_tcp_bridge_client2_state ())


	/* No Termination Block */


	FOUT
	}


#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE

#define FIN_PREAMBLE_DEC
#define FIN_PREAMBLE_CODE

void *
wban_tcp_bridge_client2_state::operator new (size_t)
#if defined (VOSD_NEW_BAD_ALLOC)
		throw (VOSD_BAD_ALLOC)
#endif
	{
	void * new_ptr;

	FIN_MT (wban_tcp_bridge_client2_state::operator new ());

	new_ptr = Vos_Alloc_Object (wban_tcp_bridge_client2_state::obtype);
#if defined (VOSD_NEW_BAD_ALLOC)
	if (new_ptr == VOSC_NIL) throw VOSD_BAD_ALLOC();
#endif
	FRET (new_ptr)
	}

/* State constructor initializes FSM handling */
/* by setting the initial state to the first */
/* block of code to enter. */

wban_tcp_bridge_client2_state::wban_tcp_bridge_client2_state (void) :
		_op_current_block (0)
	{
#if defined (OPD_ALLOW_ODB)
		_op_current_state = "wban_tcp_bridge_client2 [INIT enter execs]";
#endif
	}

VosT_Obtype
_op_wban_tcp_bridge_client2_init (int * init_block_ptr)
	{
	FIN_MT (_op_wban_tcp_bridge_client2_init (init_block_ptr))

	wban_tcp_bridge_client2_state::obtype = Vos_Define_Object_Prstate ("proc state vars (wban_tcp_bridge_client2)",
		sizeof (wban_tcp_bridge_client2_state));
	*init_block_ptr = 0;

	FRET (wban_tcp_bridge_client2_state::obtype)
	}

VosT_Address
_op_wban_tcp_bridge_client2_alloc (VosT_Obtype, int)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	wban_tcp_bridge_client2_state * ptr;
	FIN_MT (_op_wban_tcp_bridge_client2_alloc ())

	/* New instance will have FSM handling initialized */
#if defined (VOSD_NEW_BAD_ALLOC)
	try {
		ptr = new wban_tcp_bridge_client2_state;
	} catch (const VOSD_BAD_ALLOC &) {
		ptr = VOSC_NIL;
	}
#else
	ptr = new wban_tcp_bridge_client2_state;
#endif
	FRET ((VosT_Address)ptr)
	}



void
_op_wban_tcp_bridge_client2_svar (void * gen_ptr, const char * var_name, void ** var_p_ptr)
	{
	wban_tcp_bridge_client2_state		*prs_ptr;

	FIN_MT (_op_wban_tcp_bridge_client2_svar (gen_ptr, var_name, var_p_ptr))

	if (var_name == OPC_NIL)
		{
		*var_p_ptr = (void *)OPC_NIL;
		FOUT
		}
	prs_ptr = (wban_tcp_bridge_client2_state *)gen_ptr;

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
	*var_p_ptr = (void *)OPC_NIL;

	FOUT
	}

