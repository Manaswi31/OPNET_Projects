/** PHY Layer constatns		**/
#define aMaxPHYPacketSize_Octet 	127					// size of PSDU
#define aMaxPHYPacketSize_Bits 		(8*aMaxPHYPacketSize_Octet)		// 1016 bits
#define aMaxPHYPacketSize_Symbols 	(2*aMaxPHYPacketSize_Octet)		// 254 Symbols
#define aTurnaroundTime_Symbol 		12

/** MAC Layer constants		**/
#define aNumSuperframeSlots 16
#define aBaseSlotDuration	60 	// The number of symbols forming a superframe slot for a superframe order equal to 0
#define aMaxBE	5
#define aMaxBeaconOverhead_Octet	75
#define aMaxBeaconPayloadLength_Octet 	(aMaxPHYPacketSize_Octet-aMaxBeaconOverhead_Octet)
#define aBaseSuperframeDuration	(aNumSuperframeSlots*aBaseSlotDuration)
#define aUnitBackoffPeriod	20
#define aMaxLostBeacons 4
#define aMinMPDUOverhead_Octet 9
#define aMaxMACPayloadSize_Octet (aMaxPHYPacketSize_Octet-aMinMPDUOverhead_Octet)
#define aMaxMPDUUnsecuredOverhead_Octet 25
#define aMaxMACSafePayloadSize_Octet (aMaxPHYPacketSize_Octet-aMaxMPDUUnsecuredOverhead_Octet)

// constants related to Intra-Frame Spacing IFS 
#define aMaxSIFSFrameSize_Bits	(18*8)
#define aMinLIFSPeriod	40
#define aMinSIFSPeriod	12

#define aGTSDescPersistenceTime	4
#define aMinCAPLength	440	//Symbols

/** Device mode **/
#define PAN_COORDINATOR 0
#define ROUTER 1
#define END_DEVICE 2

#define NO_PARENT	-1

/** Traffic Type **/
#define REAL_TIME_TRAFFIC 	0
#define BEST_EFFORT_TRAFFIC 1

/** MAC Layer attributes		**/
#define macAckWaitDuration 54	// The max number of symbols to wait for an ACK


/** Frame Types Definitions according to the standard IEEE 802.15.4 2003 - p.112, Tab.65 **/
#define BEACON_FRAME_TYPE	0
#define DATA_FRAME_TYPE 	1
#define ACK_FRAME_TYPE 		2
#define COMMAND_FRAME_TYPE 	3

/** Command frame identifiers **/
#define ASSOCIATION_REQ 		1
#define ASSOCIATION_RES 		2
#define DISASSOCIATION_NOT 		3
#define DATA_REQ 				4
#define PAN_ID_CONFLICT_NOT 	5
#define ORPHAN_NOT 				6
#define BEACON_REQ 				7
#define COORDINATOR_REALIGMNET 	8
#define GTS_REQ 				9

/** Frame Types accodring to ZigBee specification **/
#define NWK_DATA_FRAME_TYPE 	0
#define NWK_COMMAND_FRAME_TYPE 	1

/** NWK radius parameter **/
#define RADIUS 10

/** NWK Command Identifier **/
#define ROUTE_REQ 		1
#define ROUTE_REPLY 	2
#define ROUTE_ERROR 	3
#define LEAVE 			4
#define ROUTE_RECORD 	5
#define REJOIN_REQ 		6
#define REJOIN_RES 		7

/* NWK Discovery Route */
#define SUPPRESS_ROUTE_DISCOVERY 	0
#define ENABLE_ROUTE_DISCOVERY 		1
#define FORCE_ROUTE_DISCOVERY 		2

// WPAN bit rate [bps]
#define WPAN_DATA_RATE 250000.0

// broadcast address corresponds to 0xFFFF
#define BROADCAST_ADDRESS 65535

#define Symbol2Bits 4

// Frame Control Field - Dest./Src. addressing mode = 10b (Address field contains a 16  bit short address) - [bits] MHR+MFR
#define MAC_HEADER_SIZE 104	

// Frame Control Field - Src. addressing mode = 10b (Address field contains a 16  bit short address) - [bits] MHR+MFR
#define BEACON_HEADER_SIZE 72

// Physical layer header (SHR+PHR) [bits]
#define PHY_HEADER_SIZE 48

// Beacon frame (MAC payload MSDU) size with length of beacon payload set to 0 [bits]
#define BEACON_MSDU_SIZE 32

// ACK frame (MPDU) size [bits]
#define ACK_FRAME_SIZE_BITS 40


// start time, stop time
#define START_DISABLED		-1
#define END_OF_SIMULATION	-1

#define NOT_DEFINED 	-1

//////// delete

// temporary address of PAN coordinator (Traffic Destination MAC Adrress)
#define	PAN_COORDINATOR_ADDRESS	-1

