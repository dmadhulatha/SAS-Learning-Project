DATA WORK.INPUT;
INPUT Var1 $ Var2 $;
DATALINES;
A        one
A        two
B        three
C        four
A        five
;
RUN;
DATA WORK.ONE WORK.TWO;
  SET WORK.INPUT;
  IF Var1='A' THEN OUTPUT WORK.ONE;
  OUTPUT;
RUN;
PROC PRINT DATA=WORK.ONE;
PROC PRINT DATA=WORK.TWO;
RUN;
*When you use an OUTPUT statement without specifying a data set name, 
SAS writes the current observation to all data sets named in the DATA statement.
 If you want to write observations to a selected data set, then you specify that 
data set name directly in the OUTPUT statement.
 Any data set name appearing in the OUTPUT statement must also appear in the DATA statement.;

DATA WORK.ONE WORK.TWO;
  SET WORK.INPUT;
  IF Var1='A' THEN OUTPUT WORK.ONE;
  ELSE Var1='Other';
  IF Var1='Other' THEN PUT 'Mynote: Other than A ' _ALL_;
  OUTPUT;
RUN;

/* Mynote: Other than A Var1=Other Var2=three _ERROR_=0 _N_=3
 Mynote: Other than A Var1=Other Var2=four _ERROR_=0 _N_=4
These notes appear in the sas log and all variables including _N_ AND _ERROR_ will 
be displayed*/


DATA WORK.ONE WORK.TWO;
  SET WORK.INPUT;
  IF Var1='A' THEN OUTPUT WORK.ONE;
  ELSE Var1='Other';
  IF Var1='Other' THEN PUT 'Mynote: Other than A ' Var1= _N_=;
  OUTPUT;
RUN;
*similarly 
 Mynote: Other than A Var1=Other _N_=3
 Mynote: Other than A Var1=Other _N_=4;
 
DATA WORK.LOOP;
  X = 0;
  DO Index= 1 to 5  by  2;
    X = Index;
  END;
  OUTPUT;
run; 
PROC PRINT DATA=WORK.LOOP;
RUN;
 /*
Obs	X	Index
1	5	7
*/

DATA WORK.SALES;
INPUT SalesID $  SalesJan  FebSales  MarchAmt;
DATALINES;
W6790          50       400       350   800
W7693          25       100       125   250
W1387           .       300       250   550
;
RUN;
PROC PRINT DATA=WORK.SALES;
RUN;

DATA WORK.QTR1;
   SET WORK.SALES;
   ARRAY month{3} SalesJan FebSales MarchAmt;
   Qtr1 = sum(of month{*});
   /*Qtr1 = sum(of month{3}); This gives the results of third month only
   *Qtr1 = sum(of month_ALL_); this should be Qtr1 = sum(of month{*}_ALL_); and this doesnot 
   work here because the dataset have character variable
   *Qtr1 = month{1} + month{2} + month{3}; this give missing value for 3rd observation*/
RUN;
PROC PRINT DATA=WORK.QTR1;
RUN;


DATA WORK.TEMP;
  Char1='0123456789';
  Char2=SUBSTR(Char1,3,4);
RUN;
PROC PRINT DATA=WORK.TEMP;
RUN;
 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
