MIL_3_Tfile_Hdr_ 1800 175B modeler 6 3C237540 552C0B48 46 rhel03 chaganti 0 0 none none 0 0 none 6B778545 572E 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                               ��g�      <   P   �      �  �  $�  >m  >u  T)  T-  T�      node   WLAN   terminal   terminal��������   Wireless LAN station    G   1/***********************************************/   ,// The SuiteTooth model set was developed by   // HIGHLAND SYSTEMS, INC.   //   /// It incorporates code available in the public   0// domain and other code that is the property of   // OPNET Technologies, Inc.   //   !// Inquiries may be addressed to:   //    // Highland Systems, Inc.   // (703) 312 0830   // info@highsys.com   // www.highsys.com   1/***********************************************/           General Node Functions:    -----------------------        The wireless station node model    /represents an IEEE802.11 wireless LAN station.    %The node model consists of following    
processes:       *1. The MAC layer which has a wireless lan    !mac process model with following    attributes:       MAC address -- station address       *Fragmentation Threshold --- based on this    (threshold station decides wether or not    "to send data packets in fragments.       *Rts threshold --- based on this threshold    (station decides wether Rts/Cts exchange    *is needed for every data transmission.           "The wireless LAN MAC layer has an    "interface with higher layer which    &receives packet from higher layer and    "generates random address for them.           2. Wireless LAN interface       #This process model is an interface    )between MAC layer and higher layer.  The    &function of this process is to accept    'packets from higher layer and generate    &random destination address for them.     )This information is then sent to the MAC    layer.            3. Wireless LAN receiver       *This is a wireless receiver which accepts    (any incomming packets from the physical    &layer and pass it to the wireless MAC    process.           4. Wireless LAN transmitter       %This is a wireless transmitter which    #receives packet from MAC layer and    $transmits it to the physical medium.                 
       Coexistence Transceiver Type      *wlan_port_rx0.Coexistence Transceiver Type   *wlan_port_tx0.Coexistence Transceiver Type����    ����           ����          ����          ����                         Destination Address      !wlan_mac_intf.Destination Address����    ����           ����          ����          ����                        
Modulation      wlan_port_rx0.modulation   wlan_port_tx0.modulation����   ����       ����      ����      ����                        Traffic Generation Parameters      $source.Traffic Generation Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                        Traffic Type of Service      wlan_mac_intf.Type of Service����    ����           ����          ����          ����                        Transmit Power (W)      wlan_port_tx0.channel [0].power   wlan_port_tx0.channel [1].power   wlan_port_tx0.channel [2].power   wlan_port_tx0.channel [3].power����   ����               ����              ����              ����                         Wireless LAN MAC Address      wireless_lan_mac.Address����    ����           ����          ����          ����                        Wireless LAN Parameters      (wireless_lan_mac.Wireless LAN Parameters����   ����                                             count    �������    ����          ����          ����          ����           �Z             list   	�������   	����                                              �Z                       altitude      altitude����   ����               ����              ����              ����                        phase      phase����   ����               ����              ����              ����                        Coexistence Transceiver Type             ����      Destination Address          ����   Random      
Modulation         
   
CCK_11mbps   
   
TIM source            none      Traffic Generation Parameters         
      None   
   Traffic Type of Service                 Best Effort (0)      Transmit Power (W)         
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
   financial cost            0.00      phase                 ����      priority              ����      role         ����      user id              ����                 �   �          
   wireless_lan_mac   
       J   wlan_mac   J          	processor                    �   �   >          
   source   
       
   bursty_source   
          	processor                    �   �   >          
   sink   
          sink             	processor                    �   �   l          
   wlan_mac_intf   
       
   wlan_mac_interface   
          	processor                   Destination Address    ���   	����   Random   	      Type of Service    ���   	       Best Effort (0)   	   	   �   l  $          
   wlan_port_rx0   
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
       	   bpsk   	       ?�      ����          
        ����   
          
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
����      sec              ����              ����              ����         0.0           ����         !THIS ATTRIBUTE SHOULD NOT BE SET    TO ANY VALUE EXCEPT 0.0. This    "attribute is used by the pipeline     stages to determine whether the    receiver is busy or not. The    value of the attribute will be    updated by the pipeline stages    dynamically during the    simulation. The value will    "indicate when the receiver became    idle or when it is expected to    become idle.      Coexistence Transceiver Type    ���      ����   ����    ����          ����          ����          ����                 �  $  $          
   wlan_port_tx0   
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
          ra_tx                       nd_radio_transmitter         Coexistence Transceiver Type    ���   	   ����   	����    ����          ����          ����          ����                             �      �   �    #   
          strm_3          
   src stream [0]   
       
   dest stream [0]   
       
   ����   
               ����             ����                                           nd_packet_stream             �          x  ,   �   �   
          strm_4          
   src stream [0]   
       
   dest stream [0]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream             �   �      �   =   �   =   �   _   
          strm_10          
   src stream [0]   
       
   dest stream [0]   
       
   ����   
               ����          
   ����   
                                        nd_packet_stream             �   �      �   _   �   >   �   >   
          strm_11          
   src stream [0]   
       
   dest stream [0]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream             �          �   x   �   �   
          strm_12          
   src stream [1]   
       
   dest stream [5]   
       
   ����   
               ����             ����                                           nd_packet_stream                 �      �   �   �   x   
          strm_13          
   src stream [5]   
       
   dest stream [1]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream                 �      �   �       
          strm_14          
   src stream [1]   
       
   dest stream [1]   
       
   ����   
               ����             ����                                           nd_packet_stream             �          x  #   �   �   
          strm_15          
   src stream [1]   
       
   dest stream [1]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream                 �      �   �       
          strm_16          
   src stream [2]   
       
   dest stream [2]   
       
   ����   
               ����             ����                                           nd_packet_stream          	       �      �   �  $     
          strm_17          
   src stream [3]   
       
   dest stream [3]   
       
   ����   
               ����             ����                                           nd_packet_stream          
   �          x     �   �   
          strm_18          
   src stream [2]   
       
   dest stream [2]   
       
   ����   
               ����          
   0����   
                                        nd_packet_stream             �          p     �   �   
          strm_19          
   src stream [3]   
       
   dest stream [3]   
       
   ����   
       
        ����   
       
   0����   
                                        nd_packet_stream            �          `     `   �   �   �          
   rxstat_11Mbps   
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
   ����   
                                        nd_statistic_wire            �         )    )   �   �   �          
   txstat_5Mbps   
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
   ����   
                                        nd_statistic_wire            �         ,    ,   �   �   �          
   txstat_11Mbps   
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
   ����   
                                        nd_statistic_wire            �          d     d   �   �   �          
   rxstat_5Mbps   
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
   ����   
                                        nd_statistic_wire            �         &    &   �   �   �          
   txstat_2Mbps   
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
   ����   
                                        nd_statistic_wire            �         "    "   �   �   �          
   txstat_1Mbps   
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
   ����   
                                        nd_statistic_wire            �          g     h   �   �   �          
   rxstat_2Mbps   
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
   ����   
                                        nd_statistic_wire            �          l     l   �   �   �          
   rxstat_1Mbps   
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
   ����   
                                        nd_statistic_wire      �         &wireless_lan_mac.Backoff Slots (slots)   Backoff Slots (slots)           Wireless Lan   bucket/default total/sum   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0wireless_lan_mac.Control Traffic Rcvd (bits/sec)   Control Traffic Rcvd (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0wireless_lan_mac.Control Traffic Sent (bits/sec)   Control Traffic Sent (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -wireless_lan_mac.Data Traffic Rcvd (bits/sec)   Data Traffic Rcvd (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   -wireless_lan_mac.Data Traffic Sent (bits/sec)   Data Traffic Sent (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0wireless_lan_mac.Data Traffic Sent (packets/sec)   Data Traffic Sent (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *wireless_lan_mac.Channel Reservation (sec)   Channel Reservation (sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3wireless_lan_mac.Control Traffic Rcvd (packets/sec)   "Control Traffic Rcvd (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3wireless_lan_mac.Control Traffic Sent (packets/sec)   "Control Traffic Sent (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0wireless_lan_mac.Data Traffic Rcvd (packets/sec)   Data Traffic Rcvd (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}    wireless_lan_mac.Load (bits/sec)   Load (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   wireless_lan_mac.Load (packets)   Load (packets)           Wireless Lan   bucket/default total/sum   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   &wireless_lan_mac.Throughput (bits/sec)   Throughput (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   0wireless_lan_mac.Dropped Data Packets (bits/sec)   Dropped Data Packets (bits/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2wireless_lan_mac.Retransmission Attempts (packets)   !Retransmission Attempts (packets)           Wireless Lan   bucket/default total/sum   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   3wireless_lan_mac.Dropped Data Packets (packets/sec)   "Dropped Data Packets (packets/sec)           Wireless Lan   bucket/default total/sum_time   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )wireless_lan_mac.Media Access Delay (sec)   Media Access Delay (sec)           Wireless Lan   normal   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   )wireless_lan_mac.Hld Queue Size (packets)   Hld Queue Size (packets)           Wireless Lan   !bucket/default total/time average   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   wireless_lan_mac.Delay (sec)   Delay (sec)           Wireless Lan   normal   linear   Wireless LanԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   sink.End-to-End Delay (seconds)   End-to-End Delay (seconds)           Traffic Sink   normal   linear   Traffic SinkԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   (wlan_port_rx0.channel [0].bit error rate   bit error rate           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   /wlan_port_rx0.channel [0].bit errors per packet   bit errors per packet           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   wlan_port_rx0.channel [0].busy   busy           radio receiver   normal   square-wave   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   *wlan_port_rx0.channel [0].collision status   collision status           radio receiver   normal   square-wave   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   +wlan_port_rx0.channel [0].packet loss ratio   packet loss ratio           radio receiver    bucket/default total/sample mean   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   ,wlan_port_rx0.channel [0].received power (W)   received power           radio receiver   normal   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   1wlan_port_rx0.channel [0].signal/noise ratio (dB)   signal/noise ratio           radio receiver   normal   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   /wlan_port_rx0.channel [0].throughput (bits/sec)   throughput (bits/sec)           radio receiver   bucket/default total/sum_time   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   2wlan_port_rx0.channel [0].throughput (packets/sec)   throughput (packets/sec)           radio receiver   bucket/default total/sum_time   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}   %wlan_port_rx0.channel [0].utilization   utilization           radio receiver   !bucket/default total/time average   linear   radio receiverԲI�%��}ԲI�%��}ԲI�%��}ԲI�%��}          machine type       station   Model Attributes      9.1.A-Dec27-2002                interface type       
IEEE802.11           wlan_port_tx<n>   wlan_port_rx<n>           T�I�%��}   @      @  �   @�  @4                                  