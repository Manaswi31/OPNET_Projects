MIL_3_Tfile_Hdr_ 91A 85A modeler 6 3EBAEA3B 3EC17154 7 LEPRECHAUN hassett 0 0 none none 0 0 none A27D71 524F 0 0 0 0                                                                                                                                                                                                                                                                                                                                                                                                            ЋЭg      8      Р      П  6  $Г  D  D  On  Or      node   bridge   ethernet   10BaseT   100BaseT   	1000BaseX   hidden   VLAN   bridge_largeџџџџџџџџџџџџ   Ethernet Bridge       1/***********************************************/   ,// The SuiteTooth model set was developed by   // HIGHLAND SYSTEMS, INC.   //   /// It incorporates code available in the public   0// domain and other code that is the property of   // OPNET Technologies, Inc.   //   !// Inquiries may be addressed to:   //    // Highland Systems, Inc.   // (703) 312 0830   // info@highsys.com   // www.highsys.com   1/***********************************************/   ! Device Name: wlan_eth_bridge_adv       " This device was created using the   $ device creator utility and contains    the following technologies:             Technology   IF/Port Count     ----------   -------------     Ethernet         2           	      Bridge Parameters      )stb_bridge_functions.Bridge Configurationџџџџ   џџџџ                                          count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ    @         @         @                                   Coexistence Transceiver Type      -wlan_port_rx_1_0.Coexistence Transceiver Type   -wlan_port_tx_1_0.Coexistence Transceiver Typeџџџџ    џџџџ            џџџџ            џџџџ            џџџџ                         Ethernet Parameters (P1)      mac_1.MAC Parametersџџџџ   џџџџ                                          count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ    @         @         @                                  
Modulation      wlan_port_rx_1_0.modulation   wlan_port_tx_1_0.modulationџџџџ   џџџџ        џџџџ        џџџџ        џџџџ                         Switch Port Configuration      'stb_bridge_functions.Port Configurationџџџџ   џџџџ                                          count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ    @         @         @                                  Transmit Power (W)      "wlan_port_tx_1_0.channel [0].power   "wlan_port_tx_1_0.channel [1].power   "wlan_port_tx_1_0.channel [2].power   "wlan_port_tx_1_0.channel [3].powerџџџџ   џџџџ                џџџџ                џџџџ                џџџџ                         VLAN Parameters      'stb_bridge_functions.VLAN Configurationџџџџ   џџџџ                                          count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ    @         @         @                                  Wireless LAN Parameters      (wireless_lan_mac.Wireless LAN Parametersџџџџ   џџџџ                                          count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ    @         @         @                                   Wireless LAN Station Address      wireless_lan_mac.Addressџџџџ    џџџџ            џџџџ            џџџџ            џџџџ                         Bridge Parameters        
      Default   
   Coexistence Transceiver Type             џџџџ      Ethernet Parameters (P1)        
      Default (Switch)   
   
Modulation         
   
CCK_11mbps   
   Switch Port Configuration        
            count    џџџ   
   џџџџ   
      list   	џџџ@  
            Name   џџџ   
   P0   
         Name   џџџ   
   P1   
   
   
   
TIM source         
   none   
   Transmit Power (W)         
?ИQыИџџџџ   
   VLAN Parameters        
      None   
   Wireless LAN Parameters                    count    џџџ   .   џџџџ   .      list   	џџџ@  .            Physical Characteristics    џџџ   .      Direct Sequence   .      Channel Settings   џџџ  .            count    џџџ   .   џџџџ   .      list   	џџџ@  .            	Bandwidth   џџџ   .@е|     џџџџ   .   .   .      Large Packet Processing   џџџ   .      Fragment   .      PCF Parameters   џџџ  .      Disabled   .   .      Wireless LAN Station Address                 Auto Assigned      altitude         
?№      џџџџ   
   altitude modeling         
   relative to subnet-platform   
   	condition         
   џџџџ   
   financial cost         
   0.00   
   phase                 џџџџ      priority              џџџџ      user id              џџџџ                 Ш             
   wireless_lan_mac   
       
   wlan_mac   
          	processor                   Wireless LAN Parameters   џџџ  	      Default   	      л  R   >          
   stb_bridge_functions   
       
   bridge_dispatch_v2   
          queue                   subqueue   џџџ  
            count    џџџ   
   џџџџ   
      list   	џџџ@  
              
   
      с  м             
   mac_1   
       
   ethernet_mac_v2   
          queue                   щ  Ў   Ш          
   eth_rx_1   
      
            count    џџџ   
   џџџџ   
      list   	џџџ@  
            	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
   
   
               џџџџ             pt_rx                       nd_ptp_receiver         э  
   Ш          
   eth_tx_1   
      
            count    џџџ   
   џџџџ   
      list   	џџџ@  
            	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
   
   
          pt_tx                       nd_ptp_transmitter      	   ё   l   Ш          
   wlan_port_rx_1_0   
      
            count    џџџ   
   џџџџ   
      list   	џџџ@  
            	data rate   џџџ   
A.    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
         	data rate   џџџ   
A>    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
         	data rate   џџџ   
ATћ    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
         	data rate   џџџ   
Adћ    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
   
   
       	   bpsk   	       ?№      џџџџ                  џџџџ             
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
          ra_rx                       nd_radio_receiver         reception end time   џџџ   
           0.0   
џџџџ      sec              џџџџ              џџџџ              џџџџ         0.0           џџџџ         !THIS ATTRIBUTE SHOULD NOT BE SET    TO ANY VALUE EXCEPT 0.0. This    "attribute is used by the pipeline     stages to determine whether the    receiver is busy or not. The    value of the attribute will be    updated by the pipeline stages    dynamically during the    simulation. The value will    "indicate when the receiver became    idle or when it is expected to    become idle.          Coexistence Transceiver Type    џџџ      џџџџ   џџџџ    џџџџ          џџџџ          џџџџ          џџџџ                 њ  $   Ш          
   wlan_port_tx_1_0   
      
            count    џџџ   
   џџџџ   
      list   	џџџ@  
            	data rate   џџџ   
A.    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
      power   џџџ   	@Y      џџџџ   	         	data rate   џџџ   
A>    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
      power   џџџ   	@Y      џџџџ   	         	data rate   џџџ   
ATћ    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
      power   џџџ   	@Y      џџџџ   	         	data rate   џџџ   
Adћ    џџџџ   
      packet formats   џџџ   
   unformatted,all formatted   
      	bandwidth   џџџ   
@е|     џџџџ   
      min frequency   џџџ   
@ЂФ     џџџџ   
      power   џџџ   	@Y      џџџџ   	   
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
          ra_tx                       nd_radio_transmitter         Coexistence Transceiver Type    џџџ      џџџџ   џџџџ    џџџџ          џџџџ          џџџџ          џџџџ                         щ   с     К   Ь  а      
       
   eth_rx_1_to_mac_1   
       
   src stream [0]   
       
   dest stream [0]   
       
   џџџџ   
               џџџџ          
@  џџџџџ   
                                        nd_packet_stream             с   э     ш     ў   Ф   
       
   mac_1_to_eth_tx_1   
       
   src stream [0]   
       
   dest stream [0]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream             с   л     а     ^   B   
       
   mac_1_to_stb_bridge_functions   
       
   src stream [1]   
       
   dest stream [0]   
       
   џџџџ   
               џџџџ          
@  џџџџџ   
                                        nd_packet_stream             л   с     ^   :  а      
       
   stb_bridge_functions_to_mac_1   
       
   src stream [0]   
       
   dest stream [1]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream                 њ      б     $     $   О   
       
   tx_2mpbs   
       
   src stream [0]   
       
   dest stream [0]   
       
   џџџџ   
               џџџџ          
   џџџџ   
                                        nd_packet_stream             ё          o   Л   o      Л      
       
   rx_2mpbs   
       
   src stream [0]   
       
   dest stream [0]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream                 њ      б     *     *   П   
       
   tx_5mpbs   
       
   src stream [1]   
       
   dest stream [1]   
       
   џџџџ   
               џџџџ          
   џџџџ   
                                        nd_packet_stream             ё          l   Л   l      Л      
       
   rx_5mpbs   
       
   src stream [1]   
       
   dest stream [1]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream                 њ      б     /     /   Р   
       
   	tx_11mpbs   
       
   src stream [2]   
       
   dest stream [2]   
       
   џџџџ   
               џџџџ             џџџџ                                           nd_packet_stream          	       њ      б             Р   
       
   tx_1mpbs   
       
   src stream [3]   
       
   dest stream [3]   
       
   џџџџ   
               џџџџ             џџџџ                                           nd_packet_stream          
   ё          r   Л   r       Л       
       
   rx_1mpbs   
       
   src stream [2]   
       
   dest stream [2]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream             ё          e   М   e      Р      
       
   	rx_11mpbs   
       
   src stream [3]   
       
   dest stream [3]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream             л         G   G   Ъ      
          	strm_4109          
   src stream [1]   
       
   dest stream [4]   
       
   џџџџ   
               џџџџ             џџџџ                                           nd_packet_stream                 л      Л      Ц     L   <   
          	strm_4110          
   src stream [4]   
       
   dest stream [1]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream            э   с     ў   М  ш             
   eth_tx_1_to_mac_1_stat   
          channel [0]          
   point-to-point transmitter.busy   
          
instat [0]          
   џџџџ   
               џџџџ          
    џџџџ   
       
   џџџџ   
       
    џџџџ   
       
    џџџџ   
       
дВI­%У}џџџџ   
       
дВI­%У}џџџџ   
       
   џџџџ   
                                        nd_statistic_wire            щ   с     К   Н  а             
   eth_rx_1_to_mac_1_stat   
          channel [0]          
   point-to-point receiver.busy   
          
instat [1]          
   џџџџ   
               џџџџ          
   џџџџ   
       
   џџџџ   
       
    џџџџ   
       
    џџџџ   
       
дВI­%У}џџџџ   
       
дВI­%У}џџџџ   
       
   џџџџ   
                                        nd_statistic_wire            ё          x   Я   П   І          
   rxstat_2mbps   
          channel [1]          
   radio receiver.received power   
          
instat [1]          
   џџџџ   
               џџџџ          
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
        џџџџ   
       
=4ЁвW1Рџџџџ   
       
    џџџџ   
                                        nd_statistic_wire            њ            г   Ы   І          
   txstat_1mbps   
          channel [0]          
   radio transmitter.busy   
          
instat [4]          
   џџџџ   
               џџџџ          
    џџџџ   
       
   џџџџ   
       
    џџџџ   
       
    џџџџ   
       
дВI­%У}џџџџ   
       
дВI­%У}џџџџ   
       
    џџџџ   
                                        nd_statistic_wire            њ            Я   д   Ѕ          
   txstat_2mbps   
          channel [1]          
   radio transmitter.busy   
          
instat [4]          
   џџџџ   
               џџџџ          
    џџџџ   
       
   џџџџ   
       
    џџџџ   
       
    џџџџ   
       
дВI­%У}џџџџ   
       
дВI­%У}џџџџ   
       
    џџџџ   
                                        nd_statistic_wire            ё          v   Л   Н             
   rxstat_1mbps   
          channel [0]          
   radio receiver.received power   
          
instat [0]          
   џџџџ   
               џџџџ          
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
        џџџџ   
       
=4ЁвW1Рџџџџ   
       
    џџџџ   
                                        nd_statistic_wire            њ            Ь   д              
   txstat_5mbps   
          channel [2]          
   radio transmitter.busy   
          
instat [4]          
   џџџџ   
               џџџџ          
    џџџџ   
       
   џџџџ   
       
    џџџџ   
       
    џџџџ   
       
дВI­%У}џџџџ   
       
дВI­%У}џџџџ   
       
    џџџџ   
                                        nd_statistic_wire            њ            Ш   д             
   txstat_11mbps   
          channel [3]          
   radio transmitter.busy   
          
instat [4]          
   џџџџ   
               џџџџ          
    џџџџ   
       
   џџџџ   
       
    џџџџ   
       
    џџџџ   
       
дВI­%У}џџџџ   
       
дВI­%У}џџџџ   
       
    џџџџ   
                                        nd_statistic_wire            ё          x   Ь   Л   Є          
   rxstat_5mbps   
          channel [2]          
   radio receiver.received power   
          
instat [2]          
   џџџџ   
               џџџџ          
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
        џџџџ   
       
=4ЁвW1Рџџџџ   
       
    џџџџ   
                                        nd_statistic_wire            ё          x   Х   Л   Ё          
   rxstat_11mbps   
          channel [3]          
   radio receiver.received power   
          
instat [3]          
   џџџџ   
               џџџџ          
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
    џџџџ   
       
        џџџџ   
       
=4ЁвW1Рџџџџ   
       
    џџџџ   
                                        nd_statistic_wire            щ   э     К   г  ў   г          
   ETH (1)   
          8џџџџ                                           nd_association      ћ         .stb_bridge_functions.Traffic Dropped (packets)   Traffic Dropped (packets)           Bridge   bucket/default total/sum   linear   Bridge   /stb_bridge_functions.Traffic Filtered (packets)   Traffic Filtered (packets)           Bridge   bucket/default total/sum   linear   Bridge   -stb_bridge_functions.Traffic Forwarded (bits)   Traffic Forwarded (bits)           Bridge   bucket/default total/sum   linear   Bridge   0stb_bridge_functions.Traffic Forwarded (packets)   Traffic Forwarded (packets)           Bridge   bucket/default total/sum   linear   Bridge   1stb_bridge_functions.Traffic Forwarded (bits/sec)   Traffic Forwarded (bits/sec)           Bridge   bucket/default total/sum_time   linear   Bridge   4stb_bridge_functions.Traffic Forwarded (packets/sec)   Traffic Forwarded (packets/sec)           Bridge   bucket/default total/sum_time   linear   Bridge   0stb_bridge_functions.Traffic Received (bits/sec)   Traffic Received (bits/sec)           Bridge   bucket/default total/sum_time   linear   Bridge   3stb_bridge_functions.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Bridge   bucket/default total/sum_time   linear   Bridge   3stb_bridge_functions.Traffic Received (packets/sec)   Traffic Received (packets/sec           VLAN   bucket/default total/sum_time   linear   VLAN   2stb_bridge_functions.Traffic Dropped (packets/sec)   Traffic Dropped (packets/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   /stb_bridge_functions.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   <stb_bridge_functions.Broadcast Traffic Dropped (packets/sec)   'Broadcast Traffic Dropped (packets/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   0stb_bridge_functions.Traffic Received (bits/sec)   Traffic Received (bits/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   /stb_bridge_functions.Traffic Dropped (bits/sec)   Traffic Dropped (bits/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   ,stb_bridge_functions.Traffic Sent (bits/sec)   Traffic Sent (bits/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   9stb_bridge_functions.Broadcast Traffic Dropped (bits/sec)   $Broadcast Traffic Dropped (bits/sec)           VLAN   bucket/default total/sum_time   linear   VLAN   5stb_bridge_functions.BPDU Traffic Received (bits/sec)    BPDU Traffic Received (bits/sec)           Bridge   bucket/default total/sum_time   linear   Bridge   1stb_bridge_functions.BPDU Traffic Sent (bits/sec)   BPDU Traffic Sent (bits/sec)           Bridge   bucket/default total/sum_time   linear   Bridge          machine type       bridge   Model Attributes      9.1.A-Dec27-2002                 interface type      5ethernet:10BaseT,ethernet:100BaseT,ethernet:1000BaseX           
eth_tx_<n>   
eth_rx_<n>          