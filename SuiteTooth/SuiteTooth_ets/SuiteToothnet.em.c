/*******************************************************************************************/
//File: SuiteToothnet.em.c 
//Purpose:  This is the source code for the ema-created SuiteTooth network.  This code creates
//			a network with all accompianing maps, views, etc.  This network contains the
//			subnets and nodes that run the BlueTooth and WLAN protocols.  The user must pass  
//			command line string pairs as command line parameters.
//Author:  Steven Dukes
//Date:  12/31/2001
//Revisions:
//		5/12/03 updated for OPNET version 9.1 - KH
/*******************************************************************************************/


/* (change the symbolic constants below to customize model) */

#define MAX_PICONETS	100
#define MAX_SLAVES    7
#define MAX_WLANS	500


/* position arrays for nodes */
double	master_pos_x [MAX_PICONETS], master_pos_y [MAX_PICONETS], slave_pos_y[MAX_SLAVES*MAX_PICONETS], slave_pos_x[MAX_SLAVES*MAX_PICONETS];
double	wlan_pos_x [MAX_WLANS], wlan_pos_y [MAX_WLANS];


#include <opnet.h>
#include <ema.h>
#include <opnet_emadefs.h>
#include <opnet_constants.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

#define NONE 0
#define WLAN 1
#define AP_ROUTER 2
#define AP_SWITCH 3
#define STATION 4
#define STOCHASTIC 5


/* array for all textlist attributes in model final add */
Prg_List*		prg_lptr [46];

/* array for all textlist attributes in model */
VosT_Textlist*		tl_ptr [2];

/* array for all objects in model  final add */
EmaT_Object_Id		master_obj [MAX_PICONETS];
EmaT_Object_Id		slave_obj [MAX_SLAVES*MAX_PICONETS];
EmaT_Object_Id		wlan_obj [MAX_WLANS];
EmaT_Object_Id		actual_name_obj[MAX_SLAVES*MAX_PICONETS*25];
EmaT_Object_Id		wlan_actual_name_obj[MAX_WLANS*25];
EmaT_Object_Id		master_actual_name_obj[MAX_PICONETS*73];

EmaT_Object_Id		obj [100];

int
main (int argc, char* argv [])
	{
	EmaT_Model_Id			model_id;
	int					i;

	/* id objects for the major subnets */
	EmaT_Object_Id			top_subnet_obj, top_snview_obj, bluetooth_subnet, bluetooth_snview;
	EmaT_Object_Id			access_point_obj;
	EmaT_Object_Id			cloud_obj;
	EmaT_Object_Id			server_obj;
	EmaT_Object_Id			application_obj;
	EmaT_Object_Id			profile_obj;
	EmaT_Object_Id			wlan_server_obj;

	/* for internal use */
	int						j, k, l, m;
	int						num_wlans, num_piconets, num_slaves, access_point_type, traffic_type;
	float					master_slave_distance, piconet_distance, piconet_wlan_distance; 
    float					step_size, temp_distance, x_span_distance, y_span_distance, x_span_degrees, y_span_degrees;					
	
	/* vars to hold the numbers or strings to print to files */
	int						counter1, counter2;

	/* id objects for the links */
	EmaT_Object_Id			pos_start, pos_end, link_obj;
	EmaT_Object_Id			server_pos_start, server_pos_end, server_link_obj;

	/* strings for all the names of the objects, addresses, models, etc */
	char					slave_address_string [128], master_address_string [128], wlan_address_string [128], 
							slave_name_string [128], master_name_string [128], wlan_name_string [128],
							slave_icon_string [128], string1 [128], actual_name [128], slave_piconet_address_string [128];
	
	/* set up strings to make it easy to change the model names */
	char					slave_model_name [128] = "bt_slave_nd";
	char					master_model_name [128] = "bt_master_nd";
	char					wlan_model_name [128] = "";

	char					access_point_name [128], access_point_model [128], access_point_icon [128];
	
	/* read in the parameters from the command line.  There are several of them, and they */
	/* are input as a parameter name/value pair */
	/* Verify that the  arguments were passed. */
	if (argc < 17)
		{
		printf ("\nUsage: SuiteToothnet.i0.em.x piconets <num_piconets> slaves <num_slaves> master_slave_distance <distance>");
		printf ("\n                             piconet_distance <distance> wlans <num_wlans> piconet_wlan_distance <distance>");
		printf ("\n                             access_point_type <type>, traffic_type <type>");
		exit (-1);
		}

	/* init the variables for manual testing */
	num_wlans = 1;
	num_piconets = 1;
	num_slaves = 1;
	access_point_type = 1;
	master_slave_distance = 1;
	piconet_distance = 1;
	piconet_wlan_distance = 1; 
	access_point_type = NONE;
	traffic_type = STOCHASTIC;

	/* read in the values from the command line */
	num_piconets = atoi (argv [2]);
	num_slaves = atoi (argv [4]);
	master_slave_distance = atof (argv [6]);
	piconet_distance = atof (argv [8]);
	num_wlans = atoi (argv [10]);
	piconet_wlan_distance = atof (argv [12]); 
	
	/* determine which access point type is wanted. */
	if(!strcmp(argv[14], "none"))
	{
		access_point_type = NONE;
		strcpy(access_point_name, "none");
		strcpy(access_point_model, "none");
		strcpy(access_point_icon, "none");
	}
	else if(!strcmp(argv[14], "ap_router"))
	{
		access_point_type = AP_ROUTER;
		strcpy(access_point_name, "Router Access Point");
		strcpy(access_point_model, "coexist_wlan_ethernet_router_adv");
		strcpy(access_point_icon, "satellite_router");
	}
	else if(!strcmp(argv[14], "ap_switch"))
	{
		access_point_type = AP_SWITCH;
		strcpy(access_point_name, "Switch Access Point");
		strcpy(access_point_model, "coexist_wlan_eth_bridge_adv");
		strcpy(access_point_icon, "bridge_large");
	}

	/* determinet the traffic type */
	if(!strcmp(argv[16], "workstation"))
	{
		traffic_type = STATION;
		strcpy (wlan_model_name, "coexist_wlan_wkstn_adv");
	}
	else 
	{
		traffic_type = STOCHASTIC;
		strcpy (wlan_model_name, "coexist_wlan_station_adv");
	}


	/* print out the results of the command line read for testing */
	printf("\nnum_piconets = %d", num_piconets);
	printf("\nnum_slaves = %d", num_slaves);
	printf("\nm_s distance = %f", master_slave_distance);
	printf("\npiconet distance = %f", piconet_distance);
	printf("\nnum_wlans = %d", num_wlans);
	printf("\npic_wlan_distance = %f", piconet_wlan_distance);
	printf("\naccess_point_type = %d", access_point_type);
	printf("\ntraffic_type = %d", traffic_type);

	/* Initialize EMA package */
	Ema_Init (EMAC_MODE_ERR_PRINT, 0, VOSC_NIL);

	/* create an empty model */
	model_id = Ema_Model_Create (MOD_NETWORK);


	/* Create the subnet and view stack objects */
	top_subnet_obj = Ema_Object_Create (model_id, OBJ_NT_SUBNET_FIX);
	top_snview_obj = Ema_Object_Create (model_id, OBJ_NT_SUBNET_VIEW);
	bluetooth_subnet = Ema_Object_Create (model_id, OBJ_NT_SUBNET_FIX);
	bluetooth_snview = Ema_Object_Create (model_id, OBJ_NT_SUBNET_VIEW);

	/* Set the model level attributes */
	/* create and init textlist for external fileset */
	tl_ptr [0] = Vos_Textlist_Create ();
	/* create and init textlist for keywords.*/
	tl_ptr [1] = Vos_Textlist_Create ();

	/* set some model attributes */
	Ema_Model_Attr_Set (model_id,
		"ext fileset",          COMP_CONTENTS, tl_ptr [0],
		"keywords list",        COMP_CONTENTS, tl_ptr [1],
		"view subnet",          COMP_CONTENTS, bluetooth_subnet,
		EMAC_EOL);

	/* Assign attributes for object 'top_subnet_obj' */
	/* Note that these are the defalut values for the top subnet. */
	Ema_Object_Attr_Set (model_id, top_subnet_obj, 
		"name",                 COMP_CONTENTS, "top",
		"x span",               COMP_CONTENTS, (double) 360,
		"y span",               COMP_CONTENTS, (double) 180,
		"icon name",            COMP_CONTENTS, "subnet",
		"map",                  COMP_CONTENTS, "world",
		"subnet",               COMP_CONTENTS, EMAC_NULL_OBJ_ID,
		"view stack",           COMP_ARRAY_CONTENTS (0), top_snview_obj,
		"grid unit",            COMP_CONTENTS, 5,
		"grid division",        COMP_CONTENTS, (double) 15,
		"grid resolution",      COMP_CONTENTS, (double) 4,
		"grid min x",           COMP_CONTENTS, (double) -180,
		"grid min y",           COMP_CONTENTS, (double) 90,
		"grid style",           COMP_CONTENTS, 2,
		"grid color",           COMP_CONTENTS, 21,
		"ui status",            COMP_CONTENTS, 0,
		EMAC_EOL);



	/* assign attrs for object 'top_snview_obj' */
	Ema_Object_Attr_Set (model_id, top_snview_obj, 
		"min x",                COMP_CONTENTS, (double) -180,
		"min y",                COMP_CONTENTS, (double) 90,
		"sbar x",               COMP_CONTENTS, (double) 0,
		"sbar y",               COMP_CONTENTS, (double) 0,
		"grid step",            COMP_CONTENTS, (double) 15,
		"resolution",           COMP_CONTENTS, (double) 4,
		"grid style",           COMP_CONTENTS, 2,
		"grid color",           COMP_CONTENTS, 21,
		EMAC_EOL);


	/* Assign attributes for object 'USA_subnet' */
	Ema_Object_Attr_Set (model_id, bluetooth_subnet,  
		"name",                 COMP_CONTENTS, "Bluetooth Network",
		"x position",           COMP_CONTENTS, (double) -100,
		"y position",           COMP_CONTENTS, (double) 38.25,
		"icon name",            COMP_CONTENTS, "subnet",
		"map",                  COMP_CONTENTS, "none",
		"subnet",               COMP_CONTENTS, top_subnet_obj,
		"view stack",           COMP_ARRAY_CONTENTS (0), bluetooth_snview,
		"grid unit",            COMP_CONTENTS, 0,
		"grid division",        COMP_CONTENTS, (double) 2,
		"grid resolution",      COMP_CONTENTS, (double) 50,
		"grid min x",           COMP_CONTENTS, (double) 0,
		"grid min y",           COMP_CONTENTS, (double) 0,
		"grid style",           COMP_CONTENTS, 2,
		"grid color",           COMP_CONTENTS, 21,
		EMAC_EOL);

	Ema_Object_Attr_Set (model_id, bluetooth_subnet, 
		"ui status",            COMP_CONTENTS, 0,
		EMAC_EOL);


	/* assign attrs for object 'bluetooth_snview' */
	Ema_Object_Attr_Set (model_id, bluetooth_snview, 
		"min x",                COMP_CONTENTS, (double) 0,
		"min y",                COMP_CONTENTS, (double) 0,
		"sbar x",               COMP_CONTENTS, (double) 0,
		"sbar y",               COMP_CONTENTS, (double) 0,
		"grid step",            COMP_CONTENTS, (double) 2,
		"resolution",           COMP_CONTENTS, (double) 50,
		"grid style",           COMP_CONTENTS, 2,
		"grid color",           COMP_CONTENTS, 21,
		EMAC_EOL);




/***************************************************************************************************/
/* I need to dynamically size the subnet, so find the total area required by taking the sqare root */
/* of the number of piconets, then multiplying it by the piconet distance then add in a fudge      */
/* factor of the distance between the slave and  master on either side, then add in 10 more to     */
/* account for icon size.  The result is the length and width of the span in meters.  Convert this */
/* to a number of degrees, and this is the span.  Then set the span.	I also need to make sure   */
/* the wlans will fit in this space, do some calculations using wlan and see if it is greater.     */ 
/* If so, take the this value for y instead.  Add in one wlan distance into the y span since       */
/* wlans are always put in beneath the piconets.												   */
/*																								   */
/* circumference of earth at equator = 40,075,160 meters										   */
/* meters per degree of circumference = 40075160/360 =  111319.89 meters						   */
/***************************************************************************************************/


	/* add up total distance between piconets */
	temp_distance = sqrt(num_piconets) * piconet_distance;
	
	/* add in the slave distance on either side (two radius')*/
	temp_distance += master_slave_distance*2;

	/* add in icon fudge factor */
	temp_distance += 2;

	x_span_distance = temp_distance;
	y_span_distance = x_span_distance;

	printf("\nx and y before wlan test are:  %f, %f", x_span_distance, y_span_distance);

	/* add in one piconet to wlan distance to the y span because the wlans are always placed beneath the piconets */
	y_span_distance += piconet_wlan_distance+2;

	/* see if we need more room to account for extra wlans */
	temp_distance = sqrt(num_wlans) * piconet_distance;
	
	/* Check for more spacing due to extra number of wlans spaced evenly with the piconets */
	/* If needed, repeat the steps above with the new values */
	if(temp_distance > x_span_distance)
	{
		temp_distance += master_slave_distance;
		temp_distance += 2;
		x_span_distance = temp_distance;
		y_span_distance = x_span_distance;
		y_span_distance += piconet_wlan_distance+2;
	}



	printf("\nx and y before degree and after wlan test conversion are:  %f, %f", x_span_distance, y_span_distance);
	/* convert the distances into degrees , and account for the curvature of the earth */
	x_span_degrees = (x_span_distance/111319.89)* 1.25;
	y_span_degrees = (y_span_distance/111319.89);

	/* check to make sure that we have a minimum area on the screen */
	if(x_span_degrees < 0.00027384)
		x_span_degrees = 0.00027384;
	if(y_span_degrees < 0.000144)
		y_span_degrees = 0.000144;

	printf("\nx and y in degrees are:  %f, %f", x_span_degrees, y_span_degrees);

	/* set the span */
	Ema_Object_Attr_Set (model_id, bluetooth_subnet, 
		"y span",               COMP_CONTENTS, y_span_degrees,
		"x span",               COMP_CONTENTS, x_span_degrees,
		EMAC_EOL);


/************************************************************************************************/
//		Create the objects for the attributes for the various nodes in the network.  
//  	Set the attributes to their correct values
//
/************************************************************************************************/
	obj [4] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);// piconet address (mast?)
	obj [5] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);// server address
	obj [6] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [7] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);// piconet address(sl?)

	obj [8] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);//supported services

	obj [9] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);// not used

	obj [14] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);//App:dest prefs
	obj [15] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [16] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE); // "value" count?
	obj [17] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS); // count properties?
	obj [18] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [19] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [20] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [21] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [22] = Ema_Object_Create (model_id, OBJ_ATTR_DEF);
	obj [23] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);
	obj [24] = Ema_Object_Create (model_id, OBJ_ATTR_DEF);
	obj [25] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);
	obj [26] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);
	obj [27] = Ema_Object_Create (model_id, OBJ_ATTR_DEF);
	obj [28] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);
	obj [29] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [30] = Ema_Object_Create (model_id, OBJ_ATTR_DEF);
	obj [31] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);
	obj [32] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [33] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [34] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [35] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
	obj [36] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);

	obj [46] = Ema_Object_Create (model_id, OBJ_ATTR_PROPS);
	obj [47] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [48] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [49] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [50] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [51] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [52] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [53] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);
	obj [54] = Ema_Object_Create (model_id, OBJ_ATTR_SYMMAP);


	
	Ema_Object_Attr_Set (model_id, obj [4], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS, 1,
		"symbol map list",      COMP_INTENDED, EMAC_DISABLED,
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 0,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [5], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_STRING,
		"default value",        COMP_CONTENTS, "Auto Assigned",
		"symbol map list",      COMP_ARRAY_CONTENTS (0), obj [6],
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 3,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);

	/* assign attrs for object 'obj [6]' */
	Ema_Object_Attr_Set (model_id, obj [6], 
		"symbol",               COMP_CONTENTS, "Auto Assigned",
		"value",                COMP_CONTENTS_TYPE, EMAC_STRING,
		"value",                COMP_CONTENTS, "Auto Assigned",
		EMAC_EOL);

	Ema_Object_Attr_Set (model_id, obj [7], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS, 1,
		"symbol map list",      COMP_INTENDED, EMAC_DISABLED,
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 0,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [8], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_INTENDED, EMAC_DISABLED,
		"symbol map list",      COMP_INTENDED, EMAC_DISABLED,
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 5,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);





	Ema_Object_Attr_Set (model_id, obj [14], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS, obj [36],
		"symbol map list",      COMP_ARRAY_CONTENTS (0), obj [15],
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 5,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [17], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS_SYMBOL, "0",
		"symbol map list",      COMP_ARRAY_CONTENTS (0), obj [18],
		"symbol map list",      COMP_ARRAY_CONTENTS (1), obj [19],
		"symbol map list",      COMP_ARRAY_CONTENTS (2), obj [20],
		"symbol map list",      COMP_ARRAY_CONTENTS (3), obj [21],
		"flags",                COMP_CONTENTS, 17,
		"data type",            COMP_CONTENTS, 0,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);



	Ema_Object_Attr_Set (model_id, obj [23], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_STRING,
		"default value",        COMP_CONTENTS, "",
		"symbol map list",      COMP_INTENDED, EMAC_DISABLED,
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 3,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);



	Ema_Object_Attr_Set (model_id, obj [25], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_COMPOUND,
		"default value",        COMP_CONTENTS, obj [35],
		"symbol map list",      COMP_INTENDED, EMAC_DISABLED,
		"flags",                COMP_CONTENTS, 16,
		"data type",            COMP_CONTENTS, 5,
		"count properties",     COMP_CONTENTS, obj [26],
		"list attribute definitions",COMP_ARRAY_CONTENTS (0), obj [27],
		"list attribute definitions",COMP_ARRAY_CONTENTS (1), obj [30],
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [26], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS_SYMBOL, "0",
		"symbol map list",      COMP_INTENDED, EMAC_DISABLED,
		"flags",                COMP_CONTENTS, 17,
		"data type",            COMP_CONTENTS, 0,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);



	Ema_Object_Attr_Set (model_id, obj [28], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_STRING,
		"default value",        COMP_CONTENTS, "None",
		"symbol map list",      COMP_ARRAY_CONTENTS (0), obj [29],
		"flags",                COMP_CONTENTS, 144,
		"data type",            COMP_CONTENTS, 3,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		"handler library",      COMP_CONTENTS, "gna_active_attrib_handler",
		"click handler",        COMP_CONTENTS, "gna_actual_clsvr_name_get_click_handler",
		"new value handler",    COMP_CONTENTS, "",
		"confirm handler",      COMP_CONTENTS, "",
		"display handler",      COMP_CONTENTS, "",
		EMAC_EOL);



	Ema_Object_Attr_Set (model_id, obj [31], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS_SYMBOL, "10",
		"symbol map list",      COMP_ARRAY_CONTENTS (0), obj [32],
		"symbol map list",      COMP_ARRAY_CONTENTS (1), obj [33],
		"symbol map list",      COMP_ARRAY_CONTENTS (2), obj [34],
		"flags",                COMP_CONTENTS, 19,
		"data type",            COMP_CONTENTS, 0,
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [15], 
		"symbol",               COMP_CONTENTS, "None",
		"value",                COMP_CONTENTS_TYPE, EMAC_COMPOUND,
		"value",                COMP_CONTENTS, obj [16],
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [18], 
		"symbol",               COMP_CONTENTS, "0",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 0,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [19], 
		"symbol",               COMP_CONTENTS, "1",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 1,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [20], 
		"symbol",               COMP_CONTENTS, "2",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 2,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [21], 
		"symbol",               COMP_CONTENTS, "3",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 3,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [29], 
		"symbol",               COMP_CONTENTS, "None",
		"value",                COMP_CONTENTS_TYPE, EMAC_STRING,
		"value",                COMP_CONTENTS, "None",
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [32], 
		"symbol",               COMP_CONTENTS, "1",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 1,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [33], 
		"symbol",               COMP_CONTENTS, "5",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 5,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [34], 
		"symbol",               COMP_CONTENTS, "10",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 10,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [22], 
		"name",                 COMP_CONTENTS, "Symbolic Name",
		"properties",           COMP_CONTENTS, obj [23],
		"group",				COMP_CONTENTS, "0",
		EMAC_EOL);

	Ema_Object_Attr_Set (model_id, obj [24], 
		"name",                 COMP_CONTENTS, "Actual Name",
		"properties",           COMP_CONTENTS, obj [25],
		"group",				COMP_CONTENTS, "0",
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [27], 
		"name",                 COMP_CONTENTS, "Name",
		"properties",           COMP_CONTENTS, obj [28],
		"group",				COMP_CONTENTS, "0",
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [30], 
		"name",                 COMP_CONTENTS, "Selection Weight",
		"properties",           COMP_CONTENTS, obj [31],
		"group",				COMP_CONTENTS, "0",
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [16], 
		"count",                COMP_CONTENTS, 0,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [35], 
		"count",                COMP_CONTENTS, 0,
		EMAC_EOL);


	Ema_Object_Attr_Set (model_id, obj [36], 
		"count",                COMP_CONTENTS, 0,
		EMAC_EOL);



	Ema_Object_Attr_Set (model_id, obj [46], 
		"units",                COMP_CONTENTS, "",
		"default value",        COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"default value",        COMP_CONTENTS_SYMBOL, "Master will assign",
		"symbol map list",      COMP_ARRAY_CONTENTS (0), obj [47],
		"symbol map list",      COMP_ARRAY_CONTENTS (1), obj [48],
		"symbol map list",      COMP_ARRAY_CONTENTS (2), obj [49],
		"symbol map list",      COMP_ARRAY_CONTENTS (3), obj [50],
		"symbol map list",      COMP_ARRAY_CONTENTS (4), obj [51],
		"symbol map list",      COMP_ARRAY_CONTENTS (5), obj [52],
		"symbol map list",      COMP_ARRAY_CONTENTS (6), obj [53],
		"symbol map list",      COMP_ARRAY_CONTENTS (7), obj [54],
		"flags",                COMP_CONTENTS, 0,
		"data type",            COMP_CONTENTS, 0,
		EMAC_EOL);

	Ema_Object_Attr_Set (model_id, obj [46], 
		"count properties",     COMP_INTENDED, EMAC_DISABLED,
		"list attribute definitions",COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);


	/* assign attrs for object 'obj [7]' */
	Ema_Object_Attr_Set (model_id, obj [47], 
		"symbol",               COMP_CONTENTS, "Master will assign",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, -1,
		EMAC_EOL);


	/* assign attrs for object 'obj [8]' */
	Ema_Object_Attr_Set (model_id, obj [48], 
		"symbol",               COMP_CONTENTS, "Slave 0",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 0,
		EMAC_EOL);


	/* assign attrs for object 'obj [9]' */
	Ema_Object_Attr_Set (model_id, obj [49], 
		"symbol",               COMP_CONTENTS, "Slave 1",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 1,
		EMAC_EOL);


	/* assign attrs for object 'obj [10]' */
	Ema_Object_Attr_Set (model_id, obj [50], 
		"symbol",               COMP_CONTENTS, "Slave 2",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 2,
		EMAC_EOL);


	/* assign attrs for object 'obj [11]' */
	Ema_Object_Attr_Set (model_id, obj [51], 
		"symbol",               COMP_CONTENTS, "Slave 3",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 3,
		EMAC_EOL);


	/* assign attrs for object 'obj [12]' */
	Ema_Object_Attr_Set (model_id, obj [52], 
		"symbol",               COMP_CONTENTS, "Slave 4",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 4,
		EMAC_EOL);


	/* assign attrs for object 'obj [13]' */
	Ema_Object_Attr_Set (model_id, obj [53], 
		"symbol",               COMP_CONTENTS, "Slave 5",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 5,
		EMAC_EOL);


	/* assign attrs for object 'obj [14]' */
	Ema_Object_Attr_Set (model_id, obj [54], 
		"symbol",               COMP_CONTENTS, "Slave 6",
		"value",                COMP_CONTENTS_TYPE, EMAC_INTEGER,
		"value",                COMP_CONTENTS, 6,
		EMAC_EOL);





/****************************///////////////////////////////////**************************/		
/******* Create the destination preferences for the slaves *******************************/
	/* This is a very large loop.  We need to create 25 objects for each node */
	/* We offet by 25 each time around the loop. First, create the objects,	  */
	/* then set the attributes.	 We only loop if it is a split model.		  */					
	for(i=0; i<MAX_SLAVES*MAX_PICONETS; i++)
	{
		
		actual_name_obj[i*25] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+1] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+2] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+3] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+4] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+5] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+6] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+7] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+8] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+9] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+10] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+11] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+12] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+13] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+14] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+15] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+16] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+17] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+18] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+19] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+20] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+21] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+22] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		actual_name_obj[i*25+23] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		actual_name_obj[i*25+24] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
	
		/* assign attrs for object 'obj [50]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25], 
			"count",                COMP_CONTENTS, 8,
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+1],
			"list",                 COMP_ARRAY_CONTENTS (1), actual_name_obj[i*25+4],
			"list",                 COMP_ARRAY_CONTENTS (2), actual_name_obj[i*25+7],
			"list",                 COMP_ARRAY_CONTENTS (3), actual_name_obj[i*25+10],
			"list",                 COMP_ARRAY_CONTENTS (4), actual_name_obj[i*25+13],
			"list",                 COMP_ARRAY_CONTENTS (5), actual_name_obj[i*25+16],
			"list",                 COMP_ARRAY_CONTENTS (6), actual_name_obj[i*25+19],
			"list",                 COMP_ARRAY_CONTENTS (7), actual_name_obj[i*25+22],
			EMAC_EOL);


		/* assign attrs for object 'obj [52]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+2], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+3],
			EMAC_EOL);


		/* assign attrs for object 'obj [55]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+5], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+6],
			EMAC_EOL);


		/* assign attrs for object 'obj [58]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+8], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+9],
			EMAC_EOL);


		/* assign attrs for object 'obj [61]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+11], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+12],
			EMAC_EOL);


		/* assign attrs for object 'obj [64]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+14], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+15],
			EMAC_EOL);


		/* assign attrs for object 'obj [67]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+17], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+18],
			EMAC_EOL);


		/* assign attrs for object 'obj [70]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+20], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+21],
			EMAC_EOL);


		/* assign attrs for object 'obj [73]' */
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+23], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), actual_name_obj[i*25+24],
			EMAC_EOL);

		/* promoted attrs for object 'obj [51]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+1], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+1], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+1], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "FTP Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+2],
			EMAC_EOL);


		/* promoted attrs for object 'obj [53]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+3], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+3], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+3], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [54]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+4], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+4], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+4], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "HTTP Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+5],
			EMAC_EOL);


		/* promoted attrs for object 'obj [56]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+6], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+6], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+6], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);
	

		/* promoted attrs for object 'obj [57]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+7], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+7], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+7], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Remote Login Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+8],
			EMAC_EOL);


		/* promoted attrs for object 'obj [59]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+9], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+9], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+9], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [60]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+10], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+10], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+10], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Email Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+11],
			EMAC_EOL);


		/* promoted attrs for object 'obj [62]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+12], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+12], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+12], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [63]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+13], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+13], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+13], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Database Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+14],
			EMAC_EOL);


		/* promoted attrs for object 'obj [65]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+15], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+15], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+15], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [66]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+16], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+16], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+16], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Printer",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+17],
			EMAC_EOL);


		/* promoted attrs for object 'obj [68]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+18], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+18], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+18], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [69]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+19], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+19], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+19], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Video Destination",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+20],
			EMAC_EOL);


		/* promoted attrs for object 'obj [71]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+21], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+21], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+21], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);
	

		/* promoted attrs for object 'obj [72]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+22], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+22], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+22], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Voice Destination",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, actual_name_obj[i*25+23],
			EMAC_EOL);

		/* promoted attrs for object 'obj [74]' */
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+24], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, actual_name_obj[i*25+24], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+24], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);
	
	}





/****************************///////////////////////////////////**************************/		
/******* Create the destination preferences for the masters *******************************/
	/* This is a very large loop.  We need to create 25 objects for each node */
	/* We offet by 25 each time around the loop. First, create the objects,	  */
	/* then set the attributes.	 We only loop if it is a split model.		  */					
	for(i=0; i<MAX_PICONETS; i++)
	{
		
		master_actual_name_obj[i*73] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//10

		master_actual_name_obj[i*73+1] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//11
		master_actual_name_obj[i*73+2] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//12
		master_actual_name_obj[i*73+3] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//13 slave 0 
		master_actual_name_obj[i*73+4] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+5] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+6] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+7] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+8] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+9] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+10] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//14
		master_actual_name_obj[i*73+11] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//15
		master_actual_name_obj[i*73+12] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//16
		master_actual_name_obj[i*73+13] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+14] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+15] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+16] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+17] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+18] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+19] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//17
		master_actual_name_obj[i*73+20] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//18
		master_actual_name_obj[i*73+21] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//19
		master_actual_name_obj[i*73+22] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+23] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+24] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+25] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+26] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+27] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+28] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//20
		master_actual_name_obj[i*73+29] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//21
		master_actual_name_obj[i*73+30] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//22
		master_actual_name_obj[i*73+31] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+32] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+33] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+34] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+35] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+36] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+37] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//23
		master_actual_name_obj[i*73+38] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//24
		master_actual_name_obj[i*73+39] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//25
		master_actual_name_obj[i*73+40] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+41] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+42] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+43] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+44] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+45] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+46] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//26
		master_actual_name_obj[i*73+47] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//27
		master_actual_name_obj[i*73+48] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//28
		master_actual_name_obj[i*73+49] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+50] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+51] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+52] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+53] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+54] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+55] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//29
		master_actual_name_obj[i*73+56] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//30
		master_actual_name_obj[i*73+57] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//31
		master_actual_name_obj[i*73+58] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+59] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+60] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+61] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+62] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+63] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);

		master_actual_name_obj[i*73+64] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//32
		master_actual_name_obj[i*73+65] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);//33
		master_actual_name_obj[i*73+66] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);//34 slave 0
		master_actual_name_obj[i*73+67] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+68] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+69] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+70] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+71] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		master_actual_name_obj[i*73+72] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		
	
		/* assign attrs for object 'obj [50]' */
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73], 
			"count",                COMP_CONTENTS, 8,
			"list",                 COMP_ARRAY_CONTENTS (0), master_actual_name_obj[i*73+1],
			"list",                 COMP_ARRAY_CONTENTS (1), master_actual_name_obj[i*73+10],
			"list",                 COMP_ARRAY_CONTENTS (2), master_actual_name_obj[i*73+19],
			"list",                 COMP_ARRAY_CONTENTS (3), master_actual_name_obj[i*73+28],
			"list",                 COMP_ARRAY_CONTENTS (4), master_actual_name_obj[i*73+37],
			"list",                 COMP_ARRAY_CONTENTS (5), master_actual_name_obj[i*73+46],
			"list",                 COMP_ARRAY_CONTENTS (6), master_actual_name_obj[i*73+55],
			"list",                 COMP_ARRAY_CONTENTS (7), master_actual_name_obj[i*73+64],
			EMAC_EOL);


		for(j = 0; j<8; j++)
		{
			Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+2+(j*9)], 
				"count",                COMP_CONTENTS, num_slaves,
				EMAC_EOL);
		
			for(k = 0; k<num_slaves; k++)
			{
				Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+2+(j*9)], 
					"list",                 COMP_ARRAY_CONTENTS (k), master_actual_name_obj[i*73+3+(j*9)+k],
					EMAC_EOL);

				sprintf (actual_name, "slave%d", ((i*7) + k));
				/* promoted attrs for object 'obj [74]' */
				Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+3+(j*9)+k], 
					"Name", obj [28]);
				Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+3+(j*9)+k], 
					"Selection Weight", obj [31]);
				Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+3+(j*9)+k], 
					"Name",                 COMP_PROMOTE, EMAC_DISABLED,
					"Name",                 COMP_CONTENTS, actual_name,
					"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
					"Selection Weight",     COMP_CONTENTS, (int) 100/num_slaves,
					"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
					EMAC_EOL);
			}
		}





		/* promoted attrs for object 'obj [51]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+1], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+1], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+1], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "FTP Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+2],
			EMAC_EOL);




		/* promoted attrs for object 'obj [54]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+10], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+10], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+10], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "HTTP Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+11],
			EMAC_EOL);

	

		/* promoted attrs for object 'obj [57]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+19], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+19], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+19], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Remote Login Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+20],
			EMAC_EOL);




		/* promoted attrs for object 'obj [60]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+28], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+28], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+28], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Email Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+29],
			EMAC_EOL);


		/* promoted attrs for object 'obj [63]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+37], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+37], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+37], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Database Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+38],
			EMAC_EOL);




		/* promoted attrs for object 'obj [66]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+46], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+46], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+46], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Printer",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+47],
			EMAC_EOL);




		/* promoted attrs for object 'obj [69]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+55], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+55], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+55], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Video Destination",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+56],
			EMAC_EOL);


	

		/* promoted attrs for object 'obj [72]' */
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+64], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, master_actual_name_obj[i*73+64], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, master_actual_name_obj[i*73+64], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Voice Destination",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, master_actual_name_obj[i*73+65],
			EMAC_EOL);

	}




/****************************///////////////////////////////////**************************/		
/******* Create the destination preferences for the wlans *******************************/
	/* This is a very large loop.  We need to create 25 objects for each node */
	/* We offet by 25 each time around the loop. First, create the objects,	  */
	/* then set the attributes.	 We only loop if it is a split model.		  */					
	for(i=0; i<MAX_WLANS; i++)
	{
		
		wlan_actual_name_obj[i*25] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+1] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+2] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+3] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+4] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+5] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+6] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+7] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+8] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+9] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+10] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+11] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+12] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+13] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+14] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+15] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+16] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+17] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+18] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+19] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+20] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+21] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+22] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
		wlan_actual_name_obj[i*25+23] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_VALUE);
		wlan_actual_name_obj[i*25+24] = Ema_Object_Create (model_id, OBJ_ATTR_COMP_OBJ);
	
		/* assign attrs for object 'obj [50]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25], 
			"count",                COMP_CONTENTS, 8,
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+1],
			"list",                 COMP_ARRAY_CONTENTS (1), wlan_actual_name_obj[i*25+4],
			"list",                 COMP_ARRAY_CONTENTS (2), wlan_actual_name_obj[i*25+7],
			"list",                 COMP_ARRAY_CONTENTS (3), wlan_actual_name_obj[i*25+10],
			"list",                 COMP_ARRAY_CONTENTS (4), wlan_actual_name_obj[i*25+13],
			"list",                 COMP_ARRAY_CONTENTS (5), wlan_actual_name_obj[i*25+16],
			"list",                 COMP_ARRAY_CONTENTS (6), wlan_actual_name_obj[i*25+19],
			"list",                 COMP_ARRAY_CONTENTS (7), wlan_actual_name_obj[i*25+22],
			EMAC_EOL);


		/* assign attrs for object 'obj [52]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+2], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+3],
			EMAC_EOL);


		/* assign attrs for object 'obj [55]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+5], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+6],
			EMAC_EOL);


		/* assign attrs for object 'obj [58]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+8], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+9],
			EMAC_EOL);


		/* assign attrs for object 'obj [61]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+11], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+12],
			EMAC_EOL);


		/* assign attrs for object 'obj [64]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+14], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+15],
			EMAC_EOL);


		/* assign attrs for object 'obj [67]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+17], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+18],
			EMAC_EOL);


		/* assign attrs for object 'obj [70]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+20], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+21],
			EMAC_EOL);


		/* assign attrs for object 'obj [73]' */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+23], 
			"count",                COMP_CONTENTS_SYMBOL, "1",
			"list",                 COMP_ARRAY_CONTENTS (0), wlan_actual_name_obj[i*25+24],
			EMAC_EOL);

		/* promoted attrs for object 'obj [51]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+1], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+1], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+1], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "FTP Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+2],
			EMAC_EOL);


		/* promoted attrs for object 'obj [53]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+3], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+3], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+3], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [54]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+4], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+4], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+4], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "HTTP Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+5],
			EMAC_EOL);


		/* promoted attrs for object 'obj [56]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+6], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+6], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+6], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);
	

		/* promoted attrs for object 'obj [57]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+7], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+7], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+7], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Remote Login Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+8],
			EMAC_EOL);


		/* promoted attrs for object 'obj [59]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+9], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+9], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+9], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [60]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+10], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+10], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+10], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Email Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+11],
			EMAC_EOL);


		/* promoted attrs for object 'obj [62]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+12], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+12], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+12], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [63]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+13], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+13], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+13], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Database Server",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+14],
			EMAC_EOL);


		/* promoted attrs for object 'obj [65]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+15], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+15], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+15], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [66]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+16], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+16], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+16], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Printer",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+17],
			EMAC_EOL);


		/* promoted attrs for object 'obj [68]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+18], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+18], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+18], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);


		/* promoted attrs for object 'obj [69]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+19], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+19], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+19], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Video Destination",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+20],
			EMAC_EOL);


		/* promoted attrs for object 'obj [71]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+21], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+21], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+21], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);
	

		/* promoted attrs for object 'obj [72]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+22], 
			"Symbolic Name", obj [23]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+22], 
			"Actual Name", obj [25]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+22], 
			"Symbolic Name",        COMP_PROMOTE, EMAC_DISABLED,
			"Symbolic Name",        COMP_CONTENTS, "Voice Destination",
			"Actual Name",          COMP_PROMOTE, EMAC_DISABLED,
			"Actual Name",          COMP_CONTENTS, wlan_actual_name_obj[i*25+23],
			EMAC_EOL);

		/* promoted attrs for object 'obj [74]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+24], 
			"Name", obj [28]);
		Ema_Object_Prom_Attr_Set (model_id, wlan_actual_name_obj[i*25+24], 
			"Selection Weight", obj [31]);
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+24], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, "master",
			"Selection Weight",     COMP_PROMOTE, EMAC_DISABLED,
			"Selection Weight",     COMP_CONTENTS, 100,
			"Selection Weight",     COMP_INTENDED, EMAC_ENABLED,
			EMAC_EOL);
	
	}





/*******************************************************************************************************/
/********* Create the piconets with the slaves arranged in a circle around the master ******************/
/*******************************************************************************************************/

	for(i=0; i<num_piconets; i++)
	{
		master_obj [i] = Ema_Object_Create (model_id, OBJ_NT_NODE_MOBILE); 
	    /* Calulate the grid step size for arranging the nodes.  The grid area is about */ 
		/* 100 meters.  We want to array the piconets and wlans evenly in this area. */
//		step_size = 90 / sqrt((float)num_piconets);
		step_size = piconet_distance;
		master_pos_y [0] = master_slave_distance + 3; /* start down some to account for app and config objects */
		master_pos_x [0] = master_slave_distance + 1; /* start over some to allow for icon size   

		sprintf (actual_name, "slave%d", i*num_slaves);
		/* Create a position for the node in the grid */
		if(i)			/* if not first iteration, (first line is different) */
			master_pos_x [i] = master_pos_x[i-1] + step_size; /* increment by step size */

		if(master_pos_x[i] >= x_span_distance - master_slave_distance -1)	/* if we are at the edge of the grid, start from beginning */
		{
			master_pos_y [i] = master_pos_y[i-1] + step_size;  /* new line */
			master_pos_x [i] = master_slave_distance + 1;
		}
		else if (i)
			master_pos_y [i] = master_pos_y [i-1]; 

		/* create a new name for this master */
		sprintf (master_name_string, "MASTER_%d", i);
		sprintf (master_address_string, "master%d", i);
			
		/* Assign node attributes. */
		Ema_Object_Attr_Set (model_id, master_obj [i], 
			"name",			COMP_CONTENTS,	master_name_string,
			"x position",	COMP_CONTENTS,	master_pos_x[i],
			"y position",	COMP_CONTENTS,	master_pos_y[i],
//			"altitude",             COMP_CONTENTS, (double) 1,
//			"altitude",             COMP_INTENDED, EMAC_ENABLED,
			"model",		COMP_CONTENTS,	master_model_name,
			"icon name",    COMP_CONTENTS_SYMBOL, "wireless_laptop",
			"subnet",		COMP_CONTENTS,	bluetooth_subnet,
			EMAC_EOL);


		/* promoted attrs for object 'obj [3]' */
//		Ema_Object_Prom_Attr_Set (model_id, master_obj [i], 
//			"Application: Supported Service", obj [8]);
		Ema_Object_Prom_Attr_Set (model_id, master_obj [i], 
			"Piconet Address", obj [4]);
		Ema_Object_Prom_Attr_Set (model_id, master_obj [i], 
			"Server Address", obj [5]);
		Ema_Object_Attr_Set (model_id, master_obj [i], 
			"Piconet Address",      COMP_PROMOTE, EMAC_DISABLED,
			"Piconet Address",      COMP_CONTENTS, i,
			"Server Address",       COMP_PROMOTE, EMAC_DISABLED,
			"Server Address",       COMP_CONTENTS, master_address_string,
//			"Application: Supported Service",COMP_PROMOTE, EMAC_DISABLED,
//			"Application: Supported Service",COMP_CONTENTS_SYMBOL, "All",
			EMAC_EOL);

		/* promoted attrs for object 'obj [3]' */
		Ema_Object_Prom_Attr_Set (model_id, master_obj [i], 
			"Application: Destination Preferences", obj [14]);
		Ema_Object_Prom_Attr_Set (model_id, master_obj [i], 
			"Application: Supported Services", obj [8]);
		Ema_Object_Attr_Set (model_id, master_obj [i], 
			"Application: Supported Services",COMP_PROMOTE, EMAC_DISABLED,
			"Application: Supported Services",COMP_CONTENTS_SYMBOL, "All",
			"Application: Destination Preferences",COMP_PROMOTE, EMAC_DISABLED,
			"Application: Destination Preferences",COMP_CONTENTS, master_actual_name_obj [i*73],
			EMAC_EOL);



		/********** Create the slaves here **********************************************************************************/
		/* we need to access a new block of slave elements in the array for each main loop, so k starts at block boundaries */
		/********************************************************************************************************************/
		for(k=i*num_slaves; k<i*num_slaves+num_slaves; k++)
		{
			/* rotate slave icon types */
			if(k % 3 == 0)
				strcpy(slave_icon_string, "wireless_PDA");
			else if(k % 3 == 1)
				strcpy(slave_icon_string, "printer");
			else
				strcpy(slave_icon_string, "red_cellphone");

			slave_obj [k] = Ema_Object_Create (model_id, OBJ_NT_NODE_MOBILE); 
			
			/* create a new name for this slave */
			sprintf (slave_name_string, "SLAVE_%d_%d", i, k % num_slaves);
			sprintf (actual_name, "master%d", i);
			sprintf (slave_address_string, "slave%d", k);
			sprintf (slave_piconet_address_string, "Slave %d", k % num_slaves);

			/* figure out the coordinates for the slaves */
			slave_pos_x [k] = master_pos_x[i] + master_slave_distance * cos ((6.2830 * k+1) / num_slaves);
			slave_pos_y [k] = master_pos_y[i] + master_slave_distance * sin ((6.2830 * k+1) / num_slaves); 
			
			/* Assign node attributes. */
			Ema_Object_Attr_Set (model_id, slave_obj [k], 
				"name",			COMP_CONTENTS,	slave_name_string,
				"x position",	COMP_CONTENTS,	slave_pos_x [k],
				"y position",	COMP_CONTENTS,	slave_pos_y [k],
//				"altitude",             COMP_CONTENTS, (double) 1,
//				"altitude",             COMP_INTENDED, EMAC_ENABLED,
				"model",		COMP_CONTENTS,	slave_model_name,
				"icon name",    COMP_CONTENTS_SYMBOL, slave_icon_string,
				"subnet",		COMP_CONTENTS,	bluetooth_subnet,
				EMAC_EOL);

		
				/* promoted attrs for object 'obj [3]' */
			Ema_Object_Prom_Attr_Set (model_id, slave_obj [k], 
				"Slave Address", obj [46]);
			Ema_Object_Prom_Attr_Set (model_id, slave_obj [k], 
				"Application: Supported Services", obj [8]);
			Ema_Object_Prom_Attr_Set (model_id, slave_obj [k], 
				"Server Address", obj [5]);
			Ema_Object_Prom_Attr_Set (model_id, slave_obj [k], 
				"Application: Destination Preferences", obj [14]);
			Ema_Object_Prom_Attr_Set (model_id, slave_obj [k], 
				"Piconet Address", obj [7]);
			Ema_Object_Attr_Set (model_id, slave_obj [k], 
				"Piconet Address",      COMP_PROMOTE, EMAC_DISABLED,
				"Piconet Address",      COMP_CONTENTS, i,
				"Application: Destination Preferences",COMP_PROMOTE, EMAC_DISABLED,
				"Application: Destination Preferences",COMP_CONTENTS, actual_name_obj [i*25],
				"Server Address",       COMP_PROMOTE, EMAC_DISABLED,
				"Server Address",       COMP_CONTENTS, slave_address_string,
				"Application: Supported Services",COMP_PROMOTE, EMAC_DISABLED,
				"Application: Supported Services",COMP_CONTENTS_SYMBOL, "All",
				"Slave Address",        COMP_PROMOTE, EMAC_DISABLED,
				"Slave Address",        COMP_CONTENTS_SYMBOL, slave_piconet_address_string,
				EMAC_EOL);


			/* set up the objects for the destination preferences attribute */
			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+3], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+6], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+9], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+12], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+15], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+18], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+21], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, actual_name_obj[i*25+24], 
				"Name",                 COMP_PROMOTE, EMAC_DISABLED,
				"Name",                 COMP_CONTENTS, actual_name,
				EMAC_EOL);

		}


	}



/*******************************************************************************************************/
/********* Now create the WLANS arranged a certain distance from each respective piconet master ********/
/*******************************************************************************************************/


	for(i=0; i<num_wlans; i++)
	{
		wlan_obj [i] = Ema_Object_Create (model_id, OBJ_NT_NODE_MOBILE); 

		/* Calulate the grid step size for arranging the wlans.  They need to be spaced correctly from the piconet masters */
		step_size = piconet_distance;
		wlan_pos_y [0] = master_slave_distance + piconet_wlan_distance + 3;		
		wlan_pos_x [0] = master_slave_distance + 1;    /* start at the master location, and offset by wlan distance */
		
		/* Create a position for the node in the grid */
		if(i)			/* if not first iteration, (first line is different) */
			wlan_pos_x [i] = wlan_pos_x[i-1] + step_size; /* increment by step size */

		if(wlan_pos_x[i] >= x_span_distance - master_slave_distance -1)	/* if we are at the edge of the grid, start from beginning */
		{
			wlan_pos_y [i] = wlan_pos_y[i-1] + step_size;  /* new line */
			wlan_pos_x [i] = master_slave_distance + 1;
		}
		else if (i)
			wlan_pos_y [i] = wlan_pos_y [i-1]; 

		/* create a new name for this wlan */
		sprintf (wlan_name_string, "WLAN_%d", i);
		
		if(access_point_type == NONE)
			sprintf (actual_name, "server0");
		else
			sprintf (actual_name, "server0");
			

		if(traffic_type == STOCHASTIC)
		{
			/* Assign node attributes. */
			Ema_Object_Attr_Set (model_id, wlan_obj [i], 
				"name",			COMP_CONTENTS,	wlan_name_string,
				"x position",	COMP_CONTENTS,	wlan_pos_x[i],
				"y position",	COMP_CONTENTS,	wlan_pos_y[i],
//				"altitude",             COMP_CONTENTS, (double) 1,
//				"altitude",             COMP_INTENDED, EMAC_ENABLED,
				"model",		COMP_CONTENTS,	wlan_model_name,
				"icon name",    COMP_CONTENTS_SYMBOL, "terminal",
				"subnet",		COMP_CONTENTS,	bluetooth_subnet,
				EMAC_EOL);
		}
		else
		{
			/* Assign node attributes. */
			Ema_Object_Attr_Set (model_id, wlan_obj [i], 
				"name",			COMP_CONTENTS,	wlan_name_string,
				"x position",	COMP_CONTENTS,	wlan_pos_x[i],
				"y position",	COMP_CONTENTS,	wlan_pos_y[i],
//				"altitude",             COMP_CONTENTS, (double) 1,
//				"altitude",             COMP_INTENDED, EMAC_ENABLED,
				"model",		COMP_CONTENTS,	wlan_model_name,
				"icon name",    COMP_CONTENTS_SYMBOL, "wlan_wkstn",
				"subnet",		COMP_CONTENTS,	bluetooth_subnet,
				EMAC_EOL);
		}

			/* promoted attrs for object 'obj [3]' */
		Ema_Object_Prom_Attr_Set (model_id, wlan_obj [i], 
			"Application: Destination Preferences", obj [14]);
		Ema_Object_Attr_Set (model_id, wlan_obj [i], 
			"Application: Destination Preferences",COMP_PROMOTE, EMAC_DISABLED,
			"Application: Destination Preferences",COMP_CONTENTS, wlan_actual_name_obj [i*25],
			EMAC_EOL);

		/* set up the objects for the destination preferences attribute */
		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+3], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+6], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+9], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+12], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+15], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+18], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+21], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, wlan_actual_name_obj[i*25+24], 
			"Name",                 COMP_PROMOTE, EMAC_DISABLED,
			"Name",                 COMP_CONTENTS, actual_name,
			EMAC_EOL);



	}

	if(num_wlans != 0 && traffic_type != STOCHASTIC)
	{
		if(access_point_type == NONE)
		{
			wlan_server_obj = Ema_Object_Create (model_id, OBJ_NT_NODE_FIXED); 
			/* Assign node attributes. */
			Ema_Object_Attr_Set (model_id, wlan_server_obj, 
				"name",			COMP_CONTENTS,	"WLAN_Server",
				"x position",	COMP_CONTENTS,	8.0,
				"y position",	COMP_CONTENTS,	0.75,
				"model",		COMP_CONTENTS,	"coexist_wlan_server_adv",
				"icon name",    COMP_CONTENTS_SYMBOL, "wlan_server",
				"subnet",		COMP_CONTENTS,	bluetooth_subnet,
				EMAC_EOL);

			/* promoted attrs for object 'obj [3]' */
			Ema_Object_Prom_Attr_Set (model_id, wlan_server_obj, 
				"Server Address", obj [5]);
			Ema_Object_Prom_Attr_Set (model_id, wlan_server_obj, 
				"Application: Supported Services", obj [8]);
			Ema_Object_Attr_Set (model_id, wlan_server_obj, 
				"Application: Supported Services",COMP_PROMOTE, EMAC_DISABLED,
				"Application: Supported Services",COMP_CONTENTS_SYMBOL, "All",
				"Server Address",       COMP_PROMOTE, EMAC_DISABLED,
				"Server Address",       COMP_CONTENTS, "server0",
				EMAC_EOL);

		}
	
	}



/*******************************************************************************************************/
/********* Finally, put in an access point, app, and profile nodes ***********************/
/*******************************************************************************************************/

	application_obj = Ema_Object_Create (model_id, OBJ_NT_NODE_FIXED); 
	profile_obj = Ema_Object_Create (model_id, OBJ_NT_NODE_FIXED); 
	
	/* if no access point is wanted, do not create one */
	if(access_point_type != NONE)
	{
		access_point_obj = Ema_Object_Create (model_id, OBJ_NT_NODE_FIXED); 

		/* create an access point. */
		Ema_Object_Attr_Set (model_id, access_point_obj, 
			"name",			COMP_CONTENTS,	access_point_name,
			"x position",	COMP_CONTENTS,	6.0,
			"y position",	COMP_CONTENTS,	0.75,
			"model",		COMP_CONTENTS,	access_point_model,
			"icon name",    COMP_CONTENTS_SYMBOL, access_point_icon,
			"subnet",		COMP_CONTENTS,	bluetooth_subnet,
			EMAC_EOL);

		/* connect the access point to the rest of the world */
		cloud_obj = Ema_Object_Create (model_id, OBJ_NT_NODE_FIXED); 
		/* also create two position objects for link.             */
		link_obj	= Ema_Object_Create (model_id, OBJ_NT_PTDUP_LINK);
		pos_start	= Ema_Object_Create (model_id, OBJ_NT_POS);
		pos_end		= Ema_Object_Create (model_id, OBJ_NT_POS);
		server_link_obj	= Ema_Object_Create (model_id, OBJ_NT_PTDUP_LINK);
		server_pos_start	= Ema_Object_Create (model_id, OBJ_NT_POS);
		server_pos_end		= Ema_Object_Create (model_id, OBJ_NT_POS);

		/* now make the server, and connect it to the clouds */
		server_obj = Ema_Object_Create (model_id, OBJ_NT_NODE_FIXED); 

		/* Assign coordinates for the cloud to server link	*/
		/* on source and destination node positions.		*/
		Ema_Object_Attr_Set (model_id, server_pos_start, 
			"x",	COMP_CONTENTS,	(double)-111.5,
			"y",	COMP_CONTENTS,	(double)53,
			EMAC_EOL);

		Ema_Object_Attr_Set (model_id, server_pos_end, 
			"x",	COMP_CONTENTS,	(double)-71.4,
			"y",	COMP_CONTENTS,	(double)53,
			EMAC_EOL);

		/* assign coordinates for the access point->cloud link */
		/* assign attrs for object 'obj [25]' */
		Ema_Object_Attr_Set (model_id, pos_start, 
			"x",                    COMP_CONTENTS, (double) -111.75,
			"y",                    COMP_CONTENTS, (double) 55.5,
			EMAC_EOL);
		/* assign attrs for object 'obj [26]' */
		Ema_Object_Attr_Set (model_id, pos_end, 
			"x",                    COMP_CONTENTS, (double) -100,
			"y",                    COMP_CONTENTS, (double) 38.25,
			EMAC_EOL);

		


		Ema_Object_Attr_Set (model_id, server_obj, 
			"name",                 COMP_CONTENTS, "Server",
			"model",                COMP_CONTENTS, "fast_server",
			"x position",           COMP_CONTENTS, (double) -71.4,
			"y position",           COMP_CONTENTS, (double) 53,
			"TIM source",           COMP_CONTENTS, "ip",
			"TIM source",           COMP_INTENDED, EMAC_DISABLED,
			"icon name",            COMP_CONTENTS, "server",
			"subnet",               COMP_CONTENTS, top_subnet_obj,
			"alias",                COMP_INTENDED, EMAC_DISABLED,
			"tooltip",              COMP_CONTENTS, "Ethernet Server",
			"tooltip",              COMP_INTENDED, EMAC_DISABLED,
			"ui status",            COMP_CONTENTS, 0,
			EMAC_EOL);

				/* promoted attrs for object 'obj [3]' */
		Ema_Object_Prom_Attr_Set (model_id, server_obj, 
			"Server Address", obj [5]);
		Ema_Object_Prom_Attr_Set (model_id, server_obj, 
			"Application: Supported Services", obj [8]);
		Ema_Object_Attr_Set (model_id, server_obj, 
			"Application: Supported Services",COMP_PROMOTE, EMAC_DISABLED,
			"Application: Supported Services",COMP_CONTENTS_SYMBOL, "All",
			"Server Address",       COMP_PROMOTE, EMAC_DISABLED,
			"Server Address",       COMP_CONTENTS, "server0",
			EMAC_EOL);



		/* make the cloud type based on which access point type was used */
		if(access_point_type == AP_ROUTER)
		{ 
			/* assign attrs for the ip cloud */
			Ema_Object_Attr_Set (model_id, cloud_obj, 
				"name",                 COMP_CONTENTS, "Cloud",
				"model",                COMP_CONTENTS, "ethernet4_slip8_gtwy_adv",
				"user id",              COMP_CONTENTS, 0,
				"x position",           COMP_CONTENTS, (double) -111.5,
				"y position",           COMP_CONTENTS, (double) 53,
				"altitude",             COMP_CONTENTS, (double) 0,
				"priority",             COMP_CONTENTS, 0,
				"TIM source",           COMP_CONTENTS, "ip",
				"threshold",            COMP_CONTENTS, (double) 0,
				"icon name",            COMP_CONTENTS, "ip_cloud",
				"doc file",             COMP_CONTENTS, "nt_node",
				"subnet",               COMP_CONTENTS, top_subnet_obj,
				"alias",                COMP_INTENDED, EMAC_DISABLED,
				"tooltip",              COMP_CONTENTS, "",
				"ui status",            COMP_CONTENTS, 0,
				"altitude modeling",    COMP_CONTENTS, "relative to subnet-platform",
				EMAC_EOL);


			/* assign attrs for link object to connect from the cloud to the server */
			/* assign attrs for object 'obj [3187]' */
			Ema_Object_Attr_Set (model_id, server_link_obj, 
				"name",                 COMP_CONTENTS, "Cloud <-> Server",
				"model",                COMP_CONTENTS, "100BaseT",
				"transmitter a",        COMP_CONTENTS, "Cloud.eth_port_tx_1_0",
				"transmitter b",        COMP_CONTENTS, "Server.hub_tx_0_0",
				"receiver a",           COMP_CONTENTS, "Cloud.eth_port_rx_1_0",
				"receiver b",           COMP_CONTENTS, "Server.hub_rx_0_0",
				"data rate",            COMP_CONTENTS, (double) 100000000,
				"packet formats",       COMP_CONTENTS, "ethernet_v2",
				"txdel model",          COMP_CONTENTS, "eth_hub_txdel_bgutil",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, server_link_obj, 
				"txdel model",          COMP_INTENDED, EMAC_DISABLED,
				"propdel model",        COMP_CONTENTS, "dpt_propdel_bgutil",
				"error model",          COMP_CONTENTS, "error_zero_err",
				"ecc model",            COMP_CONTENTS, "ecc_zero_err",
				"color",                COMP_CONTENTS, 1082458112,
				"site a",               COMP_CONTENTS, cloud_obj,
				"site b",               COMP_CONTENTS, server_obj,
				"path",                 COMP_ARRAY_CONTENTS (0), server_pos_start,
				"path",                 COMP_ARRAY_CONTENTS (1), server_pos_end,
				"subnet",               COMP_CONTENTS, top_subnet_obj,
				"doc file",             COMP_CONTENTS, "",
				"tooltip",              COMP_CONTENTS, "Ethernet 100BaseT",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, server_link_obj, 
				"line style",           COMP_CONTENTS, "solid",
				"thickness",            COMP_CONTENTS, 1,
				"arrowheads",           COMP_CONTENTS, "head and tail",
				"symbol",               COMP_CONTENTS, "none",
				"ui status",            COMP_CONTENTS, 0,
				EMAC_EOL);
	
			/* assign attrs for link object to connect to the cloud*/
			/* assign attrs for object 'obj [3187]' */
			Ema_Object_Attr_Set (model_id, link_obj, 
				"name",                 COMP_CONTENTS, "Cloud <-> Bluetooth Network",
				"model",                COMP_CONTENTS, "100BaseT",
				"transmitter a",        COMP_CONTENTS, "Cloud.eth_port_tx_0_0",
				"transmitter b",        COMP_CONTENTS, "Bluetooth Network.Router Access Point.eth_port_tx_0_0",
				"receiver a",           COMP_CONTENTS, "Cloud.eth_port_rx_0_0",
				"receiver b",           COMP_CONTENTS, "Bluetooth Network.Router Access Point.eth_port_rx_0_0",
				"data rate",            COMP_CONTENTS, (double) 100000000,
				"packet formats",       COMP_CONTENTS, "ethernet_v2",
				"txdel model",          COMP_CONTENTS, "eth_hub_txdel_bgutil",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, link_obj, 
				"txdel model",          COMP_INTENDED, EMAC_DISABLED,
				"propdel model",        COMP_CONTENTS, "dpt_propdel_bgutil",
				"error model",          COMP_CONTENTS, "error_zero_err",
				"ecc model",            COMP_CONTENTS, "ecc_zero_err",
				"color",                COMP_CONTENTS, 1082458112,
				"site a",               COMP_CONTENTS, cloud_obj,
				"site b",               COMP_CONTENTS, bluetooth_subnet,
				"path",                 COMP_ARRAY_CONTENTS (0), pos_start,
				"path",                 COMP_ARRAY_CONTENTS (1), pos_end,
				"subnet",               COMP_CONTENTS, top_subnet_obj,
				"doc file",             COMP_CONTENTS, "",
				"tooltip",              COMP_CONTENTS, "Ethernet 100BaseT",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, link_obj, 
				"line style",           COMP_CONTENTS, "solid",
				"thickness",            COMP_CONTENTS, 1,
				"arrowheads",           COMP_CONTENTS, "head and tail",
				"symbol",               COMP_CONTENTS, "none",
				"ui status",            COMP_CONTENTS, 0,
				EMAC_EOL);

		}
		else
		{
			/* assign attrs for the cloud */
			Ema_Object_Attr_Set (model_id, cloud_obj, 
				"name",                 COMP_CONTENTS, "Cloud",
				"model",                COMP_CONTENTS, "ethernet16_bridge_adv",
				"user id",              COMP_CONTENTS, 0,
				"x position",           COMP_CONTENTS, (double) -111.5,
				"y position",           COMP_CONTENTS, (double) 53,
				"altitude",             COMP_CONTENTS, (double) 0,
				"priority",             COMP_CONTENTS, 0,
				"TIM source",           COMP_CONTENTS, "ip",
				"threshold",            COMP_CONTENTS, (double) 0,
				"icon name",            COMP_CONTENTS, "ip_cloud",
				"doc file",             COMP_CONTENTS, "nt_node",
				"subnet",               COMP_CONTENTS, top_subnet_obj,
				"alias",                COMP_INTENDED, EMAC_DISABLED,
				"tooltip",              COMP_CONTENTS, "",
				"ui status",            COMP_CONTENTS, 0,
				"altitude modeling",    COMP_CONTENTS, "relative to subnet-platform",
				EMAC_EOL);

			/* assign attrs for link object to connect from the cloud to the server */
			/* assign attrs for object 'obj [3187]' */
			Ema_Object_Attr_Set (model_id, server_link_obj, 
				"name",                 COMP_CONTENTS, "Cloud <-> Server",
				"model",                COMP_CONTENTS, "100BaseT",
				"transmitter a",        COMP_CONTENTS, "Cloud.hub_tx_0",
				"transmitter b",        COMP_CONTENTS, "Server.hub_tx_0",
				"receiver a",           COMP_CONTENTS, "Cloud.hub_rx_0",
				"receiver b",           COMP_CONTENTS, "Server.hub_rx_0",
				"data rate",            COMP_CONTENTS, (double) 100000000,
				"packet formats",       COMP_CONTENTS, "ethernet_v2",
				"txdel model",          COMP_CONTENTS, "eth_hub_txdel_bgutil",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, server_link_obj, 
				"txdel model",          COMP_INTENDED, EMAC_DISABLED,
				"propdel model",        COMP_CONTENTS, "dpt_propdel_bgutil",
				"error model",          COMP_CONTENTS, "error_zero_err",
				"ecc model",            COMP_CONTENTS, "ecc_zero_err",
				"color",                COMP_CONTENTS, 1082458112,
				"site a",               COMP_CONTENTS, cloud_obj,
				"site b",               COMP_CONTENTS, server_obj,
				"path",                 COMP_ARRAY_CONTENTS (0), server_pos_start,
				"path",                 COMP_ARRAY_CONTENTS (1), server_pos_end,
				"subnet",               COMP_CONTENTS, top_subnet_obj,
				"doc file",             COMP_CONTENTS, "",
				"tooltip",              COMP_CONTENTS, "Ethernet 100BaseT",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, server_link_obj, 
				"line style",           COMP_CONTENTS, "solid",
				"thickness",            COMP_CONTENTS, 1,
				"arrowheads",           COMP_CONTENTS, "head and tail",
				"symbol",               COMP_CONTENTS, "none",
				"ui status",            COMP_CONTENTS, 0,
				EMAC_EOL);

			
			/* assign attrs for link object to connect to the cloud*/
			/* assign attrs for object 'obj [3187]' */
			Ema_Object_Attr_Set (model_id, link_obj, 
				"name",                 COMP_CONTENTS, "Cloud <-> Bluetooth Network",
				"model",                COMP_CONTENTS, "100BaseT",
				"transmitter a",        COMP_CONTENTS, "Cloud.hub_tx_1",
				"transmitter b",        COMP_CONTENTS, "Bluetooth Network.Switch Access Point.eth_tx_1",
				"receiver a",           COMP_CONTENTS, "Cloud.hub_rx_1",
				"receiver b",           COMP_CONTENTS, "Bluetooth Network.Switch Access Point.eth_rx_1",
				"data rate",            COMP_CONTENTS, (double) 100000000,
				"packet formats",       COMP_CONTENTS, "ethernet_v2",
				"txdel model",          COMP_CONTENTS, "eth_hub_txdel_bgutil",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, link_obj, 
				"txdel model",          COMP_INTENDED, EMAC_DISABLED,
				"propdel model",        COMP_CONTENTS, "dpt_propdel_bgutil",
				"error model",          COMP_CONTENTS, "error_zero_err",
				"ecc model",            COMP_CONTENTS, "ecc_zero_err",
				"color",                COMP_CONTENTS, 1082458112,
				"site a",               COMP_CONTENTS, cloud_obj,
				"site b",               COMP_CONTENTS, bluetooth_subnet,
				"path",                 COMP_ARRAY_CONTENTS (0), pos_start,
				"path",                 COMP_ARRAY_CONTENTS (1), pos_end,
				"subnet",               COMP_CONTENTS, top_subnet_obj,
				"doc file",             COMP_CONTENTS, "",
				"tooltip",              COMP_CONTENTS, "Ethernet 100BaseT",
				EMAC_EOL);

			Ema_Object_Attr_Set (model_id, link_obj, 
				"line style",           COMP_CONTENTS, "solid",
				"thickness",            COMP_CONTENTS, 1,
				"arrowheads",           COMP_CONTENTS, "head and tail",
				"symbol",               COMP_CONTENTS, "none",
				"ui status",            COMP_CONTENTS, 0,
				EMAC_EOL);
		}

	}


	/* assign attrs for app config */
	Ema_Object_Attr_Set (model_id, application_obj,  
		"name",                 COMP_CONTENTS, "AppConfig",
		"model",                COMP_CONTENTS, "suitetooth_app_model",
		"x position",           COMP_CONTENTS, (double) 2,
		"y position",           COMP_CONTENTS, (double) 0.75,
		"icon name",            COMP_CONTENTS, "appl_config_obj",
		"doc file",             COMP_CONTENTS, "nt_fixed_node",
		"subnet",               COMP_CONTENTS, bluetooth_subnet,
		"alias",                COMP_INTENDED, EMAC_DISABLED,
		"tooltip",              COMP_CONTENTS, "Application Configuration",
		"ui status",            COMP_CONTENTS, 0,
		EMAC_EOL);



	Ema_Object_Attr_Set (model_id, profile_obj,  
		"name",                 COMP_CONTENTS, "ProfileConfig",
		"model",                COMP_CONTENTS, "suitetooth_profile_model",
		"x position",           COMP_CONTENTS, (double) 4,
		"y position",           COMP_CONTENTS, (double) 0.75,
		"icon name",            COMP_CONTENTS, "profile_config_obj",
		"doc file",             COMP_CONTENTS, "nt_fixed_node",
		"subnet",               COMP_CONTENTS, bluetooth_subnet,
		"alias",                COMP_INTENDED, EMAC_DISABLED,
		"tooltip",              COMP_CONTENTS, "Profile Configuration",
		"ui status",            COMP_CONTENTS, 0,
		EMAC_EOL);


	/* write the model to application-readable form */
	Ema_Model_Write (model_id, "SuiteToothnet");

	return 0;
	}

