MIL_3_Tfile_Hdr_ 1800 175B modeler 6 56970ABB 57228939 14 volta chaganti 0 0 none none 0 0 none FB50F029 8C81 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                ��g�      <   �   �  �  �  �  2�  Er  a�  a�  ~�  ��  �=      node   ethernet   IP   UDP   RIP   TCP   hidden   10BaseT   TCP   workstation   OSPF   100BaseT   	1000BaseX   wkstn������������   TCP Lab Client       General Node Functions:   -----------------------       The tcp_lab_client  node model    represents a workstation with    (client-server applications running over    #TCP/IP and UDP/IP. The workstation    !supports one underlying Ethernet    )connection at 10 Mbps, 100 Mbps, or 1000    Mbps.                )This workstation requires a fixed amount    !of time to route each packet, as    'determined by the "IP Forwarding Rate"    *attribute of the node. Packets are routed    *on a first-come-first-serve basis and may    (encounter queuing at the lower protocol    &layers, depending on the transmission    "rates of the corresponding output    interfaces.               
Protocols:       
----------       )RIP, UDP, IP, TCP, IEEE 802.3 (Ethernet,    &Fast Ethernet, Gigabit Ethernet), OSPF               Interconnections:       -----------------       Either of the following:       $1) 1 Ethernet connection at 10 Mbps,       (2) 1 Ethernet connection at 100 Mbps, or       %3) 1 Ethernet connection at 1000 Mbps               Attributes:       -----------       "Client Custom Application, Client    $Database Application, Client Email,    *Client Ftp, Client Remote Login, Client X    $Windows, Client Video Conferencing,    %Client Start Time:  These attributes    allow for the specification of    &application traffic generation in the    node.               *Transport Address:  This attribute allows    (for the specification of the address of    	the node.               )"IP Forwarding Rate": specifies the rate    *(in packets/second) at which the node can    "perform a routing decision for an    'arriving packet and transfer it to the    appropriate output interface.               )"IP Gateway Function": specifies whether    *the local IP node is acting as a gateway.    )Workstations should not act as gateways,    (as they only have one network interface.               *"RIP Process Mode": specifies whether the    (RIP process is silent or active. Silent    &RIP processes do not send any routing    (updates but simply receive updates. All    )RIP processes in a workstation should be    silent RIP processes.               ("TCP Connection Information": specifies    )whether diagnostic information about TCP    #connections from this node will be    'displayed at the end of the simulation.               '"TCP Maximum Segment Size": determines    'the size of segments sent by TCP. This    'value should be set to largest segment    %size that the underlying network can    carry unfragmented.               )"TCP Receive Buffer Capacity": specifies    $the size of the buffer used to hold    (received data before it is forwarded to    the application.               <<Summary>>       General Function: workstation       (Supported Protocols: UDP, IP, Ethernet,    &Fast Ethernet, Gigabit Ethernet, RIP,    	TCP, OSPF       Port Interface Description:       (  1 Ethernet connection at 10 Mbps, 100    Mbps, or 1000 Mbps              ApplicationApplication Duration      client.Duration����   ����               ����              ����              ����                        "ApplicationApplication Start Time      client.Start Time����   ����               ����              ����              ����                        EthernetEthernet Parameters      mac.MAC Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       ApplicationFast Send      client.Fast Send����   ����           ����          ����          ����                        IP Gateway Function      
ip.gateway����   ����           ����          ����          ����                        IP Host Parameters      ip.ip host parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IP Processing Information      ip.ip processing information����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                        ApplicationImmediate Close      client.Immediate Close����    ����           ����          ����          ����                         ApplicationLocal Port      client.Local Port����    ����           ����          ����          ����                        Packet Capture      mac.pkt_capture_mode����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       $ApplicationPacket Interarrival Args      client.Packet Interarrival Args����   ����       ����      ����      ����                        #ApplicationPacket Interarrival PDF      client.Packet Interarrival PDF����   ����       ����      ����      ����                        ApplicationPacket Size Args      client.Packet Size Args����   ����       ����      ����      ����                        ApplicationPacket Size PDF      client.Packet Size PDF����   ����       ����      ����      ����                        ApplicationRemote IP Address      client.Remote IP Address����   ����       ����      ����      ����                         ApplicationRemote Port      client.Remote Port����    ����           ����          ����          ����                         ApplicationRepeat Count      client.Repeat Count����    ����           ����          ����          ����                        TCP Parameters      tcp.TCP Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                    :   Application Duration         @�      ����      Application Start Time         @      ����      !CPU.Advanced Server Configuration         
            count    ���   
   ����   
      list   	���   
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
            count    ���   
   ����   
      list   	���   
            Hardware Configuration          
            count    ���   
   ����   
      list   	���   
            LPAR Configuration          
            count    ���   
    ����   
      list   	���   
       
   
      BASIC Mode Configuration          
            count    ���   
   ����   
      list   	���   
            Paging System Configuration          
      	No Paging   
   
   
      LPAR Resource Management          
      Disabled   
   
   
      Workload Group Configuration          
            count    ���   
    ����   
      list   	���   
       
   
   
   
   1CPU.mframe_base.Mainframe Workload Activity Table               Export      Ethernet Parameters         
      Default (Host)   
   IP Gateway Function         
       Disabled   
   IP Host Parameters         
            count    ���   
   ����   
      list   	���   
            Interface Information          
            count    ���   
   ����   
      list   	���   
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
            count    ���   
   ����   
      list   	���   
          
   
   
Local Port             ����      Packet Capture               Not Used      Packet Interarrival Args            5.0      Packet Interarrival PDF            exponential      Packet Size Args            8192      Packet Size PDF            exponential      Remote IP Address            N.O.N.E      Remote Port             ����      TCP Parameters         
      Default   
   
TIM source         
   ip   
   altitude         
        ����   
   altitude modeling            relative to subnet-platform      arp.ARP Parameters         
      Default   
   	condition         
   ����   
   financial cost            0.00      ip.BGP L2VPN/VPLS Parameters               None      ip.DVMRP Parameters               Not Configured      ip.IGMP Parameters               Not Configured      ip.IP Forwarding Table         
      Do Not Export   
   !ip.IP Multicast Group-to-RP Table                Do Not Export      ip.LACP System Priority            � ����      ip.LDP L2VPN/VPLS Parameters               None      ip.MSDP Parameters               Not Configured      ip.NAT Parameters               Not Configured      ip.PIM Parameters               Not Configured      (ip.PIM-DVMRP Interoperability Parameters               Not Configured      ip.PIM-SM Routing Table               Do Not Export      ip.VRF Instances               None      ip.VRF Table         
      Do Not Export   
   ip.ip multicast information         
            count    ���   
   ����   
      list   	���   
          
   
   ip.ip qos parameters         
            count    ���   
   ����   
      list   	���   
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
            count    ���   
   ����   
      list   	���   
            Interface Information          
            count    ���   
   ����   
      list   	���   
            QoS Information          
      None   
   
   
      Loopback Interfaces          
            count    ���   
   ����   
      list   	���   
            Name          
   Loopback   
   
   
      Static Routing Table          
      None   
   
   
   ip.ip security parameters         
            count    ���   
   ����   
      list   	���   
            IPSec Parameters          
      None   
      Interface Information          
      None   
   
   
   ip.ip slot information         
            count    ���   
   ����   
      list   	���   
          
   
   ip.ip_igmp_host.IGMP Parameters               Default      ip.ipv6 parameters         
            count    ���   
   ����   
      list   	���   
          
   
   $ip.manet_mgr.AD-HOC Routing Protocol            None      ip.manet_mgr.AODV Parameters               Default      ip.manet_mgr.DSR Parameters               Default      !ip.manet_mgr.TORA/IMEP Parameters               Default      ip.mpls_mgr.MPLS Parameters                     count    ���   
   ����   
      list   	���   
          
      minimized icon            circle/#708090      phase         
        ����   
   priority          
    ����   
   role         ����      user id          
    ����   
            8   �          
   ip_encap   
       
   ip_encap_v4   
          	processor                      8  R          
   arp   
       
   	ip_arp_v4   
          	processor                      8   �          
   tcp   
       
   tcp_manager_v3_test   
          	processor                      8   �          
   client   
       
   wban_tcp_client_trail   
          	processor                     8  �          
   mac   
       
   ethernet_mac_v2   
          queue                   pkt_capture_mode   ���   	      Not Used   	         
  �          
   
hub_rx_0_0   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
��I�%��}����   
      packet formats   ���   
   ethernet_v2   
   
   
               ����             pt_rx                       nd_ptp_receiver         !  f  �          
   
hub_tx_0_0   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
��I�%��}����   
      packet formats   ���   
   ethernet_v2   
   
   
          pt_tx                       nd_ptp_transmitter          "  8  $          
   ip   
       
   ip_dispatch   
          	processor                    #  �   �          
   CPU   
       
   
server_mgr   
          	processor                   0   �  E          
   wban_mac   
       
   wban_mac_process_v2   
          queue                   MAC Attributes   ���   
            count    ���   
   ����   
      list   	���   
            Batterie Life Extension   ���   
    ����   
      Max Packet Tries    ���   	   ����   	   
   
   	   1  K  �          
   rx   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A-�    ����   
      packet formats   ���   
   wban_frame_PPDU_format   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
   
   
       
   qpsk   
       ?�      ����                  ����             
dra_ragain             	dra_power          
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
          ra_rx                       nd_radio_receiver         2   �  �          
   tx   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A-�    ����   
      packet formats   ���   
   wban_frame_PPDU_format   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
      power   ���   
?����h�����   
   
   
       
   qpsk   
          dra_rxgroup             	dra_txdel          
   dra_closure   
          dra_chanmatch             
dra_tagain          
   dra_propdel   
          ra_tx                       nd_radio_transmitter          3   e   �          
   Traffic Sink   
       
   wban_sink_process_mod   
          	processor                    5   �   �          
   Traffic Source_UP   
       J   wban_packet_source_up_process   J          	processor                   "User Priority 0 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 1 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 2 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 3 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      "User Priority 4 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            	MSDU Size   ���   
   constant (960)   
      
Start Time   ���   
��         Infinity   
   
   	      "User Priority 5 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            
Start Time   ���   
?�z�G�{����   
   
   	      "User Priority 6 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            	MSDU Size   ���   
   constant (960)   
      
Start Time   ���   
��         Infinity   
   
   	      "User Priority 7 Traffic Parameters   ���   	            count    ���   
   ����   
      list   	���   
            
Start Time   ���   
��         Infinity   
   
   	          ,              �  +  �   
       
   	strm_1101   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          -      !     D  �  Z  �   
       
   	strm_4101   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����          
@ ������   
                                        nd_packet_stream          .           D   �  X   �  X   �  D   �   
       
   	strm_4104   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����          
@ ������   
                                        nd_packet_stream          /           +   �     �     �  +   �   
       
   	strm_4105   
       
   src stream [1]   
       
   dest stream [0]   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          0           D  W  X  W  X  �  D  �   
       
   	strm_4106   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����          
@ ������   
                                        nd_packet_stream          1           +      �    [  +  [   
       
   	strm_4112   
       
   src stream [1]   
       
   dest stream [1]   
          ����                  ����          
@�  ����   
                                        nd_packet_stream         2   !        b  �  D  �          
   	stat_0101   
       
   channel [0]   
       
   point-to-point transmitter.busy   
       
   
instat [0]   
          ����                  ����          
    ����   
          ����              ����              ����          ԲI�%��}����          ԲI�%��}����          
@��U����   
                                        nd_statistic_wire         3            
  �  +  �          
   st_7   
       
   channel [0]   
       
   point-to-point receiver.busy   
       
   
instat [1]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����          
@��U����   
                                        nd_statistic_wire         4       !       �  Y  �          
   assoc_0   
       
@�� ����   
                                        nd_association          5           +   �     �     �  +   �   
       
   	strm_4113   
       
   1   
       
   0   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          6           D   �  W   �  W   �  D   �   
       
   	strm_4114   
       
   0   
       
   1   
          ����                  ����          
@ ������   
                                        nd_packet_stream          7   "        D  '  U  '  U  L  2  L          
   port_0   
       
   0   
       
   0   
          ����                  ����          
@ ������   
                                        nd_packet_stream         ip addr index           
    ����   
����    ����           ����          ����          ����                  8   "        +             �  >   �   
       
   strm_9   
       
   1   
       
   0   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          9      "     7  O    O    +  +  +          
   	in_port_0   
       
   1   
       
   0   
          ����                  ����          
@�  ����   
                                        nd_packet_stream         ip addr index           
    ����   
����    ����           ����          ����          ����                  :      "     6   �  U   �  U     D     
       
   strm_8   
       
   0   
       
   1   
          ����                  ����          
@ ������   
                                        nd_packet_stream          K   0   2      �  F   �  �   
       
   STRM_FROM_MAC_TO_RADIO   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          L   1   0     L  �   �  =   
       
   STRM_FROM_RADIO_TO_MAC   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream         M   2   0      �  �   �  F          
   tx_busy_stat   
       
   channel [0]   
       
   radio transmitter.busy   
       
   
instat [0]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire         N   1   0     O  �   �  I          
   rx_busy_stat   
       
   channel [0]   
       
   radio receiver.busy   
       
   
instat [1]   
          ����                  ����             ����          
   ����   
           ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire         O   1   0     S  �   �  A          
   collision_rx   
       
   channel [0]   
       
   radio receiver.collision status   
       
   
instat [2]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����          
@�� ����   
                                        nd_statistic_wire          P   0   3      �  <   l   �   
       
   STRM_FROM_MAC_TO_SINK   
       
   src stream [1]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          Q   5   0      �   �   �  ;   
       
   STRM_FROM_UP_TO_MAC   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream          R   3         ^   �   c   &       U   !  =   �   
       
   STRM_FROM_APPL_TO_IP   
       
   src stream [1]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream          S      3     4   �  6   6   z   7   f   �   
       
   STRM_FROM_IP_TO_APPL   
       
   src stream [1]   
       
   dest stream [2]   
          ����                  ����             ����                                           nd_packet_stream      6   T   -   "tcp.Congestion Window Size (bytes)   Congestion Window Size (bytes)           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Delay (sec)   Delay (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes)   Load (bytes)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets)   Load (packets)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets/sec)   Load (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Received Segment Ack Number   Received Segment Ack Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $tcp.Received Segment Sequence Number    Received Segment Sequence Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &tcp.Remote Receive Window Size (bytes)   "Remote Receive Window Size (bytes)           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $tcp.Retransmission Timeout (seconds)    Retransmission Timeout (seconds)           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !tcp.Segment Round Trip Time (sec)   Segment Round Trip Time (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %tcp.Segment Round Trip Time Deviation   !Segment Round Trip Time Deviation           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Sent Segment Ack Number   Sent Segment Ack Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Sent Segment Sequence Number   Sent Segment Sequence Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Connection Aborts   Connection Aborts           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Delay (sec)   Delay (sec)           TCP    bucket/default total/sample mean   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes)   Load (bytes)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets)   Load (packets)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets/sec)   Load (packets/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Flight Size (bytes)   Flight Size (bytes)           TCP Connection   sample/default total   square-wave   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Retransmission Count   Retransmission Count           TCP Connection   bucket/default total/sum   discrete   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP Connection    bucket/default total/sample mean   discrete   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Selectively ACKed Data (bytes)   Selectively ACKed Data (bytes)           TCP Connection   bucket/default total/max value   square-wave   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Send Delay (CWND) (sec)   Send Delay (CWND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Send Delay (Nagle's) (sec)   Send Delay (Nagle's) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Send Delay (RCV-WND) (sec)   Send Delay (RCV-WND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Active Connection Count   Active Connection Count           TCP   !bucket/default total/sum/no reset   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Connection Aborts (RST Rcvd)   Connection Aborts (RST Rcvd)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Connection Aborts (RST Sent)   Connection Aborts (RST Sent)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Retransmission Count   Retransmission Count           TCP   bucket/default total/sum   discrete   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP    bucket/default total/sample mean   discrete   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !wban_mac.Remaining Energy (Joule)   Remaining Energy (Joule)           Battery   normal   linear   BatteryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    wban_mac.Consumed Energy (Joule)   Consumed Energy (Joule)           Battery   normal   linear   BatteryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    wban_mac.Consumed Current (Iavg)   Consumed Current (Iavg)           Battery   normal   linear   BatteryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   wban_mac.Battery Life (Years)   Battery Life (Years)           Battery   normal   linear   BatteryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   wban_mac.Consumed Power(Watts)   Consumed Power(Watts)           Battery   bucket/default total/sum_time����   BatteryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}                     
   shape_0   
       
    ����   
          ����             0����          
@f�     ����   
       
@g�     ����   
       
@n      ����   
       
@Q�     ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                 
   text_0   
       
      APPLICATION LAYER   
          ����          
   ����   
           ����          
@i@     ����   
       
@d�     ����   
       
@_�     ����   
       
@1      ����   
          
annot_text             Annotation Palette          
E�sX����   
       ����          
@�������   
               ����              ����           ����                 
   text_1   
       
      UP   TRAFFIC   
          ����          
    ����   
           ����          
@k      ����   
       
@o@     ����   
       
@C      ����   
       
@5      ����   
          
annot_text             Annotation Palette          
E�s�����   
       ����          
@�������   
               ����              ����           ����                 
   text_3   
       
      PHYSICAL LAYER   
          ����          
   ����   
           ����          
@n0     ����   
       
@{X     ����   
       
@Z�     ����   
       
@*      ����   
          
annot_text             Annotation Palette          
E�t'����   
       ����          
@�������   
               ����              ����           ����                  
   shape_3   
       
    ����   
          ����             0����          
@kP     ����   
       
@tH     ����   
       
@d�     ����   
       
@T@     ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                 
   text_4   
       
      	MAC LAYER   
          ����          
   ����   
           ����          
@f�     ����   
       
@t      ����   
       
@P�     ����   
       
@*      ����   
          
annot_text             Annotation Palette          
E�t'����   
       ����          
@�������   
               ����              ����           ����                  
   shape_2   
       
    ����   
          ����             0����          
@m�     ����   
       
@|�     ����   
       
@r�     ����   
       
@Q      ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����      machine type       workstation   Model Attributes      12.0.A-July12-2006                 interface type      5ethernet:10BaseT,ethernet:100BaseT,ethernet:1000BaseX   interface class       ip      6IP Host Parameters.Interface Information [<n>].Address      
IP Address   :IP Host Parameters.Interface Information [<n>].Subnet Mask      IP Subnet Mask       hub_tx_<n>_0   hub_rx_<n>_0            T�I�%��}   @      @  �   @�  @4                                  