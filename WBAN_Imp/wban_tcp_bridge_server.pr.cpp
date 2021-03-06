/* Process model C++ form file: wban_tcp_bridge_server.pr.cpp */
/* Portions of this file copyright 2014 by Riverbed Technology. All rights reserved. */


/*
 =========================== NOTE ==========================
 This file is automatically generated from wban_tcp_bridge_server.pr.m
 during a process model compilation.

 Do NOT manually edit this file.
 Manual edits will be lost during the next compilation.
 =========================== NOTE ==========================
*/



/* This variable carries the header into the object file */
const char wban_tcp_bridge_server_pr_cpp [] = "MIL_3_Tfile_Hdr_ 1800 30A modeler 7 569884EE 569884EE 1 volta chaganti 0 0 none none 0 0 none 0 0 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                           ";
#include <string.h>



/* OPNET system definitions */
#include <opnet.h>



/* Header Block */

#include "ip_addr_v4.h"
#include "tcp_api_v3.h"
#include <stdio.h>
//#include "1508_lab3_real_payload_support.h"

/*	Define constants used in the process model.			*/
#define	TCP_LAB_GEN_CONN_OPEN		100
#define	TCP_LAB_GEN_CONN_CLOSE		200
#define TCP_LAB_GEN_PK_CREATE		300

/*	State transition macro definitions.					*/
#define	CONN_OPEN			((op_intrpt_type () == OPC_INTRPT_SELF) && \
							 (op_intrpt_code () == TCP_LAB_GEN_CONN_OPEN))

#define CONN_ESTABLISHED	((intrpt_type == OPC_INTRPT_REMOTE) &&	\
							 (intrpt_code == TCPC_IND_CONNECT_REQUEST))

#define	PKT_RECEIVE			(op_intrpt_type () == OPC_INTRPT_STRM)

#define	CONN_RELEASE		((op_intrpt_type () == OPC_INTRPT_REMOTE) && \
							 (op_intrpt_code () == TCPC_IND_FIN_RECEIVED ||\
							  op_intrpt_code () == TCPC_IND_CLOSED))

#define	TCP_INTRPT			(intrpt_type == OPC_INTRPT_REMOTE && \
							 intrpt_code == TCPC_IND_NONE)


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
class wban_tcp_bridge_server_state
	{
	private:
		/* Internal state tracking for FSM */
		FSM_SYS_STATE

	public:
		wban_tcp_bridge_server_state (void);

		/* Destructor contains Termination Block */
		~wban_tcp_bridge_server_state (void);

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
		Ici*	                   		command_ici_ptr                                 ;
		Ici*	                   		tcp_open_ind_ici_ptr                            ;
		FILE*	                  		pFile                                           ;
		int	                    		stream_count                                    ;
		int	                    		child_count                                     ;
		Prohandle	              		child_proc                                      ;

		/* FSM code */
		void wban_tcp_bridge_server (OP_SIM_CONTEXT_ARG_OPT);
		/* Diagnostic Block */
		void _op_wban_tcp_bridge_server_diag (OP_SIM_CONTEXT_ARG_OPT);

#if defined (VOSD_NEW_BAD_ALLOC)
		void * operator new (size_t) throw (VOSD_BAD_ALLOC);
#else
		void * operator new (size_t);
#endif
		void operator delete (void *);

		/* Memory management */
		static VosT_Obtype obtype;
	};

VosT_Obtype wban_tcp_bridge_server_state::obtype = (VosT_Obtype)OPC_NIL;

#define pr_state_ptr            		((wban_tcp_bridge_server_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))
#define my_id                   		pr_state_ptr->my_id
#define local_port              		pr_state_ptr->local_port
#define remote_port             		pr_state_ptr->remote_port
#define remote_inet_ip_addr     		pr_state_ptr->remote_inet_ip_addr
#define tcp_app_handle          		pr_state_ptr->tcp_app_handle
#define connect_id              		pr_state_ptr->connect_id
#define inet_address            		pr_state_ptr->inet_address
#define conn_options            		pr_state_ptr->conn_options
#define local_inet_ip_addr      		pr_state_ptr->local_inet_ip_addr
#define command_ici_ptr         		pr_state_ptr->command_ici_ptr
#define tcp_open_ind_ici_ptr    		pr_state_ptr->tcp_open_ind_ici_ptr
#define pFile                   		pr_state_ptr->pFile
#define stream_count            		pr_state_ptr->stream_count
#define child_count             		pr_state_ptr->child_count
#define child_proc              		pr_state_ptr->child_proc

/* These macro definitions will define a local variable called	*/
/* "op_sv_ptr" in each function containing a FIN statement.	*/
/* This variable points to the state variable data structure,	*/
/* and can be used from a C debugger to display their values.	*/
#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE
#define FIN_PREAMBLE_DEC	wban_tcp_bridge_server_state *op_sv_ptr;
#define FIN_PREAMBLE_CODE	\
		op_sv_ptr = ((wban_tcp_bridge_server_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr));


/* No Function Block */

#if !defined (VOSD_NO_FIN)
enum { _op_block_origin = __LINE__ };
#endif

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
#undef command_ici_ptr
#undef tcp_open_ind_ici_ptr
#undef pFile
#undef stream_count
#undef child_count
#undef child_proc

/* Access from C kernel using C linkage */
extern "C"
{
	VosT_Obtype _op_wban_tcp_bridge_server_init (int * init_block_ptr);
	VosT_Address _op_wban_tcp_bridge_server_alloc (VosT_Obtype, int);
	void wban_tcp_bridge_server (OP_SIM_CONTEXT_ARG_OPT)
		{
		((wban_tcp_bridge_server_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))->wban_tcp_bridge_server (OP_SIM_CONTEXT_PTR_OPT);
		}

	void _op_wban_tcp_bridge_server_svar (void *, const char *, void **);

	void _op_wban_tcp_bridge_server_diag (OP_SIM_CONTEXT_ARG_OPT)
		{
		((wban_tcp_bridge_server_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr))->_op_wban_tcp_bridge_server_diag (OP_SIM_CONTEXT_PTR_OPT);
		}

	void _op_wban_tcp_bridge_server_terminate (OP_SIM_CONTEXT_ARG_OPT)
		{
		/* The destructor is the Termination Block */
		delete (wban_tcp_bridge_server_state *)(OP_SIM_CONTEXT_PTR->_op_mod_state_ptr);
		}


} /* end of 'extern "C"' */




/* Process model interrupt handling procedure */


void
wban_tcp_bridge_server_state::wban_tcp_bridge_server (OP_SIM_CONTEXT_ARG_OPT)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	FIN_MT (wban_tcp_bridge_server_state::wban_tcp_bridge_server ());
	try
		{
		/* Temporary Variables */
		Packet*			pkptr;
		int				intrpt_type;
		int				intrpt_code;
		InetT_Address	*remote_addr_ptr;
		int				tcp_conn_id;
		OpT_uInt32		incoming_payload;
		char 			msg0[256];
		/* End of Temporary Variables */


		FSM_ENTER ("wban_tcp_bridge_server")

		FSM_BLOCK_SWITCH
			{
			/*---------------------------------------------------------*/
			/** state (INIT) enter executives **/
			FSM_STATE_ENTER_UNFORCED_NOLABEL (0, "INIT", "wban_tcp_bridge_server [INIT enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [INIT enter execs]", state0_enter_exec)
				{
				/*	Obtain the object ID of this process' surrounding module.	*/
				my_id = op_id_self ();
				
				/*	Schedule the start of operation.							*/
				op_intrpt_schedule_self (op_sim_time (), TCP_LAB_GEN_CONN_OPEN);
				
				/*	Create the inet IP address 									*/
				local_inet_ip_addr = inet_address_from_ipv4_address_create (ip_address_create ("192.16.5.7"));
				
				/* This application must register itself with the TCP API. The	*/
				/* API handle will be used on all subsequent calls to the API.	*/
				tcp_app_handle = tcp_app_register (my_id);
				
				/* Open the output file in which we will add the contents of 	*/
				/* received application packets.								*/
				//pFile = fopen ("C:\\op_models\\1508_lab3_server_output.txt", "w"); 
				
				/*if (!pFile)
					{
					op_sim_end ("Output file could not be opened.", "", "", "");
					} */
				
				/* Count input streams */
				stream_count = op_topo_assoc_count (op_id_self(), OPC_TOPO_ASSOC_IN, OPC_OBJTYPE_STRM);
				printf("Stream count : %d\n", stream_count);
				}
				FSM_PROFILE_SECTION_OUT (state0_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (1,"wban_tcp_bridge_server")


			/** state (INIT) exit executives **/
			FSM_STATE_EXIT_UNFORCED (0, "INIT", "wban_tcp_bridge_server [INIT exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [INIT exit execs]", state0_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				}
				FSM_PROFILE_SECTION_OUT (state0_exit_exec)


			/** state (INIT) transition processing **/
			FSM_TRANSIT_ONLY ((CONN_OPEN), 2, state2_enter_exec, ;, INIT, "CONN_OPEN", "", "INIT", "OPEN", "tr_32", "wban_tcp_bridge_server [INIT -> OPEN : CONN_OPEN / ]")
				/*---------------------------------------------------------*/



			/** state (DATA) enter executives **/
			FSM_STATE_ENTER_UNFORCED (1, "DATA", state1_enter_exec, "wban_tcp_bridge_server [DATA enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [DATA enter execs]", state1_enter_exec)
				{
				if(CONN_ESTABLISHED){
				
				/* Call a child process to handle incoming request */
				/* Start listening for new connections */
				
				//child_proc [child_count++] = op_pro_create ("dynproc_child", OPC_NIL);
				//op_pro_invoke (child_proc [child_count++], OPC_NIL);
				
				}
				
				if (PKT_RECEIVE)
					{
					/*	A packet has been received by the TCP CLient.	*/
					
					/*	Print trace statements.							*/
					if (op_prg_odb_ltrace_active ("tcp"))
						op_prg_odb_print_major ("Received Data Packet from TCP Layer", OPC_NIL);
				
					/* Get the incoming packet.							*/
					pkptr = op_pk_get (op_intrpt_strm ());
					printf("SERVER RECEIVE\n");
					op_pk_print(pkptr);
				
					/* Check if there is anything stored in the 		*/
					/* "payload" field of the incoming application 		*/
					/* packet.											*/
					if (op_pk_nfd_is_set (pkptr, "payload"))
						{
						/* Get the "payload" field of the incoming 		*/
						/* application packet.							*/
						op_pk_nfd_get (pkptr, "payload", &incoming_payload);
						
						/* Write whatever is contained in the "payload"	*/
						/* field in the incoming application packet to 	*/
						/* the output file.								*/
				//		fprintf (pFile, "%s\r\n", incoming_payload);
						}
				
					/*	Destroy the received packet and ICI.			*/
					op_ici_destroy (op_intrpt_ici ());
					op_strm_flush (OPC_STRM_ALL);
				
					/*	Issue a RECEIVE command to the TCP Layer. The 	*/
					/*	receive command specifies that the TCP Client	*/
					/*	is ready to receive the number of packets as	*/
					/*	specified as the argument to receive command.	*/
					tcp_receive_command_send (tcp_app_handle, 1);
					}
				
				if (TCP_INTRPT)
					{
					/* The application received an OPEN confirm from  	*/
					/* TCP indicating that the transport connection has */
					/* been successfully established.					*/
					
					/*	Issue a RECEIVE command to the TCP Layer. The 	*/
					/*	receive command specifies that the TCP Client	*/
					/*	is ready to receive the number of packets as	*/
					/*	specified as the argument to receive command.	*/
					tcp_receive_command_send (tcp_app_handle, 1);
					}
				}
				FSM_PROFILE_SECTION_OUT (state1_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (3,"wban_tcp_bridge_server")


			/** state (DATA) exit executives **/
			FSM_STATE_EXIT_UNFORCED (1, "DATA", "wban_tcp_bridge_server [DATA exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [DATA exit execs]", state1_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				}
				FSM_PROFILE_SECTION_OUT (state1_exit_exec)


			/** state (DATA) transition processing **/
			FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [DATA trans conditions]", state1_trans_conds)
			FSM_INIT_COND (PKT_RECEIVE)
			FSM_TEST_COND (CONN_RELEASE)
			FSM_DFLT_COND
			FSM_TEST_LOGIC ("DATA")
			FSM_PROFILE_SECTION_OUT (state1_trans_conds)

			FSM_TRANSIT_SWITCH
				{
				FSM_CASE_TRANSIT (0, 1, state1_enter_exec, ;, "PKT_RECEIVE", "", "DATA", "DATA", "tr_4", "wban_tcp_bridge_server [DATA -> DATA : PKT_RECEIVE / ]")
				FSM_CASE_TRANSIT (1, 3, state3_enter_exec, ;, "CONN_RELEASE", "", "DATA", "RELEASE", "tr_30", "wban_tcp_bridge_server [DATA -> RELEASE : CONN_RELEASE / ]")
				FSM_CASE_TRANSIT (2, 1, state1_enter_exec, ;, "default", "", "DATA", "DATA", "tr_63", "wban_tcp_bridge_server [DATA -> DATA : default / ]")
				}
				/*---------------------------------------------------------*/



			/** state (OPEN) enter executives **/
			FSM_STATE_ENTER_UNFORCED (2, "OPEN", state2_enter_exec, "wban_tcp_bridge_server [OPEN enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [OPEN enter execs]", state2_enter_exec)
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
						
					/* Open a passive TCP connection and wait for an  		*/
					/* incoming request from the client. The struct  		*/
					/* conn_options also contains pointers to the callback  */
					/* functions for serialization and deserialization.		*/
					connect_id = tcp_connection_open_with_options (&tcp_app_handle, INETC_ADDRESS_INVALID, 
						TCPC_PORT_UNSPEC, TCPC_COMMAND_OPEN_PASSIVE, &conn_options);
					
					/*	Generate trace messsage								*/
					if (op_prg_odb_ltrace_active ("tcp"))
						{
						op_prg_odb_print_major ("server: TCP Passive Open", OPC_NIL);
						}
					}
				}
				FSM_PROFILE_SECTION_OUT (state2_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (5,"wban_tcp_bridge_server")


			/** state (OPEN) exit executives **/
			FSM_STATE_EXIT_UNFORCED (2, "OPEN", "wban_tcp_bridge_server [OPEN exit execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [OPEN exit execs]", state2_exit_exec)
				{
				/*	Determine the Interrupt Type and Interrupt Code.	*/
				/*	This is used to determine state transitions and		*/
				/*	process model logic.								*/
				intrpt_type = op_intrpt_type ();
				intrpt_code = op_intrpt_code ();
				
				/* The connection established signal from the TCP Layer	*/ 
				/* is in form of a REMOTE interrupt with an associated 	*/
				/* ICI.													*/
				if (intrpt_type == OPC_INTRPT_REMOTE && intrpt_code == TCPC_IND_CONNECT_REQUEST)
					{
					/* Open the fields of the assosiated ICI.			*/
					tcp_open_ind_ici_ptr = op_intrpt_ici ();
					
					/* Get the conn id from the ICI.					*/
					op_ici_attr_get (tcp_open_ind_ici_ptr, "conn id",  &tcp_conn_id);
				
					/* Get the remote IP address from the associated 	*/
					/* ICI.												*/
					op_ici_attr_get (tcp_open_ind_ici_ptr, "rem addr", &remote_addr_ptr);
					remote_inet_ip_addr = inet_address_copy (*remote_addr_ptr);
					
					/* Get the local port.								*/
					op_ici_attr_get (tcp_open_ind_ici_ptr, "local port", &local_port);
					
					/* Get the remort port.								*/
					op_ici_attr_get (tcp_open_ind_ici_ptr, "rem port", &remote_port);
				
					/*	Generate trace messsage							*/
					if (op_prg_odb_ltrace_active ("tcp"))
						{
						sprintf (msg0, "server: conn id: %d, local_port: %d, remote_port :%d", tcp_conn_id, local_port, remote_port);
						op_prg_odb_print_major (msg0, OPC_NIL);	
						}
					}
				}
				FSM_PROFILE_SECTION_OUT (state2_exit_exec)


			/** state (OPEN) transition processing **/
			FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [OPEN trans conditions]", state2_trans_conds)
			FSM_INIT_COND (CONN_ESTABLISHED)
			FSM_DFLT_COND
			FSM_TEST_LOGIC ("OPEN")
			FSM_PROFILE_SECTION_OUT (state2_trans_conds)

			FSM_TRANSIT_SWITCH
				{
				FSM_CASE_TRANSIT (0, 1, state1_enter_exec, ;, "CONN_ESTABLISHED", "", "OPEN", "DATA", "tr_33", "wban_tcp_bridge_server [OPEN -> DATA : CONN_ESTABLISHED / ]")
				FSM_CASE_TRANSIT (1, 2, state2_enter_exec, ;, "default", "", "OPEN", "OPEN", "tr_4", "wban_tcp_bridge_server [OPEN -> OPEN : default / ]")
				}
				/*---------------------------------------------------------*/



			/** state (RELEASE) enter executives **/
			FSM_STATE_ENTER_UNFORCED (3, "RELEASE", state3_enter_exec, "wban_tcp_bridge_server [RELEASE enter execs]")
				FSM_PROFILE_SECTION_IN ("wban_tcp_bridge_server [RELEASE enter execs]", state3_enter_exec)
				{
				if (CONN_RELEASE)
					{
					/* Destroy the TCP API handle.	*/
					tcp_app_handle_destroy (&tcp_app_handle);
				
					/* Close the output file.		*/
					fclose (pFile);
					}
				
				
				}
				FSM_PROFILE_SECTION_OUT (state3_enter_exec)

			/** blocking after enter executives of unforced state. **/
			FSM_EXIT (7,"wban_tcp_bridge_server")


			/** state (RELEASE) exit executives **/
			FSM_STATE_EXIT_UNFORCED (3, "RELEASE", "wban_tcp_bridge_server [RELEASE exit execs]")


			/** state (RELEASE) transition processing **/
			FSM_TRANSIT_FORCE (3, state3_enter_exec, ;, "default", "", "RELEASE", "RELEASE", "tr_4", "wban_tcp_bridge_server [RELEASE -> RELEASE : default / ]")
				/*---------------------------------------------------------*/



			}


		FSM_EXIT (0,"wban_tcp_bridge_server")
		}
	catch (...)
		{
		Vos_Error_Print (VOSC_ERROR_ABORT,
			(const char *)VOSC_NIL,
			"Unhandled C++ exception in process model (wban_tcp_bridge_server)",
			(const char *)VOSC_NIL, (const char *)VOSC_NIL);
		}
	}




void
wban_tcp_bridge_server_state::_op_wban_tcp_bridge_server_diag (OP_SIM_CONTEXT_ARG_OPT)
	{
	/* No Diagnostic Block */
	}

void
wban_tcp_bridge_server_state::operator delete (void* ptr)
	{
	FIN (wban_tcp_bridge_server_state::operator delete (ptr));
	Vos_Poolmem_Dealloc (ptr);
	FOUT
	}

wban_tcp_bridge_server_state::~wban_tcp_bridge_server_state (void)
	{

	FIN (wban_tcp_bridge_server_state::~wban_tcp_bridge_server_state ())


	/* No Termination Block */


	FOUT
	}


#undef FIN_PREAMBLE_DEC
#undef FIN_PREAMBLE_CODE

#define FIN_PREAMBLE_DEC
#define FIN_PREAMBLE_CODE

void *
wban_tcp_bridge_server_state::operator new (size_t)
#if defined (VOSD_NEW_BAD_ALLOC)
		throw (VOSD_BAD_ALLOC)
#endif
	{
	void * new_ptr;

	FIN_MT (wban_tcp_bridge_server_state::operator new ());

	new_ptr = Vos_Alloc_Object (wban_tcp_bridge_server_state::obtype);
#if defined (VOSD_NEW_BAD_ALLOC)
	if (new_ptr == VOSC_NIL) throw VOSD_BAD_ALLOC();
#endif
	FRET (new_ptr)
	}

/* State constructor initializes FSM handling */
/* by setting the initial state to the first */
/* block of code to enter. */

wban_tcp_bridge_server_state::wban_tcp_bridge_server_state (void) :
		_op_current_block (0)
	{
#if defined (OPD_ALLOW_ODB)
		_op_current_state = "wban_tcp_bridge_server [INIT enter execs]";
#endif
	}

VosT_Obtype
_op_wban_tcp_bridge_server_init (int * init_block_ptr)
	{
	FIN_MT (_op_wban_tcp_bridge_server_init (init_block_ptr))

	wban_tcp_bridge_server_state::obtype = Vos_Define_Object_Prstate ("proc state vars (wban_tcp_bridge_server)",
		sizeof (wban_tcp_bridge_server_state));
	*init_block_ptr = 0;

	FRET (wban_tcp_bridge_server_state::obtype)
	}

VosT_Address
_op_wban_tcp_bridge_server_alloc (VosT_Obtype, int)
	{
#if !defined (VOSD_NO_FIN)
	int _op_block_origin = 0;
#endif
	wban_tcp_bridge_server_state * ptr;
	FIN_MT (_op_wban_tcp_bridge_server_alloc ())

	/* New instance will have FSM handling initialized */
#if defined (VOSD_NEW_BAD_ALLOC)
	try {
		ptr = new wban_tcp_bridge_server_state;
	} catch (const VOSD_BAD_ALLOC &) {
		ptr = VOSC_NIL;
	}
#else
	ptr = new wban_tcp_bridge_server_state;
#endif
	FRET ((VosT_Address)ptr)
	}



void
_op_wban_tcp_bridge_server_svar (void * gen_ptr, const char * var_name, void ** var_p_ptr)
	{
	wban_tcp_bridge_server_state		*prs_ptr;

	FIN_MT (_op_wban_tcp_bridge_server_svar (gen_ptr, var_name, var_p_ptr))

	if (var_name == OPC_NIL)
		{
		*var_p_ptr = (void *)OPC_NIL;
		FOUT
		}
	prs_ptr = (wban_tcp_bridge_server_state *)gen_ptr;

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
	if (strcmp ("command_ici_ptr" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->command_ici_ptr);
		FOUT
		}
	if (strcmp ("tcp_open_ind_ici_ptr" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->tcp_open_ind_ici_ptr);
		FOUT
		}
	if (strcmp ("pFile" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->pFile);
		FOUT
		}
	if (strcmp ("stream_count" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->stream_count);
		FOUT
		}
	if (strcmp ("child_count" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->child_count);
		FOUT
		}
	if (strcmp ("child_proc" , var_name) == 0)
		{
		*var_p_ptr = (void *) (&prs_ptr->child_proc);
		FOUT
		}
	*var_p_ptr = (void *)OPC_NIL;

	FOUT
	}

