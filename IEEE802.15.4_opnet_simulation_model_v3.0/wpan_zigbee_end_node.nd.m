MIL_3_Tfile_Hdr_ 1800 175B modeler 6 4AFAC7A0 56958B64 30 volta chaganti 0 0 none none 0 0 none 88895D31 42F0 0 0 0 0 0 0 468d 2                                                                                                                                                                                                                                                                                                                                                                                                ��g�      <   e   �  
  �  K  #�  /�  :�  :�  :�  @�  @�      ZigBee   802_15_4   sensor_node   wpan_zigbe_end_node����������������    .   R*********************************************************************************    /				IEEE 802.15.4/ZigBee OPNET Simulation Model   R**********************************************************************************       EAuthor: Petr Jurcik <petr@isep.ipp.pt> <jurcikp@control.felk.cvut.cz>   &Author: Anis Koubaa <aska@isep.ipp.pt>       Organization:   	IPP-HURRAY Research Group   	CISTER/ISEP   )	Polytechnic Institute of Porto, Portugal       Organization:   "	Department of Control Engineering   "	Faculty of Electrical Engineering   5	Czech Technical University in Prague, Czech Republic       Copyright (c) 2007 - 2009        �This file is part of IEEE 802.15.4/ZigBee OPNET Simulation Model for OPNET Modeler. IEEE 802.15.4/ZigBee OPNET Simulation Model can be used, copied and modified under the next licenses:   $  - GPL - GNU General Public License      !Code can be modified and re-distributed under any combination of the above listed licenses. If a contributor does not agree with some of the licenses, he/she can delete appropriate line. If you delete all lines, you are not allowed to distribute source code and/or binaries utilizing code.       R**********************************************************************************   7                           GNU General Public License         �IEEE 802.15.4/ZigBee OPNET Simulation Model is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software   SFoundation; either version 2 of the License, or (at your option) any later version.      IEEE 802.15.4/ZigBee OPNET Simulation Model is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.       �You should have received a copy of the GNU General Public License along with IEEE 802.15.4/ZigBee OPNET Simulation Model; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA        R*********************************************************************************/       General Node Functions:   -----------------------       QThe wpan_zigbee_end_node model represents a IEEE 802.15.4/ZigBee end node device.       <<Summary>>       General Function: WPAN Device       Supported Protocols: <None>      ZigBee ParametersMAC Address    �������    ����      ����   auto assigned          ����        ������         auto assigned   ��������         Short MAC address of the node.�Z             LoggingLog File Directory   �������   ����         c:\      ����      ����         c:\      c:\         TExisting directory path for storing an appropriate log file if a logging is enabled.�Z             LoggingEnable Logging   �������   ����          ����          ����          ����           �Z             ZigBee ParametersDevice Mode    �������    ����   0         
end device          ����          ����         
end device      ����       �Z             3ZigBee Parameters.Network ParametersParent Address    �������    ����      ����   	no parent          ����        ������         	no parent   ��������       �Z                   %Application TrafficBest Effort (CAP)      application layer.Best-effort����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                        <ZigBee Parameters.MAC ParametersBest Effort Buffer Capacity      ,mac layer.MAC Parameters [0].Buffer Capacity����    ����           ����          ����          ����                        0ZigBee Parameters.MAC ParametersCSMA Parameters      ,mac layer.MAC Parameters [0].CSMA Parameters����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       BaterryCurrent Draw      battery.Current Draw����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                        'Application TrafficDestination Address      )application layer.Destination MAC Address����    ����           ����          ����          ����                         1ZigBee Parameters.Network ParametersDevice Depth      network layer.Device Depth����    ����           ����          ����          ����                        BaterryInitial Energy      battery.Initial Energy����   ����               ����              ����              ����                         5ZigBee Parameters.Network ParametersMaximum Children      network layer.Maximum Children����    ����           ����          ����          ����                         2ZigBee Parameters.Network ParametersMaximum Depth      network layer.Maximum Depth����    ����           ����          ����          ����                         4ZigBee Parameters.Network ParametersMaximum Routers      network layer.Maximum Routers����    ����           ����          ����          ����                         :ZigBee Parameters.MAC ParametersNumber of Retransmissions      6mac layer.MAC Parameters [0].Number of Retransmissions����    ����           ����          ����          ����                        BaterryPower Supply      battery.Power Supply����   ����               ����              ����              ����                        #Application TrafficReal-Time (CFP)      application layer.Real-time����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                        (GTS ParametersReal-Time Buffer Capacity      ,mac layer.GTS Parameters [0].Buffer Capacity����    ����           ����          ����          ����                        GTS ParametersReceive GTS      (mac layer.GTS Parameters [0].Receive GTS����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                       3ZigBee Parameters.PHY ParametersTransmission Power      wireless_tx.channel [0].power����   ����               ����              ����              ����                        GTS ParametersTransmit GTS      )mac layer.GTS Parameters [0].Transmit GTS����   ����                                             count    �������    ����         ����          ����          ����           �Z             list   	�������   	����                                              �Z                        Best Effort (CAP)         
      disabled   
   Best Effort Buffer Capacity            �����      CSMA Parameters                     count    ���   
   ����   
      list   	���   
          
      Current Draw               MICAz      Destination Address              ����      Device Depth              ����      Initial Energy         @��        2 AA Batteries (1.5V, 1600 mAh)      Maximum Children             ����      Maximum Depth             ����      Maximum Routers             ����      Number of Retransmissions             ����      Power Supply         @         2 AA Batteries (3V)      Real-Time (CFP)         
      disabled   
   Real-Time Buffer Capacity            �����      Receive GTS               disabled      
TIM source            none      Transmission Power         @Y      ����      Transmit GTS               disabled      altitude         
@$      ����   
   altitude modeling            relative to subnet-platform      	condition            ����      financial cost            0.00      'mac layer.GTS Parameters [0].GTS Permit             ����      )mac layer.MAC Parameters [0].Beacon Order                15      #mac layer.MAC Parameters [0].PAN ID              ����      &mac layer.MAC Parameters [0].StartTime                 ����      -mac layer.MAC Parameters [0].Superframe Order                15      minimized icon            circle/#708090      phase                 ����      priority              ����      role         ����      user id              ����             ,   �   >          
   application layer   
       
   wpan_application_modified   
          	processor                   Best-effort   ���   	      disabled   	      Destination MAC Address    ���   	    ����   	      	Real-time   ���   	      disabled   	       F   �   �          
   network layer   
       
   wpan_network   
          	processor                   Device Depth    ���   	    ����   	      Maximum Children    ���   	   ����   	      Maximum Depth    ���   	   ����   	      Maximum Routers    ���   	   ����   	   	   N  R  R          
   wireless_rx   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A��    ����   
      packet formats   ���   
   wpan_frame_PPDU_format   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
   
   
       
   qpsk   
       ?�      ����                  ����             
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
          ra_rx                       nd_radio_receiver         O   �  R          
   wireless_tx   
       
            count    ���   
   ����   
      list   	���   
            	data rate   ���   
A��    ����   
      packet formats   ���   
   wpan_frame_PPDU_format   
      	bandwidth   ���   
@�@     ����   
      min frequency   ���   
@��     ����   
      power   ���   	@Y      ����   	   
   
       
   qpsk   
          dra_rxgroup             	dra_txdel          
   dra_closure   
          dra_chanmatch             
dra_tagain          
   dra_propdel   
          ra_tx                       nd_radio_transmitter          P  �   �          
   battery   
       
   wpan_battery   
          	processor                   Current Draw   ���   	      MICAz   	      R   �   �          
   	mac layer   
       
   wpan_mac   
          queue                   GTS Parameters   ���   
            count    ���   
   ����   
      list   	���   
            Receive GTS   ���   	      disabled   	      Transmit GTS   ���   	      disabled   	      
GTS Permit   ���   	    ����   	      Buffer Capacity    ���   	  �����   	   
   
      MAC Parameters   ���   
            count    ���   
   ����   
      list   	���   
            CSMA Parameters   ���   	            count    ���   
   ����   
      list   	���   
          
   	      Number of Retransmissions    ���   	   ����   	      Beacon Order    ���   	      15   	      Superframe Order    ���   	      15   	      PAN ID    ���   	    ����   	      	StartTime   ���   	        ����   	      Buffer Capacity    ���   	  �����   	   
   
   	       A   ,   F      �   A   �   �   
       
   STRM_FROM_APPL_TO_NWK   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          G   F   ,      �   �   �   F   
       
   STRM_FROM_NWK_TO_APPL   
       
   src stream [0]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          r   F   R      �   �   �   �   
       
   STRM_FROM_NWK_TO_MAC   
       
   src stream [1]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          s   R   F      �   �   �   �   
       
   STRM_FROM_MAC_TO_NWK   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream          �   R   O      �      �  H   
       
   STRM_FROM_MAC_TO_RADIO   
       
   src stream [1]   
       
   dest stream [0]   
          ����                  ����             ����                                           nd_packet_stream          �   N   R     H  G   �   �   
       
   STRM_FROM_RADIO_TO_MAC   
       
   src stream [0]   
       
   dest stream [1]   
          ����                  ����             ����                                           nd_packet_stream         �   O   R      �  F   �   �          
   tx_busy_stat   
       
   channel [0]   
       
   radio transmitter.busy   
       
   
instat [0]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire         �   N   R     L  F     �          
   rx_busy_stat   
       
   channel [0]   
       
   radio receiver.busy   
       
   
instat [1]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire         �   N   R     E  L   �             
   collision_rx   
       
   channel [0]   
       
   radio receiver.collision status   
       
   
instat [2]   
          ����                  ����             ����             ����              ����              ����          ԲI�%��}����          ԲI�%��}����             0����                                           nd_statistic_wire      [   �                        
   text_3   
       
      PHYSICAL LAYER   
          ����          
   ����   
           ����          
@n�     ����   
       
@vx     ����   
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
   shape_2   
       
    ����   
          ����             0����          
@n�     ����   
       
@u     ����   
       
@r�     ����   
       
@Q      ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                  
   shape_4   
       
    ����   
          ����             0����          
@z�     ����   
       
@cP     ����   
       
@Z�     ����   
       
@T@     ����   
          	annot_box             Annotation Palette          
E�s:����   
       ����                  ����       ����                 
   text_5   
       
      BATTERY MODULE   
          ����          
   ����   
           ����          
@z�     ����   
       
@`0     ����   
       
@Z�     ����   
       
@9      ����   
          
annot_text             Annotation Palette          
E�t'����   
       ����          
@�������   
               ����              ����           ����      machine type       WPAN            T�I�%��}   @      @  �   @�  @4                          ��      