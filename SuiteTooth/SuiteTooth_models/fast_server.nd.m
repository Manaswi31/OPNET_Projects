MIL_3_Tfile_Hdr_ 80C 73B modeler 6 3C4DFD64 3C4DFE6F 2 LEPRECHAUN hassett 0 0 none none 0 0 none 49E1C2A8 F267 0 0 0 0                                                                                                                                                                                                                                                                                                                                                                                                          ЋЭg      8   Л   х  z  ~  .Ё  BІ  Ma  m  m  я  я      node   ethernet   IP   UDP   TCP   hidden   10BaseT   TCP   server   100BaseT   	1000BaseX   EtherChannel   RSVP   serverџџџџџџџџџџџџ   Ethernet Server    u   General Node Functions:   -----------------------       )The ethernet_server_adv model represents    'a server node with server applications    *running over TCP/IP and UDP/IP. This node    !supports one underlying Ethernet    &connection at 10 Mbps, 100 Mbps, or 1    *Gbps. The operational speed is determined    "by the connected link's data rate.       *The Ethernet MAC in this node can be made    $to operate either in full-duplex or    !half-duplex mode. Note that when    (connected to a Hub, it should always be    )set to "Half Duplex".  A fixed amount of    *time is required to route each packet, as    'determined by the "IP Forwarding Rate"    *attribute of the node. Packets are routed    *on a FCFS basis and may encounter queuing    (at the lower protocol layers, depending    !on the transmission rates of the    corresponding output interface.       
Protocols:   
----------       "RIP, UDP, IP, TCP, Ethernet, Fast    Ethernet, Gigabit Ethernet       Interconnections:   -----------------       )1) 1 Ethernet connection at 10 Mbps, 100    Mbps, or 1000 Mbps       Attributes:   -----------       )Ethernet Operational Mode: Specifies the    (mode in which the Ethernet MAC operates    (Half Duplex or Full Duplex)               "Server Configuration Table:  This    *attribute allows for the specification of    (application servers running on the node.               *Transport Address:  This attribute allows    (for the specification of the address of    	the node.               )"IP Forwarding Rate": specifies the rate    *(in packets/second) at which the node can    "perform a routing decision for an    'arriving packet and transfer it to the    appropriate output interface.               )"IP Gateway Function": specifies whether    *the local IP node is acting as a gateway.    )Workstations should not act as gateways,    (as they only have one network interface.               *"RIP Process Mode": specifies whether the    (RIP process is silent or active. Silent    &RIP processes do not send any routing    (updates but simply receive updates. All    )RIP processes in a workstation should be    silent RIP processes.               ("TCP Connection Information": specifies    )whether diagnostic information about TCP    #connections from this node will be    'displayed at the end of the simulation.               '"TCP Maximum Segment Size": determines    'the size of segments sent by TCP. This    'value should be set to largest segment    %size that the underlying network can    carry unfragmented.               )"TCP Receive Buffer Capacity": specifies    $the size of the buffer used to hold    (received data before it is forwarded to    the application.               <<Summary>>       General Function: server       (Supported Protocols: UDP, IP, Ethernet,    RIP, TCP, OSPF               Port Interface Description:       (  1 Ethernet connection at 10 Mbps, 100    Mbps, or 1000 Mbps           "      ARP Parameters      arp.ARP Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           #Application: ACE Tier Configuration      "application.ACE Tier Configurationџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           $Application: Destination Preferences      #application.Destination Preferencesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           'Application: Multicasting Specification      &application.Multicasting Specificationџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Application: RSVP Parameters      'application.RSVP Application Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Application: Segment Size      application.Segment Sizeџџџџ   џџџџ               џџџџ              џџџџ              џџџџ                        Application: Source Preferences      application.Source Preferencesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Application: Supported Profiles      application.Supported Profilesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Application: Supported Services      application.Servicesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           -Application: Transport Protocol Specification      application.Transport Protocolџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           CPU Background Utilization      CPU.background utilizationџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           CPU Resource Parameters      CPU.Resource Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                            CPU: Modeling Method      CPU.Compatibility Modeџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                        CPU: Server Type      CPU.Server Typeџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                        Disk: Disk Configuration      CPU.Disk Subsystemџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                            Disk: Maximum Blocksize      CPU.Maximum Blocksizeџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                         Ethernet Address (IF0 P0)      mac.station_addressџџџџ    џџџџ           џџџџ          џџџџ          џџџџ                         Ethernet Frame Bursting (IF0 P0)      mac.frame_burstingџџџџ   џџџџ           џџџџ          џџџџ          џџџџ                        "Ethernet Operational Mode (IF0 P0)      mac.operational_modeџџџџ   џџџџ           џџџџ          џџџџ          џџџџ                        "Ethernet Promiscuous Mode (IF0 P0)      mac.promis_modeџџџџ   џџџџ           џџџџ          џџџџ          џџџџ                        IGMP Host Parameters      $ip.ip_igmp_host.IGMP Host Attributesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           IGMP Router Parameters      *ip.ip_igmp_rte_intf.IGMP Router Attributesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           %IP Background Traffic Characteristics      ip.ip bgutil characteristicsџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ         џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           IP Gateway Function      
ip.gatewayџџџџ   џџџџ           џџџџ          џџџџ          џџџџ                        IP Host Parameters      ip.ip host parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           IP Ping Traffic      ip.ip_icmp.Ping Trafficџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           IP Processing Information      ip.ip processing informationџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           IP Slot Information      ip.ip slot informationџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Jobs: Definitions      CPU.Job Definitionsџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Jobs: Paging System Definitions      CPU.Paging System Definitionsџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           LAN Supported Profiles      "application.LAN Supported Profilesџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           RSVP Protocol Parameters      rsvp.RSVP Protocol Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                           Server Address      tpal.Addressџџџџ   џџџџ       џџџџ      џџџџ      џџџџ                        TCP Parameters      tcp.TCP Parametersџџџџ   џџџџ                                             count    џџџџџџџ    џџџџ          џџџџ          џџџџ          џџџџ              list   	џџџџџџџ   	џџџџ                                                        F   ARP Parameters         
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
   CPU Resource Parameters                     count    џџџ      џџџџ         list   	џџџ               Number of Resources    џџџ   
      1   
      Task Contention Mode    џџџ          Contention Already Modeled         Multi-tasking Performance Table   џџџ         
No Entries            CPU: Modeling Method          
       
Simple CPU   
   CPU: Modeling Method          
       
Simple CPU   
   CPU: Server Type            Sun Ultra 10 333 MHz      CPU: Server Type            Sun Ultra 10 333 MHz      CPU: Server Type            Sun Ultra 10 333 MHz      Disk: Disk Configuration         
      None   
   Disk: Disk Configuration         
      None   
   Disk: Disk Configuration         
      None   
   Disk: Maximum Blocksize                 64K      Disk: Maximum Blocksize                 64K      Disk: Maximum Blocksize                 64K      Ethernet Address (IF0 P0)                 Auto Assigned       Ethernet Frame Bursting (IF0 P0)         
       Enabled   
   "Ethernet Operational Mode (IF0 P0)         
       Full Duplex   
   "Ethernet Promiscuous Mode (IF0 P0)                Disabled      IGMP Host Parameters         
      Default   
   IGMP Router Parameters         
      Default   
   %IP Background Traffic Characteristics         
       
   IP Gateway Function         
       Disabled   
   IP Host Parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Interface Information   џџџ   
            count    џџџ   
   џџџџ   
      list   	џџџ   
            MTU    џџџ   
       Ethernet   
      QoS Information   џџџ   
      None   
   
   
      Static Routing Table   џџџ   
      None   
   
   
   IP Ping Traffic         
      None   
   IP Processing Information                     count    џџџ      џџџџ         list   	џџџ               Datagram Forwarding Rate   џџџ   A.    џџџџ            IP Slot Information         
      NOT USED   
   Jobs: Definitions         
      	Undefined   
   Jobs: Definitions         
      	Undefined   
   Jobs: Definitions         
      	Undefined   
   Jobs: Paging System Definitions         
      	Undefined   
   Jobs: Paging System Definitions         
      	Undefined   
   Jobs: Paging System Definitions         
      	Undefined   
   LAN Supported Profiles         
      None   
   RSVP Protocol Parameters         
      Default   
   Server Address            Auto Assigned      TCP Parameters         
      Default   
   
TIM source         
   ip   
   altitude         
        џџџџ   
   altitude modeling            relative to subnet-platform      	condition         
   џџџџ   
   financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      financial cost            0.00      ip.ip multicast information         
      Default   
   ip.ip router parameters         
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Interface Information   џџџ   
            count    џџџ   
   џџџџ   
      list   	џџџ   
            QoS Information   џџџ   
      None   
   
   
      Loopback Interfaces   џџџ   
            count    џџџ   
   џџџџ   
      list   	џџџ   
            Name   џџџ   
   Loopback   
   
   
      Static Routing Table   џџџ   
      None   
      Routing Table Export   џџџ   
      Disabled   
   
   
   ip.mpls_mgr.MPLS Parameters                     count    џџџ   
   џџџџ   
      list   	џџџ   
          
      phase         
        џџџџ   
   priority          
    џџџџ   
   user id          
    џџџџ   
              >             
   udp   
       
   
rip_udp_v3   
       
   	processor   
                       Ш          
   ip_encap   
       
   ip_encap_v4   
       
   	processor   
                      $          
   arp   
       
   	ip_arp_v4   
       
   	processor   
                                 
   tcp   
       
   tcp_manager_v3   
       
   	processor   
                       l          
   tpal   
       
   tpal_v3   
       
   	processor   
                 
      >          
   application   
       
   gna_clsvr_mgr   
       
   	processor   
                    і             
   rsvp   
       
   rsvp   
       
   	processor   
                       і          
   ip   
       
   ip_dispatch   
          	processor                    I   і   >          
   CPU   
       
   
server_mgr   
          	processor                   Compatibility Mode    џџџ   	       
Simple CPU   	      Disk Subsystem   џџџ   	      None   	      Job Definitions   џџџ   	      	Undefined   	      Maximum Blocksize    џџџ   	      64K   	      Paging System Definitions   џџџ   	      	Undefined   	      Resource Parameters   џџџ   	      Single Processor   	      Server Type   џџџ   	   Sun Ultra 10 333 MHz   	      background utilization   џџџ   	      None   	     g     R          
   mac   
       
   ethernet_mac_v2   
       
   queue   
               o   l            
   
hub_rx_0_0   
       
            count    џџџ   
   џџџџ   
      list   	џџџ   
            	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
         	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
         	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
         	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
   
   
       
        џџџџ   
       
   pt_rx   
                    nd_ptp_receiver        v   Ш            
   
hub_tx_0_0   
       
            count    џџџ   
   џџџџ   
      list   	џџџ   
            	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
         	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
         	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
         	data rate   џџџ   
двI­%У}џџџџ   
      packet formats   џџџ   
   ethernet_v2   
   
   
       
   pt_tx   
                    nd_ptp_transmitter                              Э   ;   Э   <   І   
       
   	strm_15_2   
       
   src stream [2]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream                       ?   І   @   Ш      Ч   
       
   	strm_16_2   
       
   src stream [0]   
       
   dest stream [2]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream                      І   Я   И   Я   И   №   І   №   
       
   strm_8   
       
   src stream [0]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream                         ё   w   ё   w   б      б   
       
   strm_9   
       
   src stream [0]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream                      І   њ   И   њ   И  "   І  "          
   port_0   
       
   src stream [1]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream         ip addr index    џџџ   
    џџџџ   
џџџџ    џџџџ           џџџџ          џџџџ          џџџџ                        
         d   y   d   y   >      =   
       
   strm_210   
       
   src stream [2]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream             
         І   ?   З   @   З   h   І   h   
       
   strm_220   
       
   src stream [0]   
       
   dest stream [2]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream                      І   m   З   n   З      І      
       
   strm_221   
       
   src stream [0]   
       
   dest stream [1]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream                            w      w   t      t   
       
   strm_222   
       
   src stream [1]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream          	            І       И       И   П   І   П   
       
   	strm_4104   
       
   src stream [0]   
       
   dest stream [1]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream          
               Т   w   Т   w            
       
   	strm_4105   
       
   src stream [1]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream               g      І  '   И  '   И  U   І  U   
       
   	strm_4106   
       
   src stream [0]   
       
   dest stream [1]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream                          o   G   o   G      
          	strm_4107          
   src stream [3]   
       
   dest stream [2]   
       
   џџџџ   
               џџџџ          
   џџџџ   
                                        nd_packet_stream                       C      C   j      j   
          	strm_4108          
   src stream [2]   
       
   dest stream [3]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream                        "   w  "   w   ќ      ќ          
   	in_port_0   
       
   src stream [1]   
       
   dest stream [1]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream         ip addr index    џџџ   
    џџџџ   
џџџџ    џџџџ           џџџџ          џџџџ          џџџџ                    g           Q   w  Q   w  +     +   
          	strm_4112          
   src stream [1]   
       
   dest stream [1]   
       
   џџџџ   
               џџџџ          
   0џџџџ   
                                        nd_packet_stream            o  g      i  s     O   
          hub_rx_0_to_mac0          
   src stream [0]   
       
   dest stream [2]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream            g  v      І  N   Ь  s   
       
   mac_to_hub_tx_00   
       
   src stream [2]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream            o  g      p  s     V   
          hub_rx_0_to_mac1          
   src stream [1]   
       
   dest stream [3]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream            g  v      І  U   Ф  s   
       
   mac_to_hub_tx_01   
       
   src stream [3]   
       
   dest stream [1]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream            o  g      w  s     ^   
          hub_rx_0_to_mac2          
   src stream [2]   
       
   dest stream [4]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream            g  v      Ѕ  ]   Н  s   
       
   mac_to_hub_tx_02   
       
   src stream [4]   
       
   dest stream [2]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream            o  g      x  |     ^   
          hub_rx_0_to_mac3          
   src stream [3]   
       
   dest stream [5]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream            g  v        ^   Л  {   
       
   mac_to_hub_tx_03   
       
   src stream [5]   
       
   dest stream [3]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream                      І   Э   њ   Э   њ   І   
       
   ip_encap_to_rsvp   
       
   src stream [6]   
       
   dest stream [0]   
       
   џџџџ   
       
        џџџџ   
       
   0џџџџ   
                                        nd_packet_stream                      є   І   є   Щ   І   Щ   
       
   rsvp_to_ip_encap   
       
   src stream [0]   
       
   dest stream [6]   
       
   џџџџ   
       
        џџџџ   
       
   џџџџ   
                                        nd_packet_stream           v  g      г  s   І  Y          
   	stat_0101   
          channel [0]          
   point-to-point transmitter.busy   
          
instat [0]          
   џџџџ   
       
        џџџџ   
       
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
   =џџџџ   
                                        nd_statistic_wire           o  g      `  s     U          
   st_7   
          channel [0]          
   point-to-point receiver.busy   
          
instat [1]          
   џџџџ   
       
        џџџџ   
       
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
   =џџџџ   
                                        nd_statistic_wire           o  v      x     Л            
   Ethernet (IF0 P0)   
          8џџџџ                                           nd_association     w      т   +ip.Broadcast Traffic Received (packets/sec)   (Broadcast Traffic Received (packets/sec)           IP   bucket/default total/sum_time   linear   IP   'ip.Broadcast Traffic Sent (packets/sec)   $Broadcast Traffic Sent (packets/sec)           IP   bucket/default total/sum_time   linear   IP   +ip.Multicast Traffic Received (packets/sec)   (Multicast Traffic Received (packets/sec)           IP   bucket/default total/sum_time   linear   IP   'ip.Multicast Traffic Sent (packets/sec)   $Multicast Traffic Sent (packets/sec)           IP   bucket/default total/sum_time   linear   IP    ip.Traffic Dropped (packets/sec)   Traffic Dropped (packets/sec)           IP   bucket/default total/sum_time   linear   IP   !ip.Traffic Received (packets/sec)   Traffic Received (packets/sec)           IP   bucket/default total/sum_time   linear   IP   ip.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           IP   bucket/default total/sum_time   linear   IP   mac.Burst Duration (sec)   Burst Duration (sec)           Ethernet    bucket/default total/sample mean   linear   Ethernet   mac.Burst ON/OFF   Burst ON/OFF           Ethernet   normal   linear   Ethernet   mac.Burst Size (packets)   Burst Size (packets)           Ethernet    bucket/default total/sample mean   linear   Ethernet   mac.Collision Count   Collision Count           Ethernet   bucket/default total/sum   linear   Ethernet   mac.Delay (sec)   Delay (sec)           Ethernet    bucket/default total/sample mean   linear   Ethernet   mac.Load (bits)   Load (bits)           Ethernet   bucket/default total/sum   linear   Ethernet   mac.Load (bits/sec)   Load (bits/sec)           Ethernet   bucket/default total/sum_time   linear   Ethernet   mac.Load (packets)   Load (packets)           Ethernet   bucket/default total/sum   linear   Ethernet   mac.Load (packets/sec)   Load (packets/sec)           Ethernet   bucket/default total/sum_time   linear   Ethernet   mac.Traffic Received (bits)   Traffic Received (bits)           Ethernet   bucket/default total/sum   linear   Ethernet   mac.Traffic Received (bits/sec)   Traffic Received (bits/sec)           Ethernet   bucket/default total/sum_time   linear   Ethernet   mac.Traffic Received (packets)   Traffic Received (packets)           Ethernet   bucket/default total/sum   linear   Ethernet   "mac.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Ethernet   bucket/default total/sum_time   linear   Ethernet   mac.Transmission Attempts   Transmission Attempts           Ethernet   normal   linear   Ethernet   "tcp.Congestion Window Size (bytes)   Congestion Window Size (bytes)           TCP Connection   sample/default total   linear   TCP Connection   tcp.Delay (sec)   Delay (sec)           TCP Connection    bucket/default total/sample mean   discrete   TCP Connection   tcp.Load (bytes)   Load (bytes)           TCP Connection   bucket/default total/sum   linear   TCP Connection   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP Connection   tcp.Load (packets)   Load (packets)           TCP Connection   bucket/default total/sum   linear   TCP Connection   tcp.Load (packets/sec)   Load (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP Connection   tcp.Received Segment Ack Number   Received Segment Ack Number           TCP Connection   sample/default total   linear   TCP Connection   $tcp.Received Segment Sequence Number    Received Segment Sequence Number           TCP Connection   sample/default total   linear   TCP Connection   &tcp.Remote Receive Window Size (bytes)   "Remote Receive Window Size (bytes)           TCP Connection   sample/default total   linear   TCP Connection   $tcp.Retransmission Timeout (seconds)    Retransmission Timeout (seconds)           TCP Connection   sample/default total   linear   TCP Connection   !tcp.Segment Round Trip Time (sec)   Segment Round Trip Time (sec)           TCP Connection    bucket/default total/sample mean   linear   TCP Connection   %tcp.Segment Round Trip Time Deviation   !Segment Round Trip Time Deviation           TCP Connection    bucket/default total/sample mean   linear   TCP Connection   tcp.Sent Segment Ack Number   Sent Segment Ack Number           TCP Connection   sample/default total   linear   TCP Connection   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP Connection   bucket/default total/sum   linear   TCP Connection    tcp.Sent Segment Sequence Number   Sent Segment Sequence Number           TCP Connection   sample/default total   linear   TCP Connection    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP Connection   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP Connection   bucket/default total/sum   linear   TCP Connection   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP Connection   bucket/default total/sum_time   linear   TCP Connection   tcp.Connection Aborts   Connection Aborts           TCP   bucket/default total/sum   linear   TCP   tcp.Delay (sec)   Delay (sec)           TCP    bucket/default total/sample mean   linear   TCP   tcp.Load (bytes)   Load (bytes)           TCP   bucket/default total/sum   linear   TCP   tcp.Load (bytes/sec)   Load (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCP   tcp.Load (packets)   Load (packets)           TCP   bucket/default total/sum   linear   TCP   tcp.Load (packets/sec)   Load (packets/sec)           TCP   bucket/default total/sum_time   linear   TCP   tcp.Traffic Received (bytes)   Traffic Received (bytes)           TCP   bucket/default total/sum   linear   TCP    tcp.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           TCP   bucket/default total/sum_time   linear   TCP   tcp.Traffic Received (packets)   Traffic Received (packets)           TCP   bucket/default total/sum   linear   TCP   "tcp.Traffic Received (packets/sec)   Traffic Received (packets/sec)           TCP   bucket/default total/sum_time   linear   TCP   ip.Processing Delay (sec)   Processing Delay (sec)           IP    bucket/default total/sample mean   linear   IP   %ip.Background Traffic Delay --> (sec)   "Background Traffic Delay --> (sec)           IP   normal   linear   IP   %ip.Background Traffic Delay <-- (sec)   "Background Traffic Delay <-- (sec)           IP   normal   linear   IP   "ip.Ping Replies Received (packets)   Ping Replies Received (packets)           IP   bucket/default total/count   square-wave   IP   ip.Ping Requests Sent (packets)   Ping Requests Sent (packets)           IP   bucket/default total/count   square-wave   IP   ip.Ping Response Time (sec)   Ping Response Time (sec)           IP    bucket/default total/sample mean   discrete   IP   mac.Traffic Received (bits/sec)   Traffic Received 0 (bits/sec)           EtherChannel   bucket/default total/sum_time   linear   EtherChannel   mac.Traffic Sent (bits/sec)   Traffic Sent 0 (bits/sec)           EtherChannel   bucket/default total/sum_time   linear   EtherChannel   mac.Utilization -->   Utilization --> 0           EtherChannel   !bucket/default total/time average   linear   EtherChannel   mac.Utilization <--   Utilization <-- 0           EtherChannel   !bucket/default total/time average   linear   EtherChannel   rsvp.Number of Path States   Number of Path States           RSVP   bucket/default total/sum_time   sample_hold   RSVP   rsvp.Number of Resv States   Number of Resv States           RSVP   bucket/default total/sum_time   sample_hold   RSVP   rsvp.Number of Blockade States   Number of Blockade States           RSVP   bucket/default total/sum_time   sample_hold   RSVP   )rsvp.Path Messages Received (packets/sec)   $Path Messages Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   %rsvp.Path Messages Sent (packets/sec)    Path Messages Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   )rsvp.Resv Messages Received (packets/sec)   $Resv Messages Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   %rsvp.Resv Messages Sent (packets/sec)    Resv Messages Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   .rsvp.Resv Conf Messages Received (packets/sec)   )Resv Conf Messages Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   *rsvp.Resv Conf Messages Sent (packets/sec)   %Resv Conf Messages Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   .rsvp.Total RSVP Traffic Received (packets/sec)   )Total RSVP Traffic Received (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   *rsvp.Total RSVP Traffic Sent (packets/sec)   %Total RSVP Traffic Sent (packets/sec)           RSVP   bucket/default total/sum_time   linear   RSVP   "rsvp.Number of Successful Requests   Number of Successful Requests           RSVP   bucket/default total/sum_time   linear   RSVP    rsvp.Number of Rejected Requests   Number of Rejected Requests           RSVP   bucket/default total/sum_time   linear   RSVP   ip.IGMP Traffic Sent (bits/sec)   IGMP Traffic Sent (bits/sec)           	IGMP Host   bucket/default total/sum_time   linear   	IGMP Host   "ip.IGMP Traffic Sent (packets/sec)   IGMP Traffic Sent (packets/sec)           	IGMP Host   bucket/default total/sum_time   linear   	IGMP Host   #ip.IGMP Traffic Received (bits/sec)    IGMP Traffic Received (bits/sec)           	IGMP Host   bucket/default total/sum_time   linear   	IGMP Host   &ip.IGMP Traffic Received (packets/sec)   #IGMP Traffic Received (packets/sec)           	IGMP Host   bucket/default total/sum_time   linear   	IGMP Host   ip.Buffer Usage (bytes)   Buffer Usage (bytes)           IP Interface   !bucket/default total/time average   linear   IP Interface   ip.Queuing Delay   Queuing Delay (sec)           IP Interface    bucket/default total/sample mean   linear   IP Interface   ip.Traffic Dropped (bits/sec)   Traffic Dropped (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP Interface    ip.Traffic Dropped (packets/sec)   Traffic Dropped (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP Interface   ip.Traffic Received (bits/sec)   Traffic Received (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP Interface   !ip.Traffic Received (packets/sec)   Traffic Received (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP Interface   ip.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           IP Interface   bucket/default total/sum_time   linear   IP Interface   ip.Traffic Sent (bits/sec)   Traffic Sent (bits/sec)           IP Interface   bucket/default total/sum_time   linear   IP Interface   ip.RED Average Queue Size   RED Average Queue Size           IP Interface   !bucket/default total/time average   linear   IP Interface   ip.Buffer Usage (packets)   Buffer Usage (packets)           IP Interface   !bucket/default total/time average   linear   IP Interface   ip.RSVP Allocated Buffer   RSVP Allocated Buffer (bytes)           IP Interface   normal   sample-hold   IP Interface   ip.RSVP Allocated Bandwidth   $RSVP Allocated Bandwidth (bytes/sec)           IP Interface   normal   sample-hold   IP Interface   $application.Task Response Time (sec)   Task Response Time (sec)           ACE    bucket/default total/sample mean   discrete   ACE   application.Load (requests/sec)   Load (requests/sec)           $Responding Server Custom Application   bucket/default total/sum_time   linear   Server Custom Application   application.Load (sessions/sec)   Load (sessions/sec)           $Responding Server Custom Application   bucket/default total/sum_time   linear   Server Custom Application   &application.Task Processing Time (sec)   Task Processing Time (sec)           $Responding Server Custom Application    bucket/default total/sample mean   discrete   Server Custom Application   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           $Responding Server Custom Application   bucket/default total/sum_time   linear   Server Custom Application   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           $Responding Server Custom Application   bucket/default total/sum_time   linear   Server Custom Application   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           $Responding Server Custom Application   bucket/default total/sum_time   linear   Server Custom Application   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           $Responding Server Custom Application   bucket/default total/sum_time   linear   Server Custom Application   application.Load (requests/sec)   Load (requests/sec)           Server DB Entry   bucket/default total/sum_time   linear   Server DB Entry   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server DB Entry    bucket/default total/sample mean   discrete   Server DB Entry   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Server DB Entry   bucket/default total/sum_time   linear   Server DB Entry   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Server DB Entry   bucket/default total/sum_time   linear   Server DB Entry   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Server DB Entry   bucket/default total/sum_time   linear   Server DB Entry   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Server DB Entry   bucket/default total/sum_time   linear   Server DB Entry   application.Load (requests/sec)   Load (requests/sec)           Server DB Query   bucket/default total/sum_time   linear   Server DB Query   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server DB Query    bucket/default total/sample mean   discrete   Server DB Query   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Server DB Query   bucket/default total/sum_time   linear   Server DB Query   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Server DB Query   bucket/default total/sum_time   linear   Server DB Query   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Server DB Query   bucket/default total/sum_time   linear   Server DB Query   application.Load (requests/sec)   Load (requests/sec)           Server Email   bucket/default total/sum_time   linear   Server Email   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Server DB Query   bucket/default total/sum_time   linear   Server DB Query   application.Load (sessions/sec)   Load (sessions/sec)           Server Email   bucket/default total/sum_time   linear   Server Email   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server Email   !bucket/default total/time average   discrete   Server Email   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Server Email   bucket/default total/sum_time   linear   Server Email   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Server Email   bucket/default total/sum_time   linear   Server Email   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Server Email   bucket/default total/sum_time   linear   Server Email   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Server Email   bucket/default total/sum_time   linear   Server Email   application.Load (requests/sec)   Load (requests/sec)           
Server Ftp   bucket/default total/sum_time   linear   
Server Ftp   application.Load (sessions/sec)   Load (sessions/sec)           
Server Ftp   bucket/default total/sum_time   linear   
Server Ftp   &application.Task Processing Time (sec)   Task Processing Time (sec)           
Server Ftp    bucket/default total/sample mean   discrete   
Server Ftp   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           
Server Ftp   bucket/default total/sum_time   linear   
Server Ftp   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           
Server Ftp   bucket/default total/sum_time   linear   
Server Ftp   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           
Server Ftp   bucket/default total/sum_time   linear   
Server Ftp   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           
Server Ftp   bucket/default total/sum_time   linear   
Server Ftp   application.Load (requests/sec)   Load (requests/sec)           Server Http   bucket/default total/sum_time   linear   Server Http   application.Load (sessions/sec)   Load (sessions/sec)           Server Http   !bucket/default total/time average   linear   Server Http   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server Http    bucket/default total/sample mean   discrete   Server Http   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Server Http   bucket/default total/sum_time   linear   Server Http   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Server Http   bucket/default total/sum_time   linear   Server Http   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Server Http   bucket/default total/sum_time   linear   Server Http   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Server Http   bucket/default total/sum_time   linear   Server Http   application.Load (requests/sec)   Load (requests/sec)           Server Performance   bucket/default total/sum_time   linear   Server Performance   application.Load (tasks/sec)   Load (tasks/sec)           Server Performance   bucket/default total/sum   linear   Server Performance   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server Performance    bucket/default total/sample mean   discrete   Server Performance   application.Load (requests/sec)   Load (requests/sec)           Server Print   bucket/default total/sum_time   linear   Server Print   application.Load (sessions/sec)   Load (sessions/sec)           Server Print   bucket/default total/sum_time   linear   Server Print   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server Print    bucket/default total/sample mean   discrete   Server Print   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Server Print   bucket/default total/sum_time   linear   Server Print   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Server Print   bucket/default total/sum_time   linear   Server Print   application.Load (requests/sec)   Load (requests/sec)           Server Remote Login   bucket/default total/sum_time   linear   Server Remote Login   &application.Task Processing Time (sec)   Task Processing Time (sec)           Server Remote Login    bucket/default total/sample mean   discrete   Server Remote Login   application.Load (sessions/sec)   Load (sessions/sec)           Server Remote Login   bucket/default total/sum_time   linear   Server Remote Login   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           Server Remote Login   bucket/default total/sum_time   linear   Server Remote Login   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           Server Remote Login   bucket/default total/sum_time   linear   Server Remote Login   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           Server Remote Login   bucket/default total/sum_time   linear   Server Remote Login   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           Server Remote Login   bucket/default total/sum_time   linear   Server Remote Login   -application.Request Generation Time (seconds)   !Request Generation Time (seconds)           $Requesting Server Custom Application    bucket/default total/sample mean   discrete   Client Custom Application    application.Request Size (bytes)   Request Size (bytes)           $Requesting Server Custom Application    bucket/default total/sample mean   linear   Client Custom Application   !application.Response Size (bytes)   Response Size (bytes)           $Requesting Server Custom Application    bucket/default total/sample mean   linear   Client Custom Application   3application.Total Request Generation Time (seconds)   'Total Request Generation Time (seconds)           $Requesting Server Custom Application    bucket/default total/sample mean   discrete   Client Custom Application   &application.Total Request Size (bytes)   Total Request Size (bytes)           $Requesting Server Custom Application    bucket/default total/sample mean   linear   Client Custom Application   'application.Total Response Size (bytes)   Total Response Size (bytes)           $Requesting Server Custom Application    bucket/default total/sample mean   linear   Client Custom Application   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           $Requesting Server Custom Application   bucket/default total/sum_time   linear   Client Custom Application   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           $Requesting Server Custom Application   bucket/default total/sum_time   linear   Client Custom Application   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           $Requesting Server Custom Application   bucket/default total/sum_time   linear   Client Custom Application   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           $Requesting Server Custom Application   bucket/default total/sum_time   linear   Client Custom Application   +application.Application Response Time (sec)   Application Response Time (sec)           $Requesting Server Custom Application    bucket/default total/sample mean   discrete   Client Custom Application   (application.Task Response Time (seconds)   Task Response Time (seconds)           $Requesting Server Custom Application    bucket/default total/sample mean   discrete   Client Custom Application   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP Connection    bucket/default total/sample mean   discrete   TCP Connection   tcp.Segment Delay (sec)   Segment Delay (sec)           TCP    bucket/default total/sample mean   discrete   TCP   &ip.Forwarding Memory Free Size (bytes)   #Forwarding Memory Free Size (bytes)           IP Processor   !bucket/default total/time average   linear   IP Processor   ip.Forwarding Memory Overflows   Forwarding Memory Overflows           IP Processor   sample/default total   linear   IP Processor   'ip.Forwarding Memory Queue Size (bytes)   $Forwarding Memory Queue Size (bytes)           IP Processor   !bucket/default total/time average   linear   IP Processor   0ip.Forwarding Memory Queue Size (incoming bytes)   -Forwarding Memory Queue Size (incoming bytes)           IP Processor   !bucket/default total/time average   linear   IP Processor   2ip.Forwarding Memory Queue Size (incoming packets)   /Forwarding Memory Queue Size (incoming packets)           IP Processor   !bucket/default total/time average   linear   IP Processor   )ip.Forwarding Memory Queue Size (packets)   &Forwarding Memory Queue Size (packets)           IP Processor   !bucket/default total/time average   linear   IP Processor   "ip.Forwarding Memory Queuing Delay   Forwarding Memory Queuing Delay           IP Processor    bucket/default total/sample mean   discrete   IP Processor   application.Load (requests/sec)   Load (requests/sec)           	Server DB   bucket/default total/sum_time   linear   	Server DB   application.Load (sessions/sec)   Load (sessions/sec)           	Server DB   bucket/default total/sum_time   linear   	Server DB   &application.Task Processing Time (sec)   Task Processing Time (sec)           	Server DB    bucket/default total/sample mean   linear   	Server DB   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           	Server DB   bucket/default total/sum_time   linear   	Server DB   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           	Server DB   bucket/default total/sum_time   linear   	Server DB   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           	Server DB   bucket/default total/sum_time   linear   	Server DB   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           	Server DB   bucket/default total/sum_time   linear   	Server DB    udp.Traffic Received (Bytes/Sec)   Traffic Received (Bytes/Sec)           UDP   bucket/default total/sum_time   linear   UDP   "udp.Traffic Received (Packets/Sec)   Traffic Received (Packets/Sec)           UDP   bucket/default total/sum_time   linear   UDP   udp.Traffic Sent (Bytes/Sec)   Traffic Sent (Bytes/Sec)           UDP   bucket/default total/sum_time   linear   UDP   udp.Traffic Sent (Packets/Sec)   Traffic Sent (Packets/Sec)           UDP   bucket/default total/sum_time   linear   UDP   CPU.CPU Elapsed Time   CPU Elapsed Time           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.CPU Job Queue Length   CPU Job Queue Length           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.CPU Total Utilization (%)   CPU Total Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server Jobs   CPU.CPU Utilization (%)   CPU Utilization (%)           Server Jobs   !bucket/default total/time average   linear   Server Jobs   CPU.CPU Wait Time   CPU Wait Time           Server Jobs   bucket/default total/sum_time   linear   Server Jobs    CPU.Prioritized Job Queue Length   Prioritized Job Queue Length           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   tcp.Flight Size (bytes)   Flight Size (bytes)           TCP Connection   sample/default total   square-wave   TCP Connection   "tcp.Selectively ACKed Data (bytes)   Selectively ACKed Data (bytes)           TCP Connection   bucket/default total/max value   square-wave   TCP Connection   tcp.Send Delay (CWND) (sec)   Send Delay (CWND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP Connection   tcp.Send Delay (Nagle's) (sec)   Send Delay (Nagle's) (sec)           TCP Connection   bucket/default total/max value   linear   TCP Connection   tcp.Send Delay (RCV-WND) (sec)   Send Delay (RCV-WND) (sec)           TCP Connection   bucket/default total/max value   linear   TCP Connection   CPU.Completion Time   Completion Time           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job CPU Segment Size   Job CPU Segment Size           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job CPU Service Time   Job CPU Service Time           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Disk Operations   Job Disk Operations           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Disk Reads   Job Disk Reads           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Disk Writes   Job Disk Writes           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Memory Size   Job Memory Size           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Paging Hard Faults   Job Paging Hard Faults           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Paging Soft Faults   Job Paging Soft Faults           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Job Resident Set Size   Job Resident Set Size           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Jobs Active   Jobs Active           Server Jobs    bucket/default total/sample mean   linear   Server Jobs   CPU.Jobs Completed   Jobs Completed           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Jobs Created   Jobs Created           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Total Completion Time   Total Completion Time           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Total Jobs Completed   Total Jobs Completed           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Total Jobs Created   Total Jobs Created           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Total Memory Size   Total Memory Size           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Total Resident Set Size   Total Resident Set Size           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Completion Time   Disk Completion Time           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Interface Bus Requests   Disk Interface Bus Requests           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   "CPU.Disk Interface Bus Utilization   Disk Interface Bus Utilization           Server Jobs   !bucket/default total/time average   linear   Server Jobs   #CPU.Disk Interface Max Bus Requests   Disk Interface Max Bus Requests           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Max Queue Length   Disk Max Queue Length           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Operations Per Second   Disk Operations Per Second           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Queue Length   Disk Queue Length           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Reads Per Second   Disk Reads Per Second           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   $CPU.Disk Total Operations Per Second    Disk Total Operations Per Second           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Total Reads Per Second   Disk Total Reads Per Second           Server Jobs   bucket/default total/sum_time   linear   Server Jobs    CPU.Disk Total Writes Per Second   Disk Total Writes Per Second           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   CPU.Disk Utilization   Disk Utilization           Server Jobs   !bucket/default total/time average   linear   Server Jobs   CPU.Disk Writes Per Second   Disk Writes Per Second           Server Jobs   bucket/default total/sum_time   linear   Server Jobs   )application.Group Response Time (seconds)   Group Response Time (seconds)           $Requesting Server Custom Application   normal   discrete   Client Custom Application   (application.Traffic Received (bytes/sec)   Traffic Received (bytes/sec)           ACE   bucket/default total/sum_time   linear   ACE   *application.Traffic Received (packets/sec)   Traffic Received (packets/sec)           ACE   bucket/default total/sum_time   linear   ACE   $application.Traffic Sent (bytes/sec)   Traffic Sent (bytes/sec)           ACE   bucket/default total/sum_time   linear   ACE   &application.Traffic Sent (packets/sec)   Traffic Sent (packets/sec)           ACE   bucket/default total/sum_time   linear   ACE   CPU.Utilization (%)   Utilization (%)           CPU   !bucket/default total/time average   linear   resource    ip.Queuing Delay Deviation (sec)   Queue Delay Variation (sec)           IP Interface   sample/default total/   linear   IP Interface   &ip.Background Traffic Flow Delay (sec)   #Background Traffic Flow Delay (sec)           IP    bucket/default total/sample mean   linear   IP          machine type       server                 interface type      5ethernet:10BaseT,ethernet:100BaseT,ethernet:1000BaseX      6IP Host Parameters.Interface Information [<n>].Address      
IP Address   :IP Host Parameters.Interface Information [<n>].Subnet Mask      IP Subnet Mask       hub_tx_<n>_0   hub_rx_<n>_0            