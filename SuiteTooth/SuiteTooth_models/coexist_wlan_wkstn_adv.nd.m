MIL_3_Tfile_Hdr_ 1800 175B modeler 6 3C34B1BC 5532A053 34 rhel06 chaganti 0 0 none none 0 0 none 311AE6C7 179A9 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                              ��g�      <   �   �    
  A�  P�  cZ  ��  �� u� u� we      node   IP   UDP   RIP   TCP   hidden   TCP   workstation   OSPF   WLAN   RSVP   
wlan_wkstn   
wlan_wkstn��������   Wireless LAN Workstation    �   1/***********************************************/   ,// The SuiteTooth model set was developed by   // HIGHLAND SYSTEMS, INC.   //   /// It incorporates code available in the public   0// domain and other code that is the property of   // OPNET Technologies, Inc.   //   !// Inquiries may be addressed to:   //    // Highland Systems, Inc.   // (703) 312 0830   // info@highsys.com   // www.highsys.com   1/***********************************************/       General Node Functions:       -----------------------       )The wlan_wkstn_adv node model represents    !a workstation with client-server    %applications running over TCP/IP and    %UDP/IP. The workstation supports one    (underlying Wlan connection at 1 Mbps, 2    Mbps, 5.5 Mbps, and 11 Mbps.                )This workstation requires a fixed amount    !of time to route each packet, as    'determined by the "IP Forwarding Rate"    *attribute of the node. Packets are routed    *on a first-come-first-serve basis and may    (encounter queuing at the lower protocol    &layers, depending on the transmission    "rates of the corresponding output    interfaces.               
Protocols:       
----------       $RIP, UDP, IP, TCP, IEEE 802.11, OSPF               Interconnections:       -----------------       Either of the following:       1) 1 WLAN connection at 1 Mbps,       2) 1 WLAN connection at 2 Mbps,       !3) 1 WLAN connection at 5.5 Mbps,        4) 1 WLAN connection at 11 Mbps                Attributes:       -----------       "Client Custom Application, Client    $Database Application, Client Email,    *Client Ftp, Client Remote Login, Client X    $Windows, Client Video Conferencing,    %Client Start Time:  These attributes    allow for the specification of    &application traffic generation in the    node.               *Transport Address:  This attribute allows    (for the specification of the address of    	the node.               )"IP Forwarding Rate": specifies the rate    *(in packets/second) at which the node can    "perform a routing decision for an    'arriving packet and transfer it to the    appropriate output interface.               )"IP Gateway Function": specifies whether    *the local IP node is acting as a gateway.    )Workstations should not act as gateways,    (as they only have one network interface.               *"RIP Process Mode": specifies whether the    (RIP process is silent or active. Silent    &RIP processes do not send any routing    (updates but simply receive updates. All    )RIP processes in a workstation should be    silent RIP processes.               ("TCP Connection Information": specifies    )whether diagnostic information about TCP    #connections from this node will be    'displayed at the end of the simulation.               '"TCP Maximum Segment Size": determines    'the size of segments sent by TCP. This    'value should be set to largest segment    %size that the underlying network can    carry unfragmented.               )"TCP Receive Buffer Capacity": specifies    $the size of the buffer used to hold    (received data before it is forwarded to    the application.               <<Summary>>       General Function: workstation       *Supported Protocols: UDP, IP, IEEE802.11,    RIP, TCP, OSPF       Port Interface Description:       '  1 WLAN connection at 1,2,5.5,11 Mbps               ARP Parameters      arp.ARP Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       #Application: ACE Tier Configuration      "application.ACE Tier Configuration����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       $Application: Destination Preferences      #application.Destination Preferences����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       'Application: Multicasting Specification      &application.Multicasting Specification����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Application: RSVP Parameters      'application.RSVP Application Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Application: Segment Size      application.Segment Size����   ����               ����              ����              ����                        Application: Source Preferences      application.Source Preferences����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Application: Supported Profiles      application.Supported Profiles����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Application: Supported Services      application.Services����   ����                                             count    �������    ����             0          ����          ����         0       ����      1      ����      2      ����      3      ����         Supported applications on    server.Applications are   defined in 'Application    Configuration' object.�Z             list   	�������   	����                                                Name   �������   ����   �      None      ����      ����         All Services      All Services      None      None         Services enabled in server.       !These services are configured in    !application configuration object.       "All Services" enables all    services defined in all    "application configuration objects    present in network.                                           gna_active_attrib_handler   (gna_supported_services_get_click_handler�������������Z             Description   �������   ����            	Supported                             Not Supported               count    ���   
   ����   
      list   	���   
          
      	Supported               count    ���   
   ����   
      list   	���   
            Service Status   ���   
       Enabled   
   
         Parameters to start and    setup Custom Application    	service.
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
       count    �������    ����         ����         ����         ����             
�Z             list   	�������   	����                                                Service Status   �������   ����             Disabled          ����          ����         Disabled       ����      Enabled      ����         Specifies whether this    service is supported on this    server. �Z             Processing Speed   �������      	bytes/sec      A.��       	1,000,000              ����              ����         10,000   @È     ����      100,000   @�j     ����      	1,000,000   A.��    ����         The processing time required    is based on the response    size for FTP Get, Email    Recv, Database Query    application types and on the    request sizes for the rest   of the applications.    �Z             Overhead   �������      sec/request      >������   1E-06              ����              ����         1E-06   >����������      1E-03   ?PbM�������      
   Overhead involved in    processing an application    
request. 
   
   
   
   
   
   
   
�Z             Selection Weight   �������   ����      @$         10              ����              ����         10   @$      ����      20   @4      ����         The popularity of this    server when it comes to    choose between two or more    servers running the    supporting the same service.
�Z             Type of Service    �������    ����   0   ����   As Requested by Client          ����          ����      	   As Requested by Client   ��������      Best Effort (0)       ����      Background (1)      ����      Standard (2)      ����      Excellent Effort (3)      ����      Streaming Multimedia (4)      ����      Interactive Multimedia (5)      ����      Interractive Voice (6)      ����      Unspecified (7)      ����         Type of Service (ToS)    assigned to packets sent    from this server. 
   
   It represents an application    attribute which allows    packests to be processed    faster in ip queues. 
   
   It is an integer between 
   0 - 7, 7 being the highest    priority. 
   
   Server has an option to    respond to a client's    request with packets having    the same type of service as    packets sent by client    (value: "As Requested by    Client") or it can define    its own type of service for    outgoing packets. 
   In the latter case client's    packets will use the ToS    specified at the client and    server's responses will    contain the server's ToS. �Z          �Z          �Z          �Z                       -Application: Transport Protocol Specification      application.Transport Protocol����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       CPU Background Utilization      CPU.background utilization����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       CPU Resource Parameters      CPU.Resource Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Client Address      tpal.Address����   ����       ����      ����      ����                         Coexistence Transceiver Type      -wlan_port_rx_0_0.Coexistence Transceiver Type   -wlan_port_tx_0_0.Coexistence Transceiver Type����    ����           ����          ����          ����                        HSRP Parameters      ip.hsrp.HSRP Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IGMP Host Parameters      $ip.ip_igmp_host.IGMP Host Attributes����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IGMP Router Parameters      *ip.ip_igmp_rte_intf.IGMP Router Attributes����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IP Gateway Function      
ip.gateway����   ����           ����          ����          ����                        IP Host Parameters      ip.ip host parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IP Processing Information      ip.ip processing information����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IP Slot Information      ip.ip slot information����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       LAN Supported Profiles      "application.LAN Supported Profiles����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       
Modulation      wlan_port_rx_0_0.modulation   wlan_port_tx_0_0.modulation����   ����       ����      ����      ����                        RSVP Protocol Parameters      rsvp.RSVP Protocol Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       SIP Proxy Server Parameters      3application.sip_UAS_mgr.SIP Proxy Server Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       SIP UAC Parameters      *application.sip_UAC_mgr.SIP UAC Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       %Server: Advanced Server Configuration      !CPU.Advanced Server Configuration����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                        Server: Modeling Method      CPU.Compatibility Mode����    ����           ����          ����          ����                        TCP Parameters      tcp.TCP Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Transmit Power (W)      "wlan_port_tx_0_0.channel [0].power   "wlan_port_tx_0_0.channel [1].power   "wlan_port_tx_0_0.channel [2].power   "wlan_port_tx_0_0.channel [3].power����   ����               ����              ����              ����                         Wireless LAN MAC Address      wireless_lan_mac.Address����    ����           ����          ����          ����                        Wireless LAN Parameters      (wireless_lan_mac.Wireless LAN Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                    ,   ARP Parameters         
      Default   
   #Application: ACE Tier Configuration         
      Unspecified   
   $Application: Destination Preferences         
      None   
   'Application: Multicasting Specification         
      None   
   Application: RSVP Parameters         
      None   
   Application: Segment Size                    64,000      Application: Source Preferences         
      None   
   Application: Supported Profiles         
      None   
   Application: Supported Services         
      None   
   -Application: Transport Protocol Specification         
      Default   
   CPU Background Utilization         
      None   
   CPU Resource Parameters         
      Single Processor   
   Client Address         
   Auto Assigned   
   Coexistence Transceiver Type             ����      HSRP Parameters         
      Not Configured   
   IGMP Host Parameters         
      Default   
   IGMP Router Parameters         
      Default   
   IP Gateway Function         
       Disabled   
   IP Host Parameters         
            count    ���   
   ����   
      list   	���   
            Interface Information   ���   
            count    ���   
   ����   
      list   	���   
            MTU    ���   
       WLAN   
      QoS Information   ���   
      None   
   
   
      Static Routing Table   ���   
      None   
   
   
   IP Processing Information         
      Default   
   IP Slot Information         
      NOT USED   
   LAN Supported Profiles         
      None   
   
Modulation         
   
CCK_11mbps   
   RSVP Protocol Parameters                   SIP Proxy Server Parameters                   SIP UAC Parameters                   %Server: Advanced Server Configuration         
      Sun Ultra 10 333 MHz   
   Server: Modeling Method                 
Simple CPU      TCP Parameters         
      Default   
   
TIM source         
   ip   
   Transmit Power (W)         
?��Q������   
   Wireless LAN MAC Address                 Auto Assigned      Wireless LAN Parameters         
            count    ���   
   ����   
      list   	���   
            Physical Characteristics    ���   
      Direct Sequence   
      Channel Settings   ���   
            count    ���   
   ����   
      list   	���   
            	Bandwidth   ���   
@�|     ����   
   
   
      Large Packet Processing   ���   
      Fragment   
      PCF Parameters   ���   
      Disabled   
   
   
   altitude         
?�      ����   
   altitude modeling            relative to subnet-platform      	condition         
   ����   
   financial cost            0.00      ip.ip multicast information         
      Default   
   ip.ip router parameters                     count    ���   
   ����   
      list   	���   
            Interface Information   ���   
            count    ���   
   ����   
      list   	���   
            QoS Information   ���   
      None   
   
   
      Loopback Interfaces   ���   
            count    ���   
   ����   
      list   	���   
            Name   ���   
   Loopback   
   
   
      Static Routing Table   ���   
      None   
   
      ip.mpls_mgr.MPLS Parameters                     count    ���   
   ����   
      list   	���   
          
      phase         
        ����   
   priority          
    ����   
   role         ����      user id          
    ����   
              >   �          
   udp   
       
   
rip_udp_v3   
       
   	processor   
                    �   �          
   ip_encap   
       
   ip_encap_v4   
       
   	processor   
                    �  $          
   arp   
       
   	ip_arp_v4   
       
   	processor   
                    �   �          
   tcp   
       
   tcp_manager_v3   
       
   	processor   
                    �   l          
   tpal   
       
   tpal_v3   
       
   	processor   
                 
   �   >          
   application   
       
   gna_clsvr_mgr   
       
   	processor   
                    �  R          
   wireless_lan_mac   
       J   wlan_mac_manasa   J          	processor                    �   �   �          
   rsvp   
       
   rsvp   
       
   	processor   
                 �   �   �          
   ip   
       
   ip_dispatch   
          	processor                   $   �   >          
   CPU   
       
   
server_mgr   
          	processor                   Compatibility Mode    ���   	       
Simple CPU   	      Resource Parameters   ���   	      Single Processor   	      background utilization   ���   	      None   	   	  �   >  �          
   wlan_port_rx_0_0   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A.��    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
         	data rate   ���   
A>��    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
         	data rate   ���   
AT�    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
         	data rate   ���   
Ad�    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
   
   
       	   bpsk   	       ?�      ����                  ����             
dra_ragain          
   coexist_wlan_power   
       
   coexist_bkgnoise   
       
   coexist_wlan_inoise   
          dra_snr             dra_ber          
   	dra_error   
       
   wlan_ecc   
          ra_rx                       nd_radio_receiver         reception end time   ���   
           0.0   
����      sec              ����              ����              ����         0.0           ����         !THIS ATTRIBUTE SHOULD NOT BE SET    TO ANY VALUE EXCEPT 0.0. This    "attribute is used by the pipeline     stages to determine whether the    receiver is busy or not. The    value of the attribute will be    updated by the pipeline stages    dynamically during the    simulation. The value will    "indicate when the receiver became    idle or when it is expected to    become idle.          Coexistence Transceiver Type    ���      ����   ����    ����          ����          ����          ����                �   �  �          
   wlan_port_tx_0_0   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A.��    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
      power   ���   	@Y      ����   	         	data rate   ���   
A>��    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
      power   ���   	@Y      ����   	         	data rate   ���   
AT�    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
      power   ���   	@Y      ����   	         	data rate   ���   
Ad�    ����   
      packet formats   ���   
   unformatted,all formatted   
      	bandwidth   ���   
@�|     ����   
      min frequency   ���   
@��     ����   
      power   ���   	@Y      ����   	   
   
       	   bpsk   	       
   coexist_wlan_rxgroup   
       
   	dra_txdel   
       
   dra_closure_all   
       
   coexist_chanmatch   
          
dra_tagain          
   wlan_propdel   
          ra_tx                       nd_radio_transmitter         Coexistence Transceiver Type    ���      ����   ����    ����          ����          ����          ����              "                     �   �   9   �   9   �   
       
   	strm_15_2   
       
   src stream [2]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream                       ?   �   ?   �   �   �   
       
   	strm_16_2   
       
   src stream [0]   
       
   dest stream [2]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream                �      �   �   �   �   �   �   �   �   
       
   strm_8   
       
   src stream [0]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream             �         �   �   y   �   y   �   �   �   
       
   strm_9   
       
   src stream [0]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream             �         �   �   �   �   �  #   �  #          
   port_0   
       
   src stream [1]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream         ip addr index    ���   
    ����   
����    ����           ����          ����          ����                     
         �   <   �   <   �   i   �   j   
       
   strm_190   
       
   src stream [0]   
       
   dest stream [1]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream                
      �   d   {   d   {   >   �   =   
       
   strm_200   
       
   src stream [1]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream                      �   r   �   r   �   �   �   �   
       
   strm_221   
       
   src stream [0]   
       
   dest stream [1]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream                      �   �   {   �   {   u   �   u   
       
   strm_222   
       
   src stream [1]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream          	            �   �   �   �   �   �   �   �   
       
   	strm_4104   
       
   src stream [0]   
       
   dest stream [1]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream          
            �   �   z   �   z   �   �   �   
       
   	strm_4105   
       
   src stream [1]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream                       �   o   B   o   B   �   
          	strm_4107          
   src stream [3]   
       
   dest stream [2]   
       
   ����   
               ����          
   ����   
                                        nd_packet_stream                       <   �   <   h   �   h   
          	strm_4108          
   src stream [2]   
       
   dest stream [3]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream                �      �  #   {  #   {   �   �   �          
   	in_port_0   
       
   src stream [1]   
       
   dest stream [1]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream         ip addr index    ���   
    ����   
����    ����           ����          ����          ����                       �      �  U   �  U   �  s   
       
   tx_2mpbs   
       
   src stream [1]   
       
   dest stream [1]   
       
   ����   
               ����          
   ����   
                                        nd_packet_stream            �         A  s   A  T   �  T   
       
   rx_2mpbs   
       
   src stream [1]   
       
   dest stream [1]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream               �      �  N   �  N   �  v   
       
   tx_5mpbs   
       
   src stream [2]   
       
   dest stream [2]   
       
   ����   
               ����          
   ����   
                                        nd_packet_stream            �         >  s   >  O   �  O   
       
   rx_5mpbs   
       
   src stream [2]   
       
   dest stream [2]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream                      �  G   z  G   z  +   �  +   
          	strm_4109          
   src stream [4]   
       
   dest stream [4]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream                      �  ,   �  ,   �  G   �  G   
          	strm_4110          
   src stream [4]   
       
   dest stream [4]   
       
   ����   
               ����          
   ����   
                                        nd_packet_stream               �      �  H     H     �   
       
   	tx_11mpbs   
       
   src stream [3]   
       
   dest stream [3]   
       
   ����   
               ����             ����                                           nd_packet_stream               �      �  Z   �  Z   �  s   
       
   tx_1mpbs   
       
   src stream [0]   
       
   dest stream [0]   
       
   ����   
               ����             ����                                           nd_packet_stream            �         D  s   D  X   �  X   
       
   rx_1mpbs   
       
   src stream [0]   
       
   dest stream [0]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream            �         :  t   :  K   �  K   
       
   	rx_11mpbs   
       
   src stream [3]   
       
   dest stream [3]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream                �      �   �   �   �   �   �   
       
   ip_encap_to_rsvp   
       
   src stream [6]   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream             �         �   �   �   �   �   �   
       
   rsvp_to_ip_encap   
       
   src stream [0]   
       
   dest stream [6]   
       
   ����   
       
        ����   
       
   ����   
                                        nd_packet_stream           �         J  �   �  ^          
   rxstat_2mbps   
          channel [1]          
   !radio receiver.received power (W)   
          
instat [1]          
   ����   
               ����          
    ����   
       
    ����   
       
    ����   
       
    ����   
       
        ����   
       
=4��W1������   
       
    ����   
                                        nd_statistic_wire           �         �  �   �  ^          
   txstat_1mbps   
          channel [0]          
   radio transmitter.busy   
          
instat [4]          
   ����   
               ����          
    ����   
       
   ����   
       
    ����   
       
    ����   
       
ԲI�%��}����   
       
ԲI�%��}����   
       
    ����   
                                        nd_statistic_wire           �         �  �   �  ]          
   txstat_2mbps   
          channel [1]          
   radio transmitter.busy   
          
instat [4]          
   ����   
               ����          
    ����   
       
   ����   
       
    ����   
       
    ����   
       
ԲI�%��}����   
       
ԲI�%��}����   
       
    ����   
                                        nd_statistic_wire           �         J  �   �  ^          
   rxstat_1mbps   
          channel [0]          
   !radio receiver.received power (W)   
          
instat [0]          
   ����   
               ����          
    ����   
       
    ����   
       
    ����   
       
    ����   
       
        ����   
       
=4��W1������   
       
    ����   
                                        nd_statistic_wire           �         �  �   �  X          
   txstat_5mbps   
          channel [2]          
   radio transmitter.busy   
          
instat [4]          
   ����   
               ����          
    ����   
       
   ����   
       
    ����   
       
    ����   
       
ԲI�%��}����   
       
ԲI�%��}����   
       
    ����   
                                        nd_statistic_wire           �         �  �   �  T          
   txstat_11mbps   
          channel [3]          
   radio transmitter.busy   
          
instat [4]          
   ����   
               ����          
    ����   
       
   ����   
       
    ����   
       
    ����   
       
ԲI�%��}����   
       
ԲI�%��}����   
       
    ����   
                                        nd_statistic_wire            �         J  �   �  \          
   rxstat_5mbps   
          channel [2]          
   !radio receiver.received power (W)   
          
instat [2]          
   ����   
               ����          
    ����   
       
    ����   
       
    ����   
       
    ����   
       
        ����   
       
=4��W1������   
       
    ����   
                                        nd_statistic_wire         !  �         J  }   �  Y          
   rxstat_11mbps   
          channel [3]          
   !radio receiver.received power (W)   
          
instat [3]          
   ����   
               ����          
    ����   
       
    ����   
       
    ����   
       
    ����   
       
        ����   
       
=4��W1������   
       
    ����   
                                        nd_statistic_wire     �   "  ?   +ip.Broadcast Traffic Received (packets/sec)   (Broadcast Traffic Received (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'ip.Broadcast Traffic Sent (packets/sec)   $Broadcast Traffic Sent (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +ip.Multicast Traffic Received (packets/sec)   (Multicast Traffic Received (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'ip.Multicast Traffic Sent (packets/sec)   $Multicast Traffic Sent (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    ip.Traffic Dropped (packets/sec)   Traffic Dropped (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !ip.Traffic Received (packets/sec)   Traffic Received (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           IP   bucket/default total/sum_time   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Congestion Window Size (bytes)   Congestion Window Size (bytes)           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Delay (sec)   Delay (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes)   Load (bytes)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets)   Load (packets)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets/sec)   Load (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Received Segment Ack Number   Received Segment Ack Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $tcp.Received Segment Sequence Number    Received Segment Sequence Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &tcp.Remote Receive Window Size (bytes)   "Remote Receive Window Size (bytes)           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $tcp.Retransmission Timeout (seconds)    Retransmission Timeout (seconds)           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !tcp.Segment Round Trip Time (sec)   Segment Round Trip Time (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %tcp.Segment Round Trip Time Deviation   !Segment Round Trip Time Deviation           TCP Connection    bucket/default total/sample mean   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Sent Segment Ack Number   Sent Segment Ack Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Sent Segment Sequence Number   Sent Segment Sequence Number           TCP Connection   sample/default total   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP Connection   bucket/default total/sum   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Connection Aborts   Connection Aborts           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Delay (sec)   Delay (sec)           TCP    bucket/default total/sample mean   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes)   Load (bytes)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets)   Load (packets)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Load (packets/sec)   Load (packets/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP   bucket/default total/sum_time   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Processing Delay (sec)   Processing Delay (sec)           IP    bucket/default total/sample mean   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "ip.Ping Replies Received (packets)   Ping Replies Received (packets)           IP   bucket/default total/count   square-wave   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Ping Requests Sent (packets)   Ping Requests Sent (packets)           IP   bucket/default total/count   square-wave   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Ping Response Time (sec)   Ping Response Time (sec)           IP    bucket/default total/sample mean   discrete   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %ip.Background Traffic Delay --> (sec)   "Background Traffic Delay --> (sec)           IP   normal   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %ip.Background Traffic Delay <-- (sec)   "Background Traffic Delay <-- (sec)           IP   normal   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    wireless_lan_mac.Load (bits/sec)   Load (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &wireless_lan_mac.Throughput (bits/sec)   Throughput (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )wireless_lan_mac.Media Access Delay (sec)   Media Access Delay (sec)           Wireless Lan    bucket/default total/sample mean   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rsvp.Number of Path States   Number of Path States           RSVP   bucket/default total/sum_time   sample_hold   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rsvp.Number of Resv States   Number of Resv States           RSVP   bucket/default total/sum_time   sample_hold   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rsvp.Number of Blockade States   Number of Blockade States           RSVP   bucket/default total/sum_time   sample_hold   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "rsvp.Number of Successful Requests   Number of Successful Requests           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    rsvp.Number of Rejected Requests   Number of Rejected Requests           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )rsvp.Path Messages Received (packets/sec)   $Path Messages Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %rsvp.Path Messages Sent (packets/sec)    Path Messages Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )rsvp.Resv Messages Received (packets/sec)   $Resv Messages Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %rsvp.Resv Messages Sent (packets/sec)    Resv Messages Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .rsvp.Resv Conf Messages Received (packets/sec)   )Resv Conf Messages Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *rsvp.Resv Conf Messages Sent (packets/sec)   %Resv Conf Messages Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .rsvp.Total RSVP Traffic Received (packets/sec)   )Total RSVP Traffic Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *rsvp.Total RSVP Traffic Sent (packets/sec)   %Total RSVP Traffic Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Response Time (sec)   Response Time (sec)           Client DB Entry    bucket/default total/sample mean   discrete   Client DB EntryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Client DB Entry   bucket/default total/sum_time   linear   Client DB EntryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Client DB Entry   bucket/default total/sum_time   linear   Client DB EntryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Client DB Entry   bucket/default total/sum_time   linear   Client DB EntryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Client DB Entry   bucket/default total/sum_time   linear   Client DB EntryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Response Time (sec)   Response Time (sec)           Client DB Query    bucket/default total/sample mean   discrete   Client DB QueryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Client DB Query   bucket/default total/sum_time   linear   Client DB QueryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Client DB Query   bucket/default total/sum_time   linear   Client DB QueryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Client DB Query   bucket/default total/sum_time   linear   Client DB QueryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Client DB Query   bucket/default total/sum_time   linear   Client DB QueryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           	Client DB   bucket/default total/sum_time   linear   	Client DBԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           	Client DB   bucket/default total/sum_time   linear   	Client DBԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           	Client DB   bucket/default total/sum_time   linear   	Client DBԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           	Client DB   bucket/default total/sum_time   linear   	Client DBԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Download Response Time (sec)   Download Response Time (sec)           Client Email    bucket/default total/sample mean   discrete   Client EmailԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Client Email   bucket/default total/sum_time   linear   Client EmailԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Client Email   bucket/default total/sum_time   linear   Client EmailԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Client Email   bucket/default total/sum_time   linear   Client EmailԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Client Email   bucket/default total/sum_time   linear   Client EmailԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Download File Size (bytes)   Download File Size (bytes)           
Client Ftp    bucket/default total/sample mean   linear   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Download Response Time (sec)   Download Response Time (sec)           
Client Ftp    bucket/default total/sample mean   discrete   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           
Client Ftp   bucket/default total/sum_time   linear   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           
Client Ftp   bucket/default total/sum_time   linear   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           
Client Ftp   bucket/default total/sum_time   linear   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Upload File Size (bytes)   Upload File Size (bytes)           
Client Ftp    bucket/default total/sample mean   linear   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           
Client Ftp   bucket/default total/sum_time   linear   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Upload Response Time (sec)   Upload Response Time (sec)           
Client Ftp    bucket/default total/sample mean   discrete   
Client FtpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Object Response Time (seconds)   Object Response Time (seconds)           Client Http    bucket/default total/sample mean   discrete   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Page Response Time (seconds)   Page Response Time (seconds)           Client Http    bucket/default total/sample mean   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Client Http   bucket/default total/sum_time   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Client Http   bucket/default total/sum_time   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Client Http   bucket/default total/sum_time   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Client Http   bucket/default total/sum_time   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.File Size (bytes)   File Size (bytes)           Client Print    bucket/default total/sample mean   linear   Client PrintԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Client Print   bucket/default total/sum_time   linear   Client PrintԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Client Print   bucket/default total/sum_time   linear   Client PrintԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Response Time (sec)   Response Time (sec)           Client Remote Login    bucket/default total/sample mean   discrete   Client Remote LoginԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Client Remote Login   bucket/default total/sum_time   linear   Client Remote LoginԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Client Remote Login   bucket/default total/sum_time   linear   Client Remote LoginԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Client Remote Login   bucket/default total/sum_time   linear   Client Remote LoginԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Client Remote Login   bucket/default total/sum_time   linear   Client Remote LoginԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Packet End-to-End Delay (sec)   Packet End-to-End Delay (sec)           Video Calling Party    bucket/default total/sample mean   discrete   Video Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Video Calling Party   bucket/default total/sum_time   linear   Video Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Video Calling Party   bucket/default total/sum_time   linear   Video Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Video Calling Party   bucket/default total/sum_time   linear   Video Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Video Calling Party   bucket/default total/sum_time   linear   Video Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Packet End-to-End Delay (sec)   Packet End-to-End Delay (sec)           Video Conferencing    bucket/default total/sample mean   discrete   Video ConferencingԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Video Conferencing   bucket/default total/sum_time   linear   Video ConferencingԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Video Conferencing   bucket/default total/sum_time   linear   Video ConferencingԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Video Conferencing   bucket/default total/sum_time   linear   Video ConferencingԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Video Conferencing   bucket/default total/sum_time   linear   Video ConferencingԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Packet End-to-End Delay (sec)   Packet End-to-End Delay (sec)           Voice Application    bucket/default total/sample mean   discrete   Voice ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Voice Application   bucket/default total/sum_time   linear   Voice ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Voice Application   bucket/default total/sum_time   linear   Voice ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Voice Application   bucket/default total/sum_time   linear   Voice ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Voice Application   bucket/default total/sum_time   linear   Voice ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Packet End-to-End Delay (sec)   Packet End-to-End Delay (sec)           Voice Calling Party    bucket/default total/sample mean   discrete   Voice Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Voice Calling Party   bucket/default total/sum_time   linear   Voice Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Voice Calling Party   bucket/default total/sum_time   linear   Voice Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Voice Calling Party   bucket/default total/sum_time   linear   Voice Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Voice Calling Party   bucket/default total/sum_time   linear   Voice Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Transaction Size (bytes)   Transaction Size (bytes)           Client DB Entry    bucket/default total/sample mean   linear   Client DB EntryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Transaction Size (bytes)   Transaction Size (bytes)           Client DB Query    bucket/default total/sample mean   linear   Client DB QueryԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -application.Request Generation Time (seconds)   !Request Generation Time (seconds)           $Requesting Client Custom Application    bucket/default total/sample mean   discrete   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    application.Request Size (bytes)   Request Size (bytes)           $Requesting Client Custom Application    bucket/default total/sample mean   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !application.Response Size (bytes)   Response Size (bytes)           $Requesting Client Custom Application    bucket/default total/sample mean   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3application.Total Request Generation Time (seconds)   'Total Request Generation Time (seconds)           $Requesting Client Custom Application    bucket/default total/sample mean   discrete   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Total Request Size (bytes)   Total Request Size (bytes)           $Requesting Client Custom Application    bucket/default total/sample mean   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'application.Total Response Size (bytes)   Total Response Size (bytes)           $Requesting Client Custom Application    bucket/default total/sample mean   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           $Requesting Client Custom Application   bucket/default total/sum_time   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           $Requesting Client Custom Application   bucket/default total/sum_time   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           $Requesting Client Custom Application   bucket/default total/sum_time   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           $Requesting Client Custom Application   bucket/default total/sum_time   linear   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Downloaded Objects   Downloaded Objects           Client Http   bucket/default total/count   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Downloaded Pages   Downloaded Pages           Client Http   bucket/default total/count   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.User Cancelled Connections   User Cancelled Connections           Client Http   bucket/default total/count   linear   Client HttpԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +application.Application Response Time (sec)   Application Response Time (sec)           $Requesting Client Custom Application    bucket/default total/sample mean   discrete   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Task Response Time (seconds)   Task Response Time (seconds)           $Requesting Client Custom Application    bucket/default total/sample mean   discrete   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Load (requests/sec)   Load (requests/sec)           $Responding Client Custom Application   bucket/default total/sum_time   linear   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Load (sessions/sec)   Load (sessions/sec)           $Responding Client Custom Application   bucket/default total/sum_time   linear   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Task Processing Time (sec)   Task Processing Time (sec)           $Responding Client Custom Application    bucket/default total/sample mean   discrete   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           $Responding Client Custom Application   bucket/default total/sum_time   linear   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           $Responding Client Custom Application   bucket/default total/sum_time   linear   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           $Responding Client Custom Application   bucket/default total/sum_time   linear   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           $Responding Client Custom Application   bucket/default total/sum_time   linear   Server Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   wireless_lan_mac.Delay (sec)   Delay (sec)           Wireless Lan    bucket/default total/sample mean   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Video Called Party   bucket/default total/sum_time   linear   Video Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Packet End-to-End Delay (sec)   Packet End-to-End Delay (sec)           Video Called Party    bucket/default total/sample mean   discrete   Video Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Video Called Party   bucket/default total/sum_time   linear   Video Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Video Called Party   bucket/default total/sum_time   linear   Video Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Video Called Party   bucket/default total/sum_time   linear   Video Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "application.Packet Delay Variation   Packet Delay Variation           Voice Application   sample/default total   discrete   Voice ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "application.Packet Delay Variation   Packet Delay Variation           Voice Called Party   sample/default total   discrete   Voice Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Packet End-to-End Delay (sec)   Packet End-to-End Delay (sec)           Voice Called Party    bucket/default total/sample mean   discrete   Voice Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Voice Called Party   bucket/default total/sum_time   linear   Voice Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Voice Called Party   bucket/default total/sum_time   linear   Voice Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Voice Called Party   bucket/default total/sum_time   linear   Voice Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Voice Called Party   bucket/default total/sum_time   linear   Voice Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "application.Packet Delay Variation   Packet Delay Variation           Voice Calling Party   sample/default total   discrete   Voice Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &ip.Forwarding Memory Free Size (bytes)   #Forwarding Memory Free Size (bytes)           IP Processor   !bucket/default total/time average   linear   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Forwarding Memory Overflows   Forwarding Memory Overflows           IP Processor   sample/default total   linear   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'ip.Forwarding Memory Queue Size (bytes)   $Forwarding Memory Queue Size (bytes)           IP Processor   !bucket/default total/time average   linear   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0ip.Forwarding Memory Queue Size (incoming bytes)   -Forwarding Memory Queue Size (incoming bytes)           IP Processor   !bucket/default total/time average   linear   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2ip.Forwarding Memory Queue Size (incoming packets)   /Forwarding Memory Queue Size (incoming packets)           IP Processor   !bucket/default total/time average   linear   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )ip.Forwarding Memory Queue Size (packets)   &Forwarding Memory Queue Size (packets)           IP Processor   !bucket/default total/time average   linear   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "ip.Forwarding Memory Queuing Delay   Forwarding Memory Queuing Delay           IP Processor    bucket/default total/sample mean   discrete   IP ProcessorԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    udp.Traffic Received (Bytes/Sec)   Traffic Received (Bytes/Sec)           UDP   bucket/default total/sum_time   linear   UDPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "udp.Traffic Received (Packets/Sec)   Traffic Received (Packets/Sec)           UDP   bucket/default total/sum_time   linear   UDPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   udp.Traffic Sent (Bytes/Sec)   Traffic Sent (Bytes/Sec)           UDP   bucket/default total/sum_time   linear   UDPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   udp.Traffic Sent (Packets/Sec)   Traffic Sent (Packets/Sec)           UDP   bucket/default total/sum_time   linear   UDPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Flight Size (bytes)   Flight Size (bytes)           TCP Connection   sample/default total   square-wave   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "tcp.Selectively ACKed Data (bytes)   Selectively ACKed Data (bytes)           TCP Connection   bucket/default total/max value   square-wave   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Send Delay (CWND) (sec)   Send Delay (CWND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Send Delay (Nagle's) (sec)   Send Delay (Nagle's) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Send Delay (RCV-WND) (sec)   Send Delay (RCV-WND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Group Response Time (seconds)   Group Response Time (seconds)           $Requesting Client Custom Application   normal   discrete   Client Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Utilization (%)   Utilization (%)           CPU   !bucket/default total/time average   linear   resourceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    ip.Queuing Delay Deviation (sec)   Queue Delay Variation (sec)           IP Interface   sample/default total/   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &ip.Background Traffic Flow Delay (sec)   #Background Traffic Flow Delay (sec)           IP    bucket/default total/sample mean   linear   IPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Upload Response Time (sec)   Upload Response Time (sec)           Client Email    bucket/default total/sample mean   discrete   Client EmailԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "application.Packet Delay Variation   Packet Delay Variation           Video Calling Party   sample/default total   discrete   Video Calling PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "application.Packet Delay Variation   Packet Delay Variation           Video Called Party   sample/default total   discrete   Video Called PartyԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "application.Packet Delay Variation   Packet Delay Variation           Video Conferencing   sample/default total   discrete   Video ConferencingԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           ACE   bucket/default total/sum_time   linear   ACEԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           ACE   bucket/default total/sum_time   linear   ACEԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           ACE   bucket/default total/sum_time   linear   ACEԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           ACE   bucket/default total/sum_time   linear   ACEԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Buffer Usage (bytes)   Buffer Usage (bytes)           IP Interface   !bucket/default total/time average   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Buffer Usage (packets)   Buffer Usage (packets)           IP Interface   !bucket/default total/time average   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *ip.CAR Incoming Traffic Dropped (bits/sec)   'CAR Incoming Traffic Dropped (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -ip.CAR Incoming Traffic Dropped (packets/sec)   *CAR Incoming Traffic Dropped (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *ip.CAR Outgoing Traffic Dropped (bits/sec)   'CAR Outgoing Traffic Dropped (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -ip.CAR Outgoing Traffic Dropped (packets/sec)   *CAR Outgoing Traffic Dropped (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Queuing Delay   Queuing Delay           IP Interface    bucket/default total/sample mean   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.RED Average Queue Size   RED Average Queue Size           IP Interface   !bucket/default total/time average   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.RSVP Allocated Bandwidth   RSVP Allocated Bandwidth           IP Interface   normal   sample-hold   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.RSVP Allocated Buffer   RSVP Allocated Buffer           IP Interface   normal   sample-hold   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Traffic Dropped (bits/sec)   Traffic Dropped (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    ip.Traffic Dropped (packets/sec)   Traffic Dropped (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Traffic Received (bits/sec)   Traffic Received (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !ip.Traffic Received (packets/sec)   Traffic Received (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Traffic Sent (bits/sec)   Traffic Sent (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ip.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP InterfaceԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Completion Time   CPU Completion Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Completion Time by Job   CPU Completion Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )CPU.CPU Job Queue Length by CPU Partition   %CPU Job Queue Length by CPU Partition           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Job Queue Length by Job   CPU Job Queue Length by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (CPU.CPU Partition Utilization (%) by Job   $CPU Partition Utilization (%) by Job           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Segment Size by Job   CPU Segment Size by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Service Time by Job   CPU Service Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Total Utilization (%)   CPU Total Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .CPU.CPU Total Utilization (%) by CPU Partition   *CPU Total Utilization (%) by CPU Partition           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $CPU.CPU Total Utilization (%) by Job    CPU Total Utilization (%) by Job           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Utilization (%)   CPU Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Utilization (%) by Job   CPU Utilization (%) by Job           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Wait Time   CPU Wait Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.CPU Wait Time by Job   CPU Wait Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Interface Bus Requests   Disk Interface Bus Requests           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &CPU.Disk Interface Bus Requests by Job   "Disk Interface Bus Requests by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &CPU.Disk Interface Bus Utilization (%)   "Disk Interface Bus Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -CPU.Disk Interface Bus Utilization (%) by Job   )Disk Interface Bus Utilization (%) by Job           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    CPU.Disk Interface Bus Wait Time   Disk Interface Bus Wait Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'CPU.Disk Interface Bus Wait Time by Job   #Disk Interface Bus Wait Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'CPU.Disk Interface Channel Bus Requests   #Disk Interface Channel Bus Requests           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .CPU.Disk Interface Channel Bus Requests by Job   *Disk Interface Channel Bus Requests by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .CPU.Disk Interface Channel Bus Utilization (%)   *Disk Interface Channel Bus Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   5CPU.Disk Interface Channel Bus Utilization (%) by Job   1Disk Interface Channel Bus Utilization (%) by Job           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +CPU.Disk Interface Channel Max Bus Requests   'Disk Interface Channel Max Bus Requests           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2CPU.Disk Interface Channel Max Bus Requests by Job   .Disk Interface Channel Max Bus Requests by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #CPU.Disk Interface Max Bus Requests   Disk Interface Max Bus Requests           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *CPU.Disk Interface Max Bus Requests by Job   &Disk Interface Max Bus Requests by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Max Queue Length   Disk Max Queue Length           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    CPU.Disk Max Queue Length by Job   Disk Max Queue Length by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Operations Per Second   Disk Operations Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %CPU.Disk Operations Per Second by Job   !Disk Operations Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Queue Length   Disk Queue Length           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Queue Length by Job   Disk Queue Length by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Reads Per Second   Disk Reads Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    CPU.Disk Reads Per Second by Job   Disk Reads Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Utilization (%)   Disk Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Utilization (%) by Job   Disk Utilization (%) by Job           Server Jobs   !bucket/default total/time average   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Disk Writes Per Second   Disk Writes Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !CPU.Disk Writes Per Second by Job   Disk Writes Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Jobs Active by Job   Jobs Active by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Jobs Completed by Job   Jobs Completed by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Jobs Created by Job   Jobs Created by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Memory Size by Job   Memory Size by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Paging Hard Faults by Job   Paging Hard Faults by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Paging Soft Faults by Job   Paging Soft Faults by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1CPU.Prioritized Job Queue Length by CPU Partition   -Prioritized Job Queue Length by CPU Partition           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Resident Set Size by Job   Resident Set Size by Job           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %CPU.Storage Partition Completion Time   !Storage Partition Completion Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,CPU.Storage Partition Completion Time by Job   (Storage Partition Completion Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3CPU.Storage Partition Interface Bus Total Wait Time   /Storage Partition Interface Bus Total Wait Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   :CPU.Storage Partition Interface Bus Total Wait Time by Job   6Storage Partition Interface Bus Total Wait Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +CPU.Storage Partition Operations Per Second   'Storage Partition Operations Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2CPU.Storage Partition Operations Per Second by Job   .Storage Partition Operations Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'CPU.Storage Partition Operations by Job   #Storage Partition Operations by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &CPU.Storage Partition Reads Per Second   "Storage Partition Reads Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -CPU.Storage Partition Reads Per Second by Job   )Storage Partition Reads Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "CPU.Storage Partition Reads by Job   Storage Partition Reads by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "CPU.Storage Partition Service Time   Storage Partition Service Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )CPU.Storage Partition Service Time by Job   %Storage Partition Service Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1CPU.Storage Partition Total Operations Per Second   -Storage Partition Total Operations Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,CPU.Storage Partition Total Reads Per Second   (Storage Partition Total Reads Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -CPU.Storage Partition Total Writes Per Second   )Storage Partition Total Writes Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Storage Partition Wait Time   Storage Partition Wait Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &CPU.Storage Partition Wait Time by Job   "Storage Partition Wait Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'CPU.Storage Partition Writes Per Second   #Storage Partition Writes Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .CPU.Storage Partition Writes Per Second by Job   *Storage Partition Writes Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #CPU.Storage Partition Writes by Job   Storage Partition Writes by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Total Completion Time   Total Completion Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    CPU.Total Completion Time by Job   Total Completion Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Total Jobs Completed   Total Jobs Completed           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Total Jobs Created   Total Jobs Created           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Total Memory Size   Total Memory Size           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Total Resident Set Size   Total Resident Set Size           Server Jobs   bucket/default total/max value   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   4application.Active Custom Application Instance Count   (Active Custom Application Instance Count           Custom Application   bucket/default total/max value   discrete   Custom ApplicationԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #CPU.Replication Failures Per Second   Replication Failures Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *CPU.Replication Failures Per Second by Job   &Replication Failures Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %CPU.Replication Operations Per Second   !Replication Operations Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,CPU.Replication Operations Per Second by Job   (Replication Operations Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &CPU.Replications Successful Per Second   "Replications Successful Per Second           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -CPU.Replications Successful Per Second by Job   )Replications Successful Per Second by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Jobs Aborted by Job   Jobs Aborted by Job           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   CPU.Total Jobs Aborted   Total Jobs Aborted           Server Jobs   bucket/default total/sum_time   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #CPU.Storage Partition Response Time   Storage Partition Response Time           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *CPU.Storage Partition Response Time by Job   &Storage Partition Response Time by Job           Server Jobs    bucket/default total/sample mean   linear   Server JobsԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Read Requests Per Second   Read Requests Per Second           Remote Storage Server   bucket/default total/sum_time   linear   Remote Storage ServerԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Requests Processed Per Second   Requests Processed Per Second           Remote Storage Server   bucket/default total/sum_time   linear   Remote Storage ServerԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Requests Received Per Second   Requests Received Per Second           Remote Storage Server   bucket/default total/sum_time   linear   Remote Storage ServerԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %application.Write Requests Per Second   Write Requests Per Second           Remote Storage Server   bucket/default total/sum_time   linear   Remote Storage ServerԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !application.Connection Setup Time   Connection Setup Time           Remote Storage Client    bucket/default total/sample mean   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #application.Disk IO Completion Time   Disk IO Completion Time           Remote Storage Client    bucket/default total/sample mean   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,application.Network delay (client -> server)    Network delay (client -> server)           Remote Storage Client    bucket/default total/sample mean   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,application.Network delay (server -> client)    Network delay (server -> client)           Remote Storage Client    bucket/default total/sample mean   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Response Time   Response Time           Remote Storage Client    bucket/default total/sample mean   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Operations Aborted Per Second   Operations Aborted Per Second           Remote Storage Client   bucket/default total/sum_time   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +application.Operations Completed Per Second   Operations Completed Per Second           Remote Storage Client   bucket/default total/sum_time   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )application.Operations Started Per Second   Operations Started Per Second           Remote Storage Client   bucket/default total/sum_time   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Read Operations Per Second   Read Operations Per Second           Remote Storage Client   bucket/default total/sum_time   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'application.Write Operations Per Second   Write Operations Per Second           Remote Storage Client   bucket/default total/sum_time   linear   Remote Storage ClientԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #application.Response Time (seconds)   Response Time (seconds)           Application Demand   normal   discrete   Application DemandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Application Demand   bucket/default total/sum_time   linear   Application DemandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Application Demand   bucket/default total/sum_time   linear   Application DemandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Application Demand   bucket/default total/sum_time   linear   Application DemandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Application Demand   bucket/default total/sum_time   linear   Application DemandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Active Calls   Active Calls           SIP UAC   normal   square-wave   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Call Duration (sec)   Call Duration (sec)           SIP UAC   normal   discrete   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !application.Call Setup Time (sec)   Call Setup Time (sec)           SIP UAC   normal   discrete   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Calls Connected   Calls Connected           SIP UAC   bucket/60 secs/sum   discrete   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Calls Initiated   Calls Initiated           SIP UAC   bucket/60 secs/sum   discrete   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Calls Rejected   Calls Rejected           SIP UAC   bucket/60 secs/sum   discrete   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   application.Incoming Calls   Incoming Calls           SIP UAC   bucket/60 secs/sum   discrete   SIP UACԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Retransmission Count   Retransmission Count           TCP Connection   bucket/default total/sum   discrete   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP Connection    bucket/default total/sample mean   discrete   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Active Connection Count   Active Connection Count           TCP   !bucket/default total/sum/no reset   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Connection Aborts (RST Rcvd)   Connection Aborts (RST Rcvd)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    tcp.Connection Aborts (RST Sent)   Connection Aborts (RST Sent)           TCP   bucket/default total/sum   linear   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Retransmission Count   Retransmission Count           TCP   bucket/default total/sum   discrete   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP    bucket/default total/sample mean   discrete   TCPԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $application.Task Response Time (sec)   Task Response Time (sec)           ACE   normal   discrete   ACEԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}          machine type       workstation   Model Attributes      9.1.A-Dec27-2002                 interface type       
IEEE802.11      6IP Host Parameters.Interface Information [<n>].Address      
IP Address   :IP Host Parameters.Interface Information [<n>].Subnet Mask      IP Subnet Mask       wlan_port_tx_<n>_0   wlan_port_rx_<n>_0           T�I�%��}   @      @  �   @�  @4                          ��������