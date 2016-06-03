/**********************************************/
// Modulation Curve Creation Utility
//
// This file is provided as part of the 
// SuiteTooth model suite developed by
// HIGHLAND SYSTEMS, INC.
//
// The SuiteTooth model suite incorporates
// code available in the public domain and
// other code that is the property of
// OPNET Technologies, Inc.
//
// Inquiries may be addressed to:
// 
// Highland Systems, Inc.
// (703) 312 0830
// info@highsys.com
// www.highsys.com
/**********************************************/



#include <opnet.h>
#include <ema.h>
#include <opnet_emadefs.h>
#include <opnet_constants.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX_FILE_NAME          20
#define MAX_KNOWN_PAIRS       100
#define EBNO_MIN_BUFFER        20
#define EBNO_MAX_BUFFER        10
#define MAX_DIGITS             52                   /* max mantissa digits for type double */
#define MAXLINE               120


main (int argc, char* argv [])
	{
	EmaT_Model_Id      model_id;
	int				   i, j;
	double			   iebno;				        /* interpolated ebno */
	double			   iber;				        /* interpolated BER */		         
	double             step;						/*step size for x values (Eb/No's) */
	double	           ebno_min;		            /* min Eb/No value in dB */
	double             ebno_max;
	int                max_index;                   /* number of x,y value pairs in arrays */
	double			   m, b;				        /* values for linear interpolation */
	char               inputFile[MAX_FILE_NAME];    /* input file for dvec_ebnos and dvec_ber points */
	char               outputModelName[MAX_FILE_NAME]; /* name of created model */
	FILE               *infile;                     /* pointer to inputFile */
	int                numPoints;                   /* number of points to include in output */
	int                numPairs;                    /* number of snr/ber pairs in input file */
	double		       dvec_bers  [MAX_KNOWN_PAIRS];/* ber points read from file */
    double		       dvec_ebnos [MAX_KNOWN_PAIRS];/* snr points read from file */
	int                comment_line = OPC_FALSE;	/* used as a boolean flag */
	char               ber_ascii[MAX_DIGITS];		/* temp location of ber in ascii */
	char               ebno_ascii[MAX_DIGITS];		/* temp location of ebno in ascii */
	char               line_buffer[MAXLINE];		/* line of input file */

	

	/****************************************
	* Initialize vector values
	****************************************/
	
	for (i = 0; i < MAX_KNOWN_PAIRS; i++)
	{
		dvec_bers  [i] = -1.0;
		dvec_ebnos [i] = -1.0;
	}

	printf("Enter SNR/BER data file: ");

	scanf ("%s", inputFile);

    printf("Enter output model name: ");

	scanf ("%s", outputModelName);

    infile = fopen(inputFile, "r");                  /* open input file, check for open error */
	if (infile == NULL) 
	{
		printf ("Can't open %s", inputFile);
		return(0);
	}

	printf ("Enter number of points to produce: ");

	scanf ("%d", &numPoints);

	i = 0;                                            /* initialize a counter of input values */

	while (i < MAX_KNOWN_PAIRS)                       /* read value pairs from file */
	{
		if (fgets(line_buffer, MAXLINE, infile) == NULL) /* break on end of file */
			break;
		/* '#' is a comment line delimiter, ignore empty lines */
		else if (line_buffer[0] == '#' || line_buffer[0] == ' ' || line_buffer[0] == '\n') 
			comment_line = OPC_TRUE;
		else
			comment_line = OPC_FALSE;

		if (!comment_line)                            /* read valid value pairs as ascii */
		{                                             /* convert to float, then typecast to double */
			/*fscanf (infile, "%s", ebno_ascii);*/
			sscanf (line_buffer, "%s%s", ber_ascii, ebno_ascii);
			dvec_bers[i] = (double)atof(ber_ascii);
			dvec_ebnos[i] = (double)atof(ebno_ascii);
			i++;
		}
	}


	max_index = i - 1;                               /* index of last read pair */
    printf ("%d value pairs read\n", i);

	ebno_min = dvec_ebnos[0] - EBNO_MIN_BUFFER;
	ebno_max = dvec_ebnos[max_index] + EBNO_MAX_BUFFER;

	step = (double)((ebno_max - ebno_min)/numPoints); /* calculate step value based on */

													  /* the min/max x values and # desired points */	
	/* initialize EMA package */
	Ema_Init (EMAC_MODE_ERR_PRINT, argc, argv);

	/* create an empty model */
	model_id = Ema_Model_Create (MOD_MODULATION);

	/* set the model level attributes */
	Ema_Model_Attr_Set (model_id,
		"ebno min",             COMP_CONTENTS, ebno_min,
		"ebno spacing",         COMP_CONTENTS, step,
		"ber",                  COMP_INTENDED, EMAC_DISABLED,
		EMAC_EOL);

	
	Ema_Model_Attr_Set (model_id, "ber", COMP_DVEC_SIZE, numPoints, EMAC_EOL); /* create BER attrib */


	for (i = 0; i < numPoints; i++)
		{
		iebno = ebno_min + i * step;			/* calculate ebno point */

 		if (iebno < dvec_ebnos [0])					
				iber = (double) 0.5;			/* if ebno is out of range low, assume max BER */
		else if (iebno > dvec_ebnos [max_index])
				iber = (double) 0.0;			/* if ebno is out of range high, assume zero BER */
		else
			{
			for (j = 0; j <= max_index; j++)	/* otherwise, interpolate between known BERs */
				{
				if (iebno == dvec_ebnos [j])	/* set if iebno equals lower post of any range */
					{
					iber = dvec_bers [j];
					break;
					}
				else if (iebno <= dvec_ebnos [j+1])	/* otherwise, define line between known points */
					{
					m = (log10(dvec_bers [j+1]) - log10(dvec_bers [j]))
						/ (dvec_ebnos [j+1] - dvec_ebnos [j]);
					b = log10(dvec_bers [j]) - m * dvec_ebnos [j];
			
					iber = pow(10, (m * iebno + b));			/* and compute iber */
					break;
					}
				} 
			}
			
		Ema_Model_Attr_Set (model_id, "ber", COMP_DVEC_CONTENTS(i), iber, EMAC_EOL);
		}


	/* write the model to application-readable form */
	Ema_Model_Write (model_id, outputModelName);

	}

