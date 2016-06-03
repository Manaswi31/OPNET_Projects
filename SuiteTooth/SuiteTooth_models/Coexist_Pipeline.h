/***********************************************/
// The SuiteTooth model set was developed by
// HIGHLAND SYSTEMS, INC.
//
// It incorporates code available in the public
// domain and other code that is the property of
// OPNET Technologies, Inc.
//
// Inquiries may be addressed to:
// 
// Highland Systems, Inc.
// (703) 312 0830
// info@highsys.com
// www.highsys.com
/***********************************************/

/************************************************/
/* Constants and other things needed in	the		*/
/* Coexistence Pipeline stages					*/
/************************************************/

#include "math.h"
#include "string.h"

/* Transceiver Types */
#define COEXIST_TR_TYPE_BLUETOOTH	1
#define COEXIST_TR_TYPE_WLAN		2

/* Custom TD attribute field adders */
#define COEXIST_FIELD_LIST_OF_ERRORS	1
#define COEXIST_ACTUAL_RX_POWER			2

/* Number of fields in the format information file */
#define FORMAT_FILE_FIELDS	9
/* Define ECC modes */
#define QUICK_CHECK			-1
#define	FEC_NONE			0
#define	FEC_2_3				2
#define	FEC_1_3				1

/* Define pathloss model types */
#define FREE_SPACE	0
#define INDOOR		1
#define CUSTOM		2


/* Define the format information structure */
typedef struct
{
	char		fmt_name[50];
	int			ecc_type;
	int			crc;
	int			preamble_bits;
	int			preamble_start_bit;
	int			preamble_end_bit;
	int			max_preamble_errors;
	int			header_bits;
	int         max_payload_errors;		
}	Format_Information;

