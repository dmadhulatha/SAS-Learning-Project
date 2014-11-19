DATA FINANCE;
INPUT Institution $ 1-13 Average Years;
DATALINES;
MNMA Bank    0.0817 5
Metro Bank   0.0814 3
Pecific Bank 0.0806 4
;
RUN;
PROC PRINT DATA=FINANCE;
RUN;
PROC CONTENTS DATA=FINANCE ;
RUN;
PROC CONTENTS DATA=FINANCE VARNUM;
RUN;
/* THE VARNUM statement used to get the variable names in the same order as exists in the datasets.
if VARNUM is not used then the variables in the content statement are displayed in the alphabetical 
order in the content statement*/

PROC MEANS DATA=FINANCE RANGE UCLM STDERR STD MIN MAX MEAN
 MODE MEDIAN NMISS N CSS CLM CV KURTOSIS SKEWNESS LCLM STDERR SUM SUMWGT	;
 RUN;
 * THESE ARE THE VARIOUS KEWORDS USED TO GET THE SELECTED VARIABLES DISPLAYED IN THE OUTPUT.
 If we enter the normal PROC MEAN STATEMENT then count min max and std deviation displays ;

