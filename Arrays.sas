DATA Fitness;
INPUT Name $ Weight1 Weight2 Weight3 Weight4 Weight5 Weight6;
DATALINES;
Alicia   69.6 69.5 68.6 67.5 66.7 66.2
Charles  75.4 74.6 73.5 72.9 72.0 71.5
Crista   55.7 58.8 56.8 55.8 54.9 54.0
Mike     88.6 87.5 88.3 87.4 86.4 85.2
Lisa     62.7 62.0 61.5 61.0 59.5 58.7
Ana      58.8 58.4 57.9 57.3 56.9 56.5
;
RUN;
PROC PRINT DATA=Fitness NOOBS;
RUN;

DATA FitinLBS;
     SET Fitness;
      ARRAY Fit(6) Weight1-Weight6;
        DO i=1 TO 6;
          Fit(i)=Fit(i)*2.2046;
        END;
RUN;
PROC PRINT DATA=FitinLBS;
RUN;

DATA FITNESS (DROP=i);
    SET Fitness;
      ARRAY FIT(6) Weight1-Weight6;
       DO i=1 TO DIM(FIT);
        FIT(i)=FIT(i)*2.2046;
       END;
RUN;
PROC PRINT DATA=FITNESS;
RUN;
* THE dLM FUNCTION returns the number of elements in the array SO NO NEED TO MENTION 
THE STOP IN THE DO STATEMENT IT WILL TAKE THE FINAL VARIABLE IN THE ARAY AUTOMATICALLY
LIKE IF STOP IS 6 THEN DLM IS 6 IF LAST VARIABLE IS 10 THEN DLM WILL BE 10;