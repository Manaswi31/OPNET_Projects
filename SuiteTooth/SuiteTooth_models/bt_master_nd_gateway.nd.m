MIL_3_Tfile_Hdr_ 1800 175B modeler 6 570AAB9C 570AAC49 2 volta chaganti 0 0 none none 0 0 none A1518E75 AD8E 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                 ��g�      <   @   s  K  O  4  (�  >  l"  l*  �   �:  �J       wireless_laptop   wireless_laptop������������       1/***********************************************/   ,// The SuiteTooth model set was developed by   // HIGHLAND SYSTEMS, INC.   //   /// It incorporates code available in the public   0// domain and other code that is the property of   // OPNET Technologies, Inc.   //   !// Inquiries may be addressed to:   //    // Highland Systems, Inc.   // (703) 312 0830   // info@highsys.com   // www.highsys.com   1/***********************************************/              ACL Slot Length      %Bluetooth L2CAP & MAC.ACL Slot Length����    ����           ����          ����          ����                        #Application: ACE Tier Configuration      !client_app.ACE Tier Configuration����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       $Application: Destination Preferences      "client_app.Destination Preferences����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Application: Supported Profiles      client_app.Supported Profiles����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Application: Supported Services      svr_app.Services����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Bluetooth Radio Modulation      rr_0.modulation   rt_0.modulation����   ����       ����      ����      ����                        Bluetooth Transmit Power (W)      rt_0.channel [0].power����   ����               ����              ����              ����                         Coexistence Transceiver Type      !rr_0.Coexistence Transceiver Type   !rt_0.Coexistence Transceiver Type����    ����           ����          ����          ����                        IP Gateway Function      
ip.gateway����   ����           ����          ����          ����                        IP Host Parameters      ip.ip host parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       IP Routing Parameters      ip.ip router parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                        Initial ACL Data Rate      +Bluetooth L2CAP & MAC.Initial ACL Data Rate����    ����           ����          ����          ����                        Master->Slave ACL Traffic      0stochastic source/sink.Master->Slave ACL Traffic����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Master->Slave Control Traffic      -LMP source/sink.Master->Slave Control Traffic����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       Master->Slave SCO Traffic      0stochastic source/sink.Master->Slave SCO Traffic����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                        Piconet Address      %Bluetooth L2CAP & MAC.Piconet Address   "rr_0.Coexistence Bluetooth Piconet   "rt_0.Coexistence Bluetooth Piconet����    ����           ����          ����          ����                        Piconet Timing Offset      #Bluetooth L2CAP & MAC.Timing Offset����   ����               ����              ����              ����                         Polling Interval      &Bluetooth L2CAP & MAC.Polling Interval����    ����           ����          ����          ����                         SCO Packet Type      %Bluetooth L2CAP & MAC.SCO Packet Type����    ����           ����          ����          ����                        Server Address      tpal.Address����   ����       ����      ����      ����                         Slave ACL Slot Length      +Bluetooth L2CAP & MAC.Slave ACL Slot Length����    ����           ����          ����          ����                        Voice Start Time      'stochastic source/sink.Voice Start Time����   ����               ����              ����              ����                     -   ACL Slot Length                1 slot      #Application: ACE Tier Configuration                     count    ���   
   ����   
      list   	���   
          
      Bluetooth Radio Modulation         
   Bluehoc   
   Bluetooth Transmit Power (W)         
?PbM�������   
   CPU.Compatibility Mode                 
Simple CPU      CPU.Resource Parameters         
            count    ���   
   ����   
      list   	���   
            Task Contention Mode    ���   
       Contention Already Modeled   
      Multi-tasking Performance Table   ���   
      
No Entries   
   
   
   CPU.background utilization                     count    ���   
   ����   
      list   	���   
          
      Coexistence Transceiver Type             ����      IP Gateway Function         
       Disabled   
   IP Host Parameters                     count    ���   
   ����   
      list   	���   
            Interface Information   ���   
            count    ���   
   ����   
      list   	���   
            MTU    ���   
  �   Ethernet   
      QoS Information   ���   
      None   
   
   
      Static Routing Table   ���   
      None   
   
      IP Routing Parameters                     count    ���   
   ����   
      list   	���   
            Interface Information   ���   
            count    ���   
   ����   
      list   	���   
            QoS Information   ���   
      None   
   
   
      Loopback Interfaces   ���   
            count    ���   
   ����   
      list   	���   
            Name   ���   
   Loopback   
   
   
      Static Routing Table   ���   
      None   
   
      Initial ACL Data Rate                 High Data Rate (no FEC)      Master->Slave ACL Traffic         
      No Data   
   Master->Slave Control Traffic         
      
No Control   
   Master->Slave SCO Traffic         
      No Voice   
   Piconet Address          
    ����   
   Piconet Timing Offset                    Random      Polling Interval             (����      SCO Packet Type                HV3      Slave ACL Slot Length                1 slot      
TIM source            none      Voice Start Time         ?�      ����      altitude         
?�      ����   
   altitude modeling            relative to subnet-platform      &client_app.RSVP Application Parameters                     count    ���   
   ����   
      list   	���   
          
      client_app.Services                     count    ���   
       0   
      list   	���   
       
      	condition            ����      financial cost            0.00      ip.ip multicast information                     count    ���   
   ����   
      list   	���   
          
      ip.ip processing information         
            count    ���   
   ����   
      list   	���   
            Datagram Forwarding Rate   ���   
A.��    ����   
   
   
   $ip.ip_igmp_host.IGMP Host Attributes                     count    ���   
   ����   
      list   	���   
          
      *ip.ip_igmp_rte_intf.IGMP Router Attributes                     count    ���   
   ����   
      list   	���   
          
      ip.mpls_mgr.MPLS Parameters                     count    ���   
   ����   
      list   	���   
          
      phase                 ����      priority              ����      role         ����      rsvp.RSVP Protocol Parameters                     count    ���   
   ����   
      list   	���   
          
      svr_app.ACE Tier Configuration                     count    ���   
   ����   
      list   	���   
          
      svr_app.Destination Preferences                     count    ���   
    ����   
      list   	���   
       
      svr_app.LAN Supported Profiles                     count    ���   
   ����   
      list   	���   
          
      "svr_app.Multicasting Specification                     count    ���   
      1   
      list   	���   
          
      #svr_app.RSVP Application Parameters                     count    ���   
   ����   
      list   	���   
          
      svr_app.Source Preferences                     count    ���   
    ����   
      list   	���   
       
      svr_app.Supported Profiles                     count    ���   
   ����   
      list   	���   
          
      user id              ����                �  
          
   Bluetooth L2CAP & MAC   
       
   	bt_master   
       
   	processor   
                begsim intrpt   ���   
   ����   
      subqueue   ���   
            count    ���   
   ����   
      list   	���   
                bit capacity   ���   
T�I�%��}����   
      pk capacity   ���   
T�I�%��}����   
         bit capacity   ���   
T�I�%��}����   
      pk capacity   ���   
T�I�%��}����   
         bit capacity   ���   
T�I�%��}����   
      pk capacity   ���   
T�I�%��}����   
         bit capacity   ���   
T�I�%��}����   
      pk capacity   ���   
T�I�%��}����   
         bit capacity   ���   
T�I�%��}����   
      pk capacity   ���   
T�I�%��}����   
         bit capacity   ���   
T�I�%��}����   
      pk capacity   ���   
T�I�%��}����   
   
   
          >   �          
   stochastic source/sink   
       
   bt_mst_sto_src_sink   
          	processor                      �  �          
   LMP source/sink   
       
   bt_mst_lmp_src_sink   
          	processor                	      �  f             rr_0          
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A.��    ����   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
      processing gain   ���   	ԲI�%��}����   	   
   
       	   Bluehoc   	       ?�      ����                  ����          
   
dra_ragain   
       
   coexist_bt_power   
       
   coexist_bkgnoise   
       
   coexist_bt_inoise   
          dra_snr             dra_ber          
   coexist_bt_error   
       
   coexist_bt_ecc   
          ra_rx                       nd_radio_receiver         Coexistence Bluetooth Piconet    ���      ����   ����    ����          ����          ����          ����                 Coexistence Transceiver Type    ���      ����   ����    ����          ����          ����          ����                   R  f             rt_0          
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A.��    ����   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
      power   ���   	@Y      ����   	   
   
       	   Bluehoc   	          dra_rxgroup          
   	dra_txdel   
       
   dra_closure_all   
       
   coexist_chanmatch   
          
dra_tagain             dra_propdel             ra_tx                       nd_radio_transmitter         Coexistence Bluetooth Piconet    ���   	   ����   	����    ����          ����          ����          ����                 Coexistence Transceiver Type    ���   	   ����   	����    ����          ����          ����          ����                     �  $          
   udp   
       
   
rip_udp_v3   
       
   	processor   
                    �  R          
   ip_encap   
       
   ip_encap_v4   
       
   	processor   
                 	   �  �          
   btarp   
       
   bt_master_arp   
       
   	processor   
                 
   �  $          
   tcp   
       
   tcp_manager_v3   
       
   	processor   
                    �   �          
   tpal   
       
   tpal_v3   
       
   	processor   
                    �   �          
   
client_app   
       
   gna_http_mgr   
       
   	processor   
                   R  $          
   rsvp   
       
   rsvp   
       
   	processor   
                    �  �          
   ip   
       
   ip_dispatch   
          	processor                      �   �          
   CPU   
       
   
server_mgr   
          	processor                   Compatibility Mode    ���   	       
Simple CPU   	      Resource Parameters   ���   	      Single Processor   	      background utilization   ���   	      None   	         R   �          
   svr_app   
       
   gna_http_mgr   
       
   	processor   
                   �  R          
   
ip_encap_0   
       
   ip_encap_v4   
          	processor                      �  �          
   arp   
       
   	ip_arp_v4   
          	processor                      �  $          
   tcp_0   
       
   tcp_manager_v3_test   
          	processor                      �   �          
   client   
       
   wban_tcp_client_trail   
          	processor                     �  �          
   mac   
       
   ethernet_mac_v2   
          queue                   pkt_capture_mode   ���   	      Not Used   	        �  
          
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
               ����             pt_rx                       nd_ptp_receiver             
          
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
          pt_tx                       nd_ptp_transmitter            �  �          
   ip_0   
       
   ip_dispatch   
          	processor                +                     A   �   A  �   �     
          strm_4          
   0   
       
   0   
          ����                  ����          
@  �����   
                                        nd_packet_stream                       �     w  �   
          strm_11          
   src stream [3]   
       
   0   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream                       �  _   �     �     
          strm_12             0             1             ����                  ����          
@�  ����   
                                        nd_packet_stream                       �    P    P  `   
          strm_13          
   1   
          0             ����                  ����             ����                                           nd_packet_stream                      �  T   �  T   �  0   
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
                                        nd_packet_stream                      �  0   �  O   �  O   
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
@  �����   
                                        nd_packet_stream                       Z    Z    y    y   
       
   strm_8   
       
   src stream [0]   
       
   0   
       
   ����   
       
        ����   
       
@  �����   
                                        nd_packet_stream          	            �  |   �  |   �  [   �  [   
       
   strm_9   
       
   0   
       
   dest stream [0]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream          
      	       �    �    �    �          
   port_0   
       
   1   
       
   0   
       
   ����   
       
        ����   
       
@  �����   
                                        nd_packet_stream         ip addr index    ���   
    ����   
����    ����           ����          ����          ����                              �   �   �   �   �   �   
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
@  �����   
                                        nd_packet_stream                      �   �   �   �   �   �   
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
                                        nd_packet_stream                
        �     �           
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
@  �����   
                                        nd_packet_stream             
         �      �      �   �   �   �   
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
                                        nd_packet_stream             
          +    +    J    J   
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
@  �����   
                                        nd_packet_stream                
      �  K   �  K   �  )   �  )   
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
@  �����   
                                        nd_packet_stream                      �   �   �   �   �     
          	strm_4107          
   src stream [3]   
       
   dest stream [2]   
       
   ����   
               ����          
@  �����   
                                        nd_packet_stream                      �     �   �   �   �   
          	strm_4108          
   src stream [2]   
       
   dest stream [3]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream             	         �  �   �  �   �  �   �  �          
   	in_port_0   
       
   0   
       
   1   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream         ip addr index    ���   
    ����   
����    ����           ����          ����          ����                               V  U  V  U  0   
       
   ip_encap_to_rsvp   
       
   src stream [6]   
       
   0   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream                     Q  0  Q  O    O   
       
   rsvp_to_ip_encap   
       
   0   
       
   dest stream [6]   
       
   ����   
       
        ����   
       
@  �����   
                                        nd_packet_stream                     G   �   �   �   �   �   
       
   strm_191   
       
   0   
       
   dest stream [4]   
       
   ����   
       
        ����   
       
@  �����   
                                        nd_packet_stream                      �   �  Q   �  Q   �   
       
   strm_201   
       
   src stream [4]   
       
   0   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream             	          �  �    �    �   �     
          	strm_4115          
   1   
       
   2   
          ����                  ����             ����                                           nd_packet_stream                 	      �     �  �   �  �   �  �   
          	strm_4116          
   2   
       
   1   
          ����                  ����          
@�  ����   
                                        nd_packet_stream                       �     >  �   8  �   8   �   
          	strm_4117          
   src stream [0]   
          0             ����                  ����          
@�  ����   
                                        nd_packet_stream                      v  �   �  
   
          	strm_4118             0             3             ����                  ����             ����                                           nd_packet_stream                     �  �  �  �   
       
   	strm_1101   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����          
@�  ����   
                                        nd_packet_stream                      �  �    �   
       
   	strm_4101   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����          
@ ������   
                                        nd_packet_stream          !           �  +    +    K  �  K   
       
   	strm_4106   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����          
@ ������   
                                        nd_packet_stream          "           �  K  �  K  �  *  �  *   
       
   	strm_4109   
       
   src stream [1]   
       
   dest stream [0]   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          #           �  �    �    �  �  �   
       
   	strm_4110   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����          
@ ������   
                                        nd_packet_stream          $           �  �  �  �  �  �  �  �   
       
   	strm_4112   
       
   src stream [1]   
       
   dest stream [1]   
          ����                  ����          
@�  ����   
                                        nd_packet_stream         %             �  �  �          
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
                                        nd_statistic_wire         &           �  �  �  �          
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
                                        nd_statistic_wire         '           �                
   assoc_0   
       
@�� ����   
                                        nd_association          (           �  "  �  "  �   �  �   �   
       
   	strm_4113   
       
   1   
       
   0   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          )           �   �     �    "  �  "   
       
   	strm_4114   
       
   0   
       
   1   
          ����                  ����          
@ ������   
                                        nd_packet_stream          *           �  �    �    �  �  �          
   port_1   
       
   0   
       
   0   
          ����                  ����          
@ ������   
                                        nd_packet_stream         ip addr index           
    ����   
����    ����           ����          ����          ����                  +           �  |  �  |  �  P  �  Q   
       
   strm_10   
       
   1   
       
   0   
          ����                  ����          
@�  ����   
                                        nd_packet_stream          ,           �  �  �  �  �  �  �  �          
   	in_port_1   
       
   1   
       
   0   
          ����                  ����          
@�  ����   
                                        nd_packet_stream         ip addr index           
    ����   
����    ����           ����          ����          ����                  -           �  P    P    |  �  {   
       
   strm_14   
       
   0   
       
   1   
          ����                  ����          
@ ������   
                                        nd_packet_stream          .            B   �   E   �  �   �  �   �   
       
   STRM_FROM_APPL_TO_IP   
       
   src stream [1]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream          /           �   �  �   �   2   �   7   �   8   �   
       
   STRM_FROM_IP_TO_APPL   
       
   src stream [1]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream         0   N   rr_0.channel [0].bit error rate   bit error rate           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &rr_0.channel [0].bit errors per packet   bit errors per packet           radio receiver   bucket/default total/sum_time   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rr_0.channel [0].busy   busy           radio receiver   
all values   square-wave   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !rr_0.channel [0].collision status   collision status           radio receiver   
all values   square-wave   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "rr_0.channel [0].packet loss ratio   packet loss ratio           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #rr_0.channel [0].received power (W)   received power           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (rr_0.channel [0].signal/noise ratio (dB)   signal/noise ratio           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &rr_0.channel [0].throughput (bits/sec)   throughput (bits/sec)           radio receiver   bucket/default total/sum_time   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )rr_0.channel [0].throughput (packets/sec)   throughput (packets/sec)           radio receiver   bucket/default total/sum_time   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rr_0.channel [0].utilization   utilization           radio receiver   !bucket/default total/time average   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rt_0.channel [0].busy   busy           radio transmitter   
all values   square-wave   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   "rt_0.channel [0].queue size (bits)   queue size (bits)           radio transmitter   !bucket/default total/time average   linear   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %rt_0.channel [0].queue size (packets)   queue size (packets)           radio transmitter   !bucket/default total/time average   linear   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   $rt_0.channel [0].queuing delay (sec)   queuing delay           radio transmitter    bucket/default total/sample mean   linear   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &rt_0.channel [0].throughput (bits/sec)   throughput (bits/sec)           radio transmitter   bucket/default total/sum_time   linear   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )rt_0.channel [0].throughput (packets/sec)   throughput (packets/sec)           radio transmitter   bucket/default total/sum_time   linear   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   rt_0.channel [0].utilization   utilization           radio transmitter   !bucket/default total/time average   linear   radio transmitterԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   Bluetooth L2CAP & MAC.Hop Value   	Hop Value           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *Bluetooth L2CAP & MAC.ACL Packets Received   ACL Packets Received           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &Bluetooth L2CAP & MAC.ACL Packets Sent   ACL Packets Sent           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   /Bluetooth L2CAP & MAC.FEC Throughput (bits/sec)   FEC Throughput (bits/sec)           baseband   bucket/0.1 secs/sum_time   linear   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'Bluetooth L2CAP & MAC.Null Packets Sent   Null Packets Sent           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   !Bluetooth L2CAP & MAC.Packet Loss   Packet Loss           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,Bluetooth L2CAP & MAC.Packets received (pkt)   Packets received (pkt)           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (Bluetooth L2CAP & MAC.Packets sent (pkt)   Packets sent (pkt)           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'Bluetooth L2CAP & MAC.Poll packets sent   Poll packets sent           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %Bluetooth L2CAP & MAC.Retransmissions   Retransmissions           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *Bluetooth L2CAP & MAC.SCO Packets Received   SCO Packets Received           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &Bluetooth L2CAP & MAC.SCO Packets Sent   SCO Packets Sent           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +Bluetooth L2CAP & MAC.Skipped Transmissions   Skipped Transmissions           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +Bluetooth L2CAP & MAC.Throughput (bits/sec)   Throughput (bits/sec)           baseband   bucket/0.1 secs/sum_time   linear   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )Bluetooth L2CAP & MAC.Dropped SCO Packets   Dropped SCO Packets           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +Bluetooth L2CAP & MAC.Null Packets Received   Null Packets Received           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #Bluetooth L2CAP & MAC.MAC SDU Delay   MAC SDU Delay           baseband   normal   linear   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *LMP source/sink.End-to-End Delay (seconds)   End-to-End Delay (seconds)           Control    bucket/default total/sample mean����   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (LMP source/sink.Packet Generation Status   Packet Generation Status           Control   normal   linear   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   #LMP source/sink.Traffic Sent (bits)   Traffic Sent (bits)           Control   normal   linear   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *LMP source/sink.Traffic Received (packets)   Traffic Received (packets)           Control   normal����   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'LMP source/sink.Traffic Sent (bits/sec)   Traffic Sent (bits/sec)           Control   bucket/0.1 secs/sum_time   linear   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &LMP source/sink.Traffic Sent (packets)   Traffic Sent (packets)           Control   normal   linear   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +LMP source/sink.Traffic Received (bits/sec)   Traffic Received (bits/sec)           Control   bucket/0.1 secs/sum_time����   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *LMP source/sink.Traffic by Slave (packets)   Traffic by Slave (packets)           Control   normal   discrete   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .LMP source/sink.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Control   bucket/0.1 secs/sum_time����   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   'LMP source/sink.Traffic Received (bits)   Traffic Received (bits)           Control   normal����   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *LMP source/sink.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Control   bucket/0.1 secs/sum_time   linear   ControlԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .Bluetooth L2CAP & MAC.Control Packets Received   Control Packets Received           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *Bluetooth L2CAP & MAC.Control Packets Sent   Control Packets Sent           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .Bluetooth L2CAP & MAC.Control Packets to Slave   Control Packets to Slave           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0Bluetooth L2CAP & MAC.Control Packets from Slave   Control Packets from Slave           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   6stochastic source/sink.Data End-to-End Delay (seconds)   Data End-to-End Delay (seconds)           
Stochastic    bucket/default total/sample mean����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   7stochastic source/sink.Data Traffic Received (bits/sec)    Data Traffic Received (bits/sec)           
Stochastic   bucket/0.1 secs/sum_time����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3stochastic source/sink.Data Traffic Sent (bits/sec)   Data Traffic Sent (bits/sec)           
Stochastic   bucket/0.1 secs/sum_time����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2stochastic source/sink.Data Traffic Sent (packets)   Data Traffic Sent (packets)           
Stochastic   normal   discrete   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1stochastic source/sink.End-to-End Delay (seconds)   End-to-End Delay (seconds)           
Stochastic    bucket/default total/sample mean����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   /stochastic source/sink.Packet Generation Status   Packet Generation Status           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .stochastic source/sink.Traffic Received (bits)   Traffic Received (bits)           
Stochastic   normal����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   6stochastic source/sink.Data Traffic Received (packets)   Data Traffic Received (packets)           
Stochastic   normal����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1stochastic source/sink.Traffic Received (packets)   Traffic Received (packets)           
Stochastic   normal����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2stochastic source/sink.Traffic Received (bits/sec)   Traffic Received (bits/sec)           
Stochastic   bucket/0.1 secs/sum_time����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *stochastic source/sink.Traffic Sent (bits)   Traffic Sent (bits)           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .stochastic source/sink.Traffic Sent (bits/sec)   Traffic Sent (bits/sec)           
Stochastic   bucket/0.1 secs/sum_time   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -stochastic source/sink.Traffic Sent (packets)   Traffic Sent (packets)           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1stochastic source/sink.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           
Stochastic   bucket/0.1 secs/sum_time   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1stochastic source/sink.Traffic by Slave (packets)   Traffic by Slave (packets)           
Stochastic   normal   discrete   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   7stochastic source/sink.Voice End-to-End Delay (seconds)    Voice End-to-End Delay (seconds)           
Stochastic    bucket/default total/sample mean����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   8stochastic source/sink.Voice Traffic Received (bits/sec)   !Voice Traffic Received (bits/sec)           
Stochastic   bucket/0.1 secs/sum_time����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   7stochastic source/sink.Voice Traffic Received (packets)    Voice Traffic Received (packets)           
Stochastic   normal����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   5stochastic source/sink.Traffic Received (packets/sec)   Traffic Received (packets/sec)           
Stochastic   bucket/0.1 secs/sum_time����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3stochastic source/sink.Voice Traffic Sent (packets)   Voice Traffic Sent (packets)           
Stochastic   normal   discrete   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   4stochastic source/sink.Voice Traffic Sent (bits/sec)   Voice Traffic Sent (bits/sec)           
Stochastic   bucket/0.1 secs/sum_time����   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1Bluetooth L2CAP & MAC.Residual SCO Payload Errors   Residual SCO Payload Errors           baseband   normal   discrete   basebandԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   tcp.Flight Size (bytes)   Flight Size (bytes)           TCP Connection   sample/default total   square-wave   TCP ConnectionԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   5stochastic source/sink.Traffic Received - Temperature   Traffic Received - Temperature           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   .stochastic source/sink.Traffic Received - SPO2   Traffic Received - SPO2           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   4stochastic source/sink.Traffic Received - Risk Group   Traffic Received - Risk Group           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   4stochastic source/sink.Traffic Received - Heart Rate   Traffic Received - Heart Rate           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   5stochastic source/sink.Traffic Received - Blood Sugar   Traffic Received - Blood Sugar           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   8stochastic source/sink.Traffic Received - Blood Pressure   !Traffic Received - Blood Pressure           
Stochastic   normal   linear   
StochasticԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}                       line_0          
@   ����   
           ����              ����              ����              ����                       
annot_line             Annotation Palette          ��������          ����              ����   ?�         @{�     @g@     @{�     @l      @{�     @l          ����                    line_2          
@�������   
           ����              ����              ����              ����                       
annot_line             Annotation Palette          ��������          ����              ����   ?�         @{�     @{p     @{�     @s�     @{�     @s�         ����                    line_1          
@��@����   
           ����              ����              ����              ����                       
annot_line             Annotation Palette          ��������          ����              ����   ?�         @{�     @m`     @{�     @r�         ����                    line_3          
@  �����   
           ����              ����              ����              ����                       
annot_line             Annotation Palette          ��������          ����              ����   ?�         @{�     @|0     @{�     @��         ����                    text_0                Application Layer             ����          
   ����   
           ����          
@��     ����   
       
@j0     ����   
       
@j@     ����   
       
@9      ����   
          
annot_text             Annotation Palette          ��������          ����          
@�������   
               ����              ����           ����                    text_1          
      Transport Layer   
       
@�� ����   
       
   ����   
           ����          
@��     ����   
       
@q     ����   
       
@j@     ����   
       
@9      ����   
          
annot_text             Annotation Palette          ��������          ����          
@�������   
               ����              ����           ����                    text_2          
      Network Layer   
       
@�� ����   
       
   ����   
           ����          
@��     ����   
       
@w�     ����   
       
@j@     ����   
       
@9      ����   
          
annot_text             Annotation Palette          ��������          ����          
@�������   
               ����              ����           ����                    text_3          
      	Bluetooth   
       
@  �����   
       
   ����   
           ����          
@��     ����   
       
@�     ����   
       
@j@     ����   
       
@9      ����   
          
annot_text             Annotation Palette          ��������          ����          
@�������   
               ����              ����           ����                T�I�%��}   @      @  �   @�  @4                          ��������