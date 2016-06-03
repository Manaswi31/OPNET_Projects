

File format:  internal execution

Library:			suitetooth_event_handler.so
Event handler:		SuiteTooth_event_handler
Modal:			disabled
Title:			"SuiteTooth parameters"
X offset:			50
Y offset:			250



############### Data Fields ####################################

start_control
	type:			field
	id:			piconet_field
	left:			230
	top:			20
	width:		140
	height:		20
	line_count:		1
end_control

start_control
	type:			field
	id:			slave_field
	left:			230
	top:			50
	width:		140
	height:		20
	line_count:		1
end_control

start_control
	type:			field
	id:			master_slave_distance_field
	left:			230
	top:			80
	width:		140
	height:		20
	line_count:		1
end_control

start_control
	type:			field
	id:			piconet_distance_field
	left:			230
	top:			110
	width:		140
	height:		20
	line_count:		1
end_control

start_control
	type:			field
	id:			wlan_field
	left:			230
	top:			140
	width:		140
	height:		20
	line_count:		1
end_control

start_control
	type:			field
	id:			piconet_wlan_distance_field
	left:			230
	top:			170
	width:		140
	height:		20
	line_count:		1
end_control

start_control
	type:			field
	id:			scenario_name_field
	left:			230
	top:			200
	width:		140
	height:		20
	line_count:		1
end_control




####### Radio Buttons ##########################################

start_control
	type:			radio
	id:			none_radio
	left:			10
	top:			250
	width:		90
	height:		20
	label:		"None"
	group:		"radio buttons"
	options:		default
end_control


start_control
	type:			radio
	id:			wlan_radio
	left:			10
	top:			300
	width:		90
	height:		20
	label:		"Stochastic"
	group:		"radio buttons1"
end_control


start_control
	type:			radio
	id:			station_radio
	left:			140
	top:			300
	width:		90
	height:		20
	label:		"Workstation"
	group:		"radio buttons1"
end_control

start_control
	type:			radio
	id:			ap_router_radio
	left:			270
	top:			250
	width:		110
	height:		20
	label:		"AP-Router"
	group:		"radio buttons"
end_control


start_control
	type:			radio
	id:			ap_switch_radio
	left:			140
	top:			250
	width:		140
	height:		20
	label:		"AP-Switch"
	group:		"radio buttons"
end_control



########################## Labels for the fields ##########################
start_control
	type:			label
	id:			piconet_label
	left:			10
	top:			20
	width:		140
	height:		20
	label:		"Number of Piconets in the Network"
end_control

start_control
	type:			label
	id:			slave_label
	left:			10
	top:			50
	width:		140
	height:		20
	label:		"Number of Slaves per Piconet"
end_control

start_control
	type:			label
	id:			master_slave_distance_label
	left:			10
	top:			80
	width:		140
	height:		20
	label:		"Distance(m) Between Master and Slave"
end_control

start_control
	type:			label
	id:			piconet_distance_label
	left:			10
	top:			110
	width:		140
	height:		20
	label:		"Distance(m) Between Piconets"
end_control

start_control
	type:			label
	id:			wlan_label
	left:			10
	top:			140
	width:		140
	height:		20
	label:		"Number of WLANs in the Network"
end_control

start_control
	type:			label
	id:			piconet_wlan_distance_label
	left:			10
	top:			170
	width:		140
	height:		20
	label:		"Distance(m) Between Piconets and WLANs"
end_control

start_control
	type:			label
	id:			scenario_name_label
	left:			10
	top:			200
	width:		140
	height:		20
	label:		"SuiteTooth Project Scenario Name"
end_control

start_control
	type:			label
	id:			access_point_type_label
	left:			100
	top:			230
	width:		140
	height:		20
	label:		"WLAN Network Access Point Type"
end_control

start_control
	type:			label
	id:			traffic_type_label
	left:			10
	top:			280
	width:		250
	height:		20
	label:		"                                            WLAN Traffic Type"
end_control

start_control
	type:			label
	id:			data_error_label
	left:			10
	top:			355
	width:		280
	height:		20
	label:		" "
end_control

start_control
	type:			label
	id:			data_error_label1
	left:			10
	top:			370
	width:		280
	height:		20
	label:		" "
end_control



############ ok and cancel buttons #############################

start_control
	type:			button
	id:			ok_button
	left:			10
	top:			410
	width:		140
	height:		24
	label:		"Build SuiteTooth Model"
end_control


start_control
	type:			button
	id:			cancel_button
	left:			230
	top:			410
	width:		140
	height:		24
	label:		"Exit SuiteTooth Wizard"
end_control



