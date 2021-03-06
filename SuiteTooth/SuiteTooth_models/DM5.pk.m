MIL_3_Tfile_Hdr_ 91A 40A opnet 40 38DB92BB 3EC176B9 E LEPRECHAUN hassett 0 0 none none 0 0 none 7D713B6C 1C3E 0 0 0 0                                                                                                                                                                                                                                                                                                                                                                                                                         ����             0x0             NONE       @        1/***********************************************/   ,// The SuiteTooth model set was developed by   // HIGHLAND SYSTEMS, INC.   //   /// It incorporates code available in the public   0// domain and other code that is the property of   // OPNET Technologies, Inc.   //   !// Inquiries may be addressed to:   //    // Highland Systems, Inc.   // (703) 312 0830   // info@highsys.com   // www.highsys.com   1/***********************************************/                       (                 
   Access Code   
    @                
   integer   
          signed, big endian          
   72   
       
   0   
       
   set   
          NONE             *����             1                (   Z              
   Header   
    @                
   information   
          signed, big endian          
   54   
       
   0   
       
   set   
          NONE             *����             2               D   Z              
   ARQ   
    @                   integer             signed, big endian          
   0   
       
   0   
          set             NONE             *����             3               �   Z              
   SEQN   
    @                   integer             signed, big endian          
   0   
       
   0   
          set             NONE             *����             4                (   x              
   AM_ADDR   
    @  
      Contains the frame type.   
       
   integer   
          signed, big endian          
   0   
       
   0   
          set             NONE             *����             5                       pk_field      d   x              
   TYPE   
    @  
      <This packet field is enabled by the pipeline stage when the	   +received frame is an erroneous frame.						   
          integer             signed, big endian          
   0   
       
   14   
       
   set   
          NONE             *����             6                (   �              
   L_CH   
    @                   integer             signed, big endian          
   0   
       
   0   
          set             NONE             *����             7                       pk_field      d   �              
   	DM Header   
    @  
      0Data structure for frame control fields in the     0wireless_lan packet.                                   Structure Components   typedef struct       {   O    int         protocol_version;  	/* 2 bits: currently not modeled.								*/   =	int			subtype;			/* 4 bits: currently not modeled.								*/   C    int         toDS;				/* 1 bit: currently not modeled.								*/   E    int         fromDS;				/* 1 bit: currently not modeled.								*/   U	int			more_frag;			/* 1 bit: flag to check if more fragments will be transmitted.	*/   H	int			retry;				/* 1 bit: set the flag if it is a retransmission.				*/   <	int			pwr_mgt;			/* 1 bit: currently not modeled.								*/   >	int			more_data;			/* 1 bit: currently not modeled.								*/   9	int			wep;				/* 1 bit: currently not modeled.								*/   ;	int			order;				/* 1 bit: currently not modeled.								*/   U	double		duration;  			/* 16 bits: duration for which the channel is contended.	 	*/	   S	int			address_1; 			/* 48 bits: Destination Address of the final recipient(s) 		*/   V	int			address_2; 			/* 48 bits: Source Address from where the frame is originated.	*/   S	int			address_3; 			/* 48 bits: Receiver Address for the immediate receipient	 	*/   A						   			/* station(s) address. (Currently not modeled)					*/   T	int			fragment_number;	/* Sequence control field which contains fragment number		*/   U	int			sequence_number; 	/* Sequence contorl field which contains sequence number		*/   U	int			address_4; 			/* 48 bits: Transmitter Address of the station that has last 	*/   @									/* transmitted the frame. (Currently not modeled)				*/       } WlanT_Data_Header_Fields;       +This structure is defined in wlan_support.h   
       
   integer   
          signed, big endian          
   16   
       
   0   
       
   set   
          NONE             *����             8                (   �              
   
Frame Body   
    @  
      @Data received from higher layer (MSDU: According to IEEE 802.11)   
       
   packet   
          signed, big endian          
   	inherited   
       ����             unset             NONE          
   ����   
          9                       pk_field      (   �              
   FEC   
    @                
   packet   
          signed, big endian          
   	inherited   
       ����             unset             NONE             *����             10                (  ,              
   CRC   
    @  
      'Frame check sum (currently not modeled)   
       
   information   
          signed, big endian          
   16   
       
   0   
       
   set   
          NONE             *����             11                �  ,              
   Accept   
    @                
   integer   
          signed, big endian          
   0   
       
   0   
          set             NONE          
   ����   
          12                       pk_field       ,              
   
Time Stamp   
    @                
   floating point   
          
big endian          
   0   
       
   0   
          set             NONE          
   ����   
          13               @  ,              
   Last   
    @                
   integer   
          signed, big endian          
   0   
       
   0   
          set             NONE          
   ����   
          14                       pk_field     |  ,              
   Errors   
    @                
   integer   
          signed, big endian          
   0   
       
   0   
          set             NONE          
   ����   
          15                       pk_field     �  ,              
   Way   
    @                
   integer   
          signed, big endian          
   0   
       
   0   
          set             NONE          
   ����   
          16                       pk_field     �  ,              
   	PICO_ADDR   
    @                   integer             signed, big endian          
   0   
       
   0   
          set             NONE          
@�������   
          17                       pk_field   