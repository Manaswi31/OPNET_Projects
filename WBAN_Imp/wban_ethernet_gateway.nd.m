MIL_3_Tfile_Hdr_ 1800 175B modeler 6 5660BDFA 56E3321C 17 volta chaganti 0 0 none none 0 0 none 48B9FA5B 86D8 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                ЋЭg      <   Л   у      э  2ё  D0  b  b  }W  я        node   ethernet   IP   UDP   RIP   TCP   hidden   10BaseT   TCP   workstation   OSPF   100BaseT   	1000BaseX   wkstnџџџџџџџџџџџџ   TCP Lab Client       General Node Functions:   -----------------------       The tcp_lab_client  node model    represents a workstation with    (client-server applications running over    #TCP/IP and UDP/IP. The workstation    !supports one underlying Ethernet    )connection at 10 Mbps, 100 Mbps, or 1000    Mbps.                )This workstation requires a fixed amount    !of time to route each packet, as    'determined by the "IP Forwarding Rate"    *attribute of the node. Packets are routed    *on a first-come-first-serve basis and may    (encounter queuing at the lower protocol    &layers, depending on the transmission    "rates of the corresponding output    interfaces.               
Protocols:       
----------       )RIP, UDP, IP, TCP, IEEE 802.3 (Ethernet,    &Fast Ethernet, Gigabit Ethernet), OSPF               Interconnections:       -----------------       Either of the following:       $1) 1 Ethernet connection at 10 Mbps,       (2) 1 Ethernet connection at 100 Mbps, or       %3) 1 Ethernet connection at 1000 Mbps               Attributes:       -----------       "Client Custom Application, Client    $Database Application, Client Email,    *Client Ftp, Client Remote Login, Client X    $Windows, Client Video Conferencing,    %Client Start Time:  These attributes    allow for the specification of    &application traffic generation in the    node.               *Transport Address:  This attribute allows    (for the specification of the address of    	the node.               )"IP Forwarding Rate": specifies the rate    *(in packets/second) at which the node can    "perform a routing decision for an    'arriving packet and transfer it to the    appropriate output interface.               )"IP Gateway Function": specifies whether    *the local IP node is acting as a gateway.    )Workstations should not act as gateways,    (as they only have one network interface.               *"RIP Process Mode": specifies whether the    (RIP process is silent or active. Silent    &RIP processes do not send any routing    (updates but simply receive updates. All    )RIP processes in a workstation should be    silent RIP processes.               ("TCP Connection Information": specifies    )whether diagnostic information about TCP    #connections from this node will be    'displayed at the end of the simulation.               '"TCP Maximum Segment Size": determines    'the size of segments sent by TCP. This    'value should be set to largest segment    %size that the underlying network can    carry unfragmented.               )"TCP Receive Buffer Capacity": specifies    $the size of the buffer used to hold    (received data before it is forwarded to    the application.               <<Summary>>       General Function: workstation       (Supported Protocols: UDP, IP, Ethernet,    &Fast Ethernet, Gigabit Ethernet, RIP,    	TCP, OSPF       Port Interface Description:       (  1 Ethernet connection at 10 Mbps, 100    Mbps, or 1000 Mbps              ApplicationApplication Duration      client.Durationџџџџ   џџџџ               џџџџ              џџџџ              џџџџ                        "ApplicationApplication Start Time      client.Start Timeџџџџ   џџџџ               џџџџ              џџџџ              џџџџ                        EthernetEthernet Parameters      mac.MAC Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ         џџџџ          џџџџ          џџџџ           ЅZ             list   	џџџџџџџ   	џџџџ                                              ЅZ                       ApplicationFast Send      client.Fast Sendџџџџ   џџџџ           џџџџ          џџџџ          џџџџ                        IP Gateway Function      
ip.gatewayџџџџ   џџџџ           џџџџ          џџџџ          џџџџ                        IP Host Parameters      ip.ip host parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ           ЅZ             list   	џџџџџџџ   	џџџџ                                              ЅZ                       IP Processing Information      ip.ip processing informationџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ           ЅZ             list   	џџџџџџџ   	џџџџ                                              ЅZ                        ApplicationImmediate Close      client.Immediate Closeџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                         ApplicationLocal Port      client.Local Portџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                        Packet Capture      mac.pkt_capture_modeџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ         џџџџ          џџџџ          џџџџ           ЅZ             list   	џџџџџџџ   	џџџџ                                              ЅZ                       $ApplicationPacket Interarrival Args      client.Packet Interarrival Argsџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                        #ApplicationPacket Interarrival PDF      client.Packet Interarrival PDFџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                        ApplicationPacket Size Args      client.Packet Size Argsџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                        ApplicationPacket Size PDF      client.Packet Size PDFџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                        ApplicationRemote IP Address      client.Remote IP Addressџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                         ApplicationRemote Port      client.Remote Portџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                         ApplicationRepeat Count      client.Repeat Countџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                        TCP Parameters      tcp.TCP Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ           ЅZ             list   	џџџџџџџ   	џџџџ                                              ЅZ                    :   Application Duration         @Ќ      џџџџ      Application Start Time         @      џџџџ      !CPU.Advanced Server Configuration         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Server Type          
   Sun Ultra 10 333 MHz   
      CPU Partitions          
      Solaris   
      Local Storage Subsystem          
      None   
      Storage Partitions          
      None   
      Job Definitions          
      	Undefined   
   
   
   CPU.Compatibility Mode                 
Simple CPU      CPU.Resource Parameters               Single Processor      CPU.background utilization               None      $CPU.mframe_base.Mainframe Parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Hardware Configuration          
            count    џџџ   
   џџџџ   
      list   	џџџ   
            LPAR Configuration          
            count    џџџ   
    џџџџ   
      list   	џџџ   
       
   
      BASIC Mode Configuration          
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Paging System Configuration          
      	No Paging   
   
   
      LPAR Resource Management          
      Disabled   
   
   
      Workload Group Configuration          
            count    џџџ   
    џџџџ   
      list   	џџџ   
       
   
   
   
   1CPU.mframe_base.Mainframe Workload Activity Table               Export      Ethernet Parameters         
      Default (Host)   
   IP Gateway Function         
       Disabled   
   IP Host Parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Interface Information          
            count    џџџ   
   џџџџ   
      list   	џџџ   
            MTU           
       Ethernet   
      QoS Information          
      None   
   
   
      Static Routing Table          
      None   
   
   
   IP Processing Information         
            count    џџџ   
   џџџџ   
      list   	џџџ   
          
   
   
Local Port             џџџџ      Packet Capture               Not Used      Packet Interarrival Args            5.0      Packet Interarrival PDF            exponential      Packet Size Args            8192      Packet Size PDF            exponential      Remote IP Address            N.O.N.E      Remote Port             џџџџ      TCP Parameters         
      Default   
   
TIM source         
   ip   
   altitude         
        џџџџ   
   altitude modeling            relative to subnet-platform      arp.ARP Parameters         
      Default   
   	condition         
   џџџџ   
   financial cost            0.00      ip.BGP L2VPN/VPLS Parameters               None      ip.DVMRP Parameters               Not Configured      ip.IGMP Parameters               Not Configured      ip.IP Forwarding Table         
      Do Not Export   
   !ip.IP Multicast Group-to-RP Table                Do Not Export      ip.LACP System Priority             џџџџ      ip.LDP L2VPN/VPLS Parameters               None      ip.MSDP Parameters               Not Configured      ip.NAT Parameters               Not Configured      ip.PIM Parameters               Not Configured      (ip.PIM-DVMRP Interoperability Parameters               Not Configured      ip.PIM-SM Routing Table               Do Not Export      ip.VRF Instances               None      ip.VRF Table         
      Do Not Export   
   ip.ip multicast information         
            count    џџџ   
   џџџџ   
      list   	џџџ   
          
   
   ip.ip qos parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Interface Information          
      None   
      Traffic Classes          
      None   
      Traffic Policies          
      None   
      WFQ/DWFQ Profiles          
      None   
      Priority Queue Profiles          
      None   
      Custom Queue Profiles          
      None   
      MDRR Profiles          
      None   
      DWRR Profiles          
      None   
      Policer Profiles          
      None   
      Traffic Shaping Profiles          
      None   
      RED/WRED Profiles          
      None   
      Dropping Profiles          
      None   
      Rate-Limit Access Control Lists          
      None   
      
Table Maps          
      None   
   
   
   ip.ip router parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Interface Information          
            count    џџџ   
   џџџџ   
      list   	џџџ   
            QoS Information          
      None   
   
   
      Loopback Interfaces          
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Name          
   Loopback   
   
   
      Static Routing Table          
      None   
   
   
   ip.ip security parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            IPSec Parameters          
      None   
      Interface Information          
      None   
   
   
   ip.ip slot information         
            count    џџџ   
   џџџџ   
      list   	џџџ   
          
   
   ip.ip_igmp_host.IGMP Parameters               Default      ip.ipv6 parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
          
   
   $ip.manet_mgr.AD-HOC Routing Protocol            None      ip.manet_mgr.AODV Parameters               Default      ip.manet_mgr.DSR Parameters               Default      !ip.manet_mgr.TORA/IMEP Parameters               Default      ip.mpls_mgr.MPLS Parameters                     count    џџџ   
   џџџџ   
      list   	џџџ   
          
      minimized icon            circle/#708090      phase         
        џџџџ   
   priority          
    џџџџ   
   role         џџџџ      user id          
    џџџџ   
             Ю   \          
   application layer   
       
   wpan_application_fuzzy   
          	processor                   Best-effort   џџџ   	      disabled   	      Destination MAC Address    џџџ   	    џџџџ   	      	Real-time   џџџ   	      disabled   	          Ю   И          
   network layer   
       
   wpan_network   
          	processor                   Device Depth    џџџ   	    џџџџ   	      Maximum Children    џџџ   	   џџџџ   	      Maximum Depth    џџџ   	   џџџџ   	      Maximum Routers    џџџ   	   џџџџ   	   	     *  p          
   wireless_rx   
       
            count    џџџ   
   џџџџ   
      list   	џџџ   
            	data rate   џџџ   
A    џџџџ   
      packet formats   џџџ   
   wpan_frame_PPDU_format   
      	bandwidth   џџџ   
@@     џџџџ   
      min frequency   џџџ   
@ЂТ     џџџџ   
   
   
       
   qpsk   
       ?№      џџџџ                  џџџџ             
dra_ragain          
   	dra_power   
       
   dra_bkgnoise   
       
   
dra_inoise   
       
   dra_snr   
       
   dra_ber   
       
   	dra_error   
       
   dra_ecc   
          ra_rx                       nd_radio_receiver            r  p          
   wireless_tx   
       
            count    џџџ   
   џџџџ   
      list   	џџџ   
            	data rate   џџџ   
A    џџџџ   
      packet formats   џџџ   
   wpan_frame_PPDU_format   
      	bandwidth   џџџ   
@@     џџџџ   
      min frequency   џџџ   
@ЂТ     џџџџ   
      power   џџџ   	@Y      џџџџ   	   
   
       
   qpsk   
          dra_rxgroup             	dra_txdel          
   dra_closure   
          dra_chanmatch             
dra_tagain          
   dra_propdel   
          ra_tx                       nd_radio_transmitter               И          
   battery   
       
   wpan_battery   
          	processor                   Current Draw   џџџ   	      MICAz   	          Ю            
   	mac layer   
       
   wpan_mac   
          queue                   GTS Parameters   џџџ   
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Receive GTS   џџџ   	      disabled   	      Transmit GTS   џџџ   	      disabled   	      
GTS Permit   џџџ   	    џџџџ   	      Buffer Capacity    џџџ   	  шџџџџ   	   
   
      MAC Parameters   џџџ   
            count    џџџ   
   џџџџ   
      list   	џџџ   
            CSMA Parameters   џџџ   	            count    џџџ   
   џџџџ   
      list   	џџџ   
          
   	      Number of Retransmissions    џџџ   	   џџџџ   	      Beacon Order    џџџ   	      15   	      Superframe Order    џџџ   	      15   	      PAN ID    џџџ   	    џџџџ   	      	StartTime   џџџ   	        џџџџ   	      Buffer Capacity    џџџ   	  шџџџџ   	   
   
       !  >   ц          
   ip_encap   
       J   ip_encap_v4   J          	processor                    "  >  B          
   arp   
       
   	ip_arp_v4   
          	processor                    #  >   И          
   tcp   
       
   tcp_manager_v3_test   
          	processor                    $  >             
   client   
       
   wban_tcp_client_trail   
          	processor                   %  >  p          
   mac   
       
   ethernet_mac_v2   
          queue                   pkt_capture_mode   џџџ   	      Not Used   	      &              
   
hub_rx_0_0   
       
            count    џџџ   
   џџџџ   
      list   	џџџ   
            	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
   
   
               џџџџ             pt_rx                       nd_ptp_receiver         '  l            
   
hub_tx_0_0   
       
            count    џџџ   
   џџџџ   
      list   	џџџ   
            	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
   
   
          pt_tx                       nd_ptp_transmitter          (  >            
   ip   
       
   ip_dispatch   
          	processor                    )               
   CPU   
       
   
server_mgr   
          	processor                       ,            Ч   _   Ч   Е   
       
   STRM_FROM_APPL_TO_NWK   
       
   src stream [0]   
       
   dest stream [0]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream          -            ж   А   ж   d   
       
   STRM_FROM_NWK_TO_APPL   
       
   src stream [0]   
       
   dest stream [0]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream          .             Х   П   Х  
   
       
   STRM_FROM_NWK_TO_MAC   
       
   src stream [1]   
       
   dest stream [0]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream          /             ж     ж   Р   
       
   STRM_FROM_MAC_TO_NWK   
       
   src stream [0]   
       
   dest stream [1]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream          0             У     z  f   
       
   STRM_FROM_MAC_TO_RADIO   
       
   src stream [1]   
       
   dest stream [0]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream          1               e   з     
       
   STRM_FROM_RADIO_TO_MAC   
       
   src stream [0]   
       
   dest stream [1]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream         2             u  d   Т            
   tx_busy_stat   
       
   channel [0]   
       
   radio transmitter.busy   
       
   
instat [0]   
          џџџџ                  џџџџ             џџџџ             џџџџ              џџџџ              џџџџ          дВI­%У}џџџџ          дВI­%У}џџџџ             0џџџџ                                           nd_statistic_wire         3            $  d   й            
   rx_busy_stat   
       
   channel [0]   
       
   radio receiver.busy   
       
   
instat [1]   
          џџџџ                  џџџџ             џџџџ             џџџџ              џџџџ              џџџџ          дВI­%У}џџџџ          дВI­%У}џџџџ             0џџџџ                                           nd_statistic_wire         4              j   б            
   collision_rx   
       
   channel [0]   
       
   radio receiver.collision status   
       
   
instat [2]   
          џџџџ                  џџџџ             џџџџ             џџџџ              џџџџ              џџџџ          дВI­%У}џџџџ          дВI­%У}џџџџ             0џџџџ                                           nd_statistic_wire          5   &   %         1  y   
       
   	strm_1101   
       
   src stream [0]   
       
   dest stream [0]   
          џџџџ                  џџџџ          
@џ  џџџџ   
                                        nd_packet_stream          6   %   '     J  {  `     
       
   	strm_4101   
       
   src stream [0]   
       
   dest stream [0]   
          џџџџ                  џџџџ          
@ Њџџџџџ   
                                        nd_packet_stream          7   #   !     J   П  ^   П  ^   п  J   п   
       
   	strm_4104   
       
   src stream [0]   
       
   dest stream [1]   
          џџџџ                  џџџџ          
@ Њџџџџџ   
                                        nd_packet_stream          8   !   #     1   п     п     О  1   О   
       
   	strm_4105   
       
   src stream [1]   
       
   dest stream [0]   
          џџџџ                  џџџџ          
@џ  џџџџ   
                                        nd_packet_stream          9   "   %     J  G  ^  G  ^  r  J  q   
       
   	strm_4106   
       
   src stream [0]   
       
   dest stream [1]   
          џџџџ                  џџџџ          
@ Њџџџџџ   
                                        nd_packet_stream          :   %   "     1  o     p     K  1  K   
       
   	strm_4112   
       
   src stream [1]   
       
   dest stream [1]   
          џџџџ                  џџџџ          
@џ  џџџџ   
                                        nd_packet_stream         ;   '   %     h    J  s          
   	stat_0101   
       
   channel [0]   
       
   point-to-point transmitter.busy   
       
   
instat [0]   
          џџџџ                  џџџџ          
    џџџџ   
          џџџџ              џџџџ              џџџџ          дВI­%У}џџџџ          дВI­%У}џџџџ          
@џџUџџџџ   
                                        nd_statistic_wire         <   &   %         1  p          
   st_7   
       
   channel [0]   
       
   point-to-point receiver.busy   
       
   
instat [1]   
          џџџџ                  џџџџ             џџџџ             џџџџ              џџџџ              џџџџ          дВI­%У}џџџџ          дВI­%У}џџџџ          
@џџUџџџџ   
                                        nd_statistic_wire         =   &   '         _            
   assoc_0   
       
@џЊ џџџџ   
                                        nd_association          >   #   $     1   Ж     Ж       1      
       
   	strm_4113   
       
   1   
       
   0   
          џџџџ                  џџџџ          
@џ  џџџџ   
                                        nd_packet_stream          ?   $   #     J     ]     ]   Ж  J   Ж   
       
   	strm_4114   
       
   0   
       
   1   
          џџџџ                  џџџџ          
@ Њџџџџџ   
                                        nd_packet_stream          @   (   "     J    [    [  <  8  <          
   port_0   
       
   0   
       
   0   
          џџџџ                  џџџџ          
@ Њџџџџџ   
                                        nd_packet_stream         ip addr index           
    џџџџ   
џџџџ    џџџџ           џџџџ          џџџџ          џџџџ                  A   (   !     1           ф  D   х   
       
   strm_9   
       
   1   
       
   0   
          џџџџ                  џџџџ          
@џ  џџџџ   
                                        nd_packet_stream          B   "   (     =  ?    ?      1            
   	in_port_0   
       
   1   
       
   0   
          џџџџ                  џџџџ          
@џ  џџџџ   
                                        nd_packet_stream         ip addr index           
    џџџџ   
џџџџ    џџџџ           џџџџ          џџџџ          џџџџ                  C   !   (     <   ф  [   ф  [    J     
       
   strm_8   
       
   0   
       
   1   
          џџџџ                  џџџџ          
@ Њџџџџџ   
                                        nd_packet_stream          D      $      Ы   T   Ь   /  E   1  E      
       
   STRM_FROM_APPL_TO_IP   
       
   src stream [1]   
       
   dest stream [1]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream          E   $        >     4   D   р   >   г   [   
       
   STRM_FROM_IP_TO_APPL   
       
   src stream [1]   
       
   dest stream [2]   
          џџџџ                  џџџџ             џџџџ                                           nd_packet_stream      *   F   )   "tcp.Congestion Window Size (bytes)   Congestion Window Size (bytes)           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Delay (sec)   Delay (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (bytes)   Load (bytes)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (packets)   Load (packets)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (packets/sec)   Load (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Received Segment Ack Number   Received Segment Ack Number           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   $tcp.Received Segment Sequence Number    Received Segment Sequence Number           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   &tcp.Remote Receive Window Size (bytes)   "Remote Receive Window Size (bytes)           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   $tcp.Retransmission Timeout (seconds)    Retransmission Timeout (seconds)           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   !tcp.Segment Round Trip Time (sec)   Segment Round Trip Time (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   %tcp.Segment Round Trip Time Deviation   !Segment Round Trip Time Deviation           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Sent Segment Ack Number   Sent Segment Ack Number           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}    tcp.Sent Segment Sequence Number   Sent Segment Sequence Number           TCP Connection   sample/default total   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Connection Aborts   Connection Aborts           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Delay (sec)   Delay (sec)           TCP    bucket/default total/sample mean   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (bytes)   Load (bytes)           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (packets)   Load (packets)           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Load (packets/sec)   Load (packets/sec)           TCP   bucket/default total/sum_time   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP   bucket/default total/sum_time   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Flight Size (bytes)   Flight Size (bytes)           TCP Connection   sample/default total   square-wave   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Retransmission Count   Retransmission Count           TCP Connection   bucket/default total/sum   discrete   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP Connection    bucket/default total/sample mean   discrete   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   "tcp.Selectively ACKed Data (bytes)   Selectively ACKed Data (bytes)           TCP Connection   bucket/default total/max value   square-wave   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Send Delay (CWND) (sec)   Send Delay (CWND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Send Delay (Nagle's) (sec)   Send Delay (Nagle's) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Send Delay (RCV-WND) (sec)   Send Delay (RCV-WND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Active Connection Count   Active Connection Count           TCP   !bucket/default total/sum/no reset   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}    tcp.Connection Aborts (RST Rcvd)   Connection Aborts (RST Rcvd)           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}    tcp.Connection Aborts (RST Sent)   Connection Aborts (RST Sent)           TCP   bucket/default total/sum   linear   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Retransmission Count   Retransmission Count           TCP   bucket/default total/sum   discrete   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP    bucket/default total/sample mean   discrete   TCPдВI­%У}дВI­%У}дВI­%У}дВI­%У}   3application layer.Fuzzy Logic Processing Time(usec)   !Fuzzy Logic Processing Time(usec)           Application   normal   linear   ApplicationдВI­%У}дВI­%У}дВI­%У}дВI­%У}                    
   text_3   
       
      PHYSICAL LAYER   
          џџџџ          
   џџџџ   
           џџџџ          
@i№     џџџџ   
       
@xX     џџџџ   
       
@ZР     џџџџ   
       
@*      џџџџ   
          
annot_text             Annotation Palette          
Eмt'џџџџ   
       џџџџ          
@РРРџџџџ   
               џџџџ              џџџџ           џџџџ                  
   shape_2   
       
    џџџџ   
          џџџџ             0џџџџ          
@i     џџџџ   
       
@v№     џџџџ   
       
@r№     џџџџ   
       
@Q      џџџџ   
          	annot_box             Annotation Palette          
Eмs:џџџџ   
       џџџџ                  џџџџ       џџџџ                  
   shape_4   
       
    џџџџ   
          џџџџ             0џџџџ          
@x0     џџџџ   
       
@g     џџџџ   
       
@Z     џџџџ   
       
@T@     џџџџ   
          	annot_box             Annotation Palette          
Eмs:џџџџ   
       џџџџ                  џџџџ       џџџџ                 
   text_5   
       
      BATTERY MODULE   
          џџџџ          
   џџџџ   
           џџџџ          
@xP     џџџџ   
       
@c№     џџџџ   
       
@Z     џџџџ   
       
@9      џџџџ   
          
annot_text             Annotation Palette          
Eмt'џџџџ   
       џџџџ          
@РРРџџџџ   
               џџџџ              џџџџ           џџџџ      machine type       workstation   Model Attributes      12.0.A-July12-2006                 interface type      5ethernet:10BaseT,ethernet:100BaseT,ethernet:1000BaseX   interface class       ip      6IP Host Parameters.Interface Information [<n>].Address      
IP Address   :IP Host Parameters.Interface Information [<n>].Subnet Mask      IP Subnet Mask       hub_tx_<n>_0   hub_rx_<n>_0            TТI­%У}   @      @  џ   @џ  @4                                  