
/* define the general device parameters */
typedef struct {
	double	x; // X coordinate of this node 
	double	y; // Y coordinate of this node
	double altitude; // The altitude of this node
		
	Boolean my_parent_GTSPermit;	// TRUE if my parent accept GTS request. FALSE otherwise.
	Boolean macGTSPermit;	// TRUE if this device (router/PANCoordinator) accept GTS requests. FALSE otherwise.
	List* GTS_list;	// list of allocated GTS slots in PANCoordinator or router
	
	int beacon_order;
	int superframe_order;
	int pan_id;	
	double startTime; // the time at which to begin transmitting beacon - measured from receprtion of my parent's beacon
	
	int macMaxFrameRetries;	// maximum number of retransmissions
	
	Boolean wait_ack;	// acknowledged packet?
	int wait_ack_seq_num;	// the sequence number of the waiting ACK	
} wpan_node_attributes;

/* define the GTS parameters of the node */
typedef struct {
	double start_time;	// start of the using of the GTS
	double stop_time;	// end of the using of GTS
	int length;	 // asked length of the GTS [superframe slots]
	int direction;	// direction of the transmission (device->parent (transmit)=0, parent->device(receive)=1)
	int start_slot;	// start slot given by parent and received from the beacon frame
	int retries_nbr;	// actual number of retries (< aMaxFrameRetries)
	Boolean is_waiting_GTS_confirm; // waiting for the confirmation of the allocated GTS slots from beacon frame after GTS request command was sent out 
	int wait_GTS_confirm_count;
	Boolean is_deallocation_req_sent;	// TRUE if the deallocation request was sent out to parent
} wpan_gts_attributes;

/* define the redord storing in the wpan_node_attributes->GTS_list */
typedef struct {
	int start_slot;	// the starting superframe slot of the appropriate GTS
	int length; // length of the GTS [# superframe slots]
	int direction; // direction of the transmission (device->parent (transmit)=0, parent->device(receive)=1)	
	int assoc_dev_address;	// MAC address of associated device
	int beacon_persistence_time;	// how long this GTS descriptor will appear in the beacon [# of superframes]
	int retries_nbr;	// actual number of retries (< aMaxFrameRetries)
} wpan_gts_list_record;

/* structure carried in the GTS request command frame */
typedef struct {
	int length;	// length of the GTS [# superframe slots]
	int direction; // direction of the transmission (device->parent (transmit)=0, parent->device(receive)=1)
	int characteristics_type;	// deallocation=0, allocation=1
} wpan_gts_characteristics;

/* structure carried in the beacon frame - GTS_list_field */
typedef struct {
	int device_short_address;
	int start_slot;
	int length;
} wpan_gts_descriptor;


/* define the backoff attributes */
typedef struct {
	int macMaxCSMABackoffs; // maximum number of Backoffs
	int macMinBE; // minimum Backoff Exponent
	Boolean macBattLifeExt; // Battery Life Extension: if no then BE = macMinBE, if yes then BE = min(2,macMinBE);
} wpan_csma_attributes;

/* define the backoff parameters */
typedef struct {
	int NB; // current number of backoff
	int BE; // Backoff exponent
	int CW; // Contention Window
	Boolean CCA_CHANNEL_IDLE; // if TRUE the Channel is assessed to be idle, otherwise busy
	int retries_nbr;	// actual number of retries (< macMaxFrameRetries)
	double backoff_timer; // remaining backoff time from last CAP
	Boolean RESUME_BACKOFF_TIMER; // if TRUE the backoff is resumed in next CAP
	Boolean CCA_DEFERRED; // if TRUE the CCA must start at the begining of the CAP of the next superframe
} wpan_csma_params;


/*
          |***********************************|.................................|

          <---------Superframe Duration-------><--------- Sleep Period----------->
          <------------------------Beacon Interval ------------------------------>

*/

/* define the superframe structure parameters */
typedef struct {
	int slot_duration; // the slot duration in symbol
	int SD; // the superframe duration in symbol
	int BI; // the beacon interval in symbol
	int sleep_period; // the inactive portion in symbol
	int current_slot; // the current slot in the active portion of the superframe from 0 to 15
	double BI_Boundary; // Specfiy the time at which the beacon frame has been created to synchronize all node to this time reference
	int Final_CAP_Slot; // Final slot in the CAP
	int Final_CAP_Slot_next; // Final CAP slot in next superframe if the value was changed
	Boolean CAP_ACTIVE;	// Contention Access Period (CAP) is active 
	Boolean CFP_ACTIVE;	// Contention Free Period (GTS) is active
	Boolean SLEEP;	// Inactive portion
	wpan_csma_params csma; //CSMA attributes
} wpan_superframe_structure;


/* define the Network parameters */
/*typedef struct {	
	int max_children;	// maximum number of children (end-devices and routers)
	int max_router;		// maximum number of routers
	int max_depth;		// height of the tree
	int depth;			// depth of the device
	int parent_address; // MAC address of the parent device
} wpan_nwk_attributes; */

