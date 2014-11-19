DATA TEXT.SUB;
INPUT Subject $ Gender $ Year Score;
datalines;
Verbal m 2005 504 
Verbal f 2005 496
Verbal m 2006 504 
Verbal f 2006 497
Verbal m 2007 501
Verbal f 2007 497
Verbal m 2008 505 
Verbal f 2008 502
Verbal m 2009 507 
Verbal f 2009 503
Verbal m 2010 507 
Verbal f 2010 503
Verbal m 2011 509 
Verbal f 2011 502
Scince m 2005 521 
Scince f 2005 484
Scince m 2006 524 
Scince f 2006 484
Scince m 2007 523 
Scince f 2007 487
Scince m 2008 525 
Scince f 2008 490
Scince m 2009 527 
Scince f 2009 492
Scince m 2010 530 
Scince f 2010 494
Scince m 2011 531 
Scince f 2011 496
Math   m 2005 521 
Math   f 2005 484
Math   m 2006 524 
Math   f 2006 484
Math   m 2007 523 
Math   f 2007 487
Math   m 2008 525 
Math   f 2008 490
Math   m 2009 527 
Math   f 2009 492
Math   m 2010 530 
Math   f 2010 494
Math   m 2011 531 
Math   f 2011 496
;
RUN;
PROC PRINT DATA=TEXT.SUB;
RUN;

DATA Verbal;
    SET TEXT.SUB;
    IF Subject='Verbal';
RUN;
PROC PRINT DATE=Verbal NOOBS;
RUN;
DATA Scince;
    SET TEXT.SUB;
    IF Subject='Scince';
RUN;
PROC PRINT DATE=Scince NOOBS;
RUN;

DATA Math;
    SET TEXT.SUB;
    IF Subject='Math';
RUN;
PROC PRINT DATE=Math NOOBS;
RUN;
 
 
DATA CONCOT;
     SET  Verbal Scince Math;
RUN;

PROC PRINT DATA=CONCOT;
RUN;

*In CONCOTINATION we can combine two or more data sets and they 
are arranged one dataset after the other in order. If there are different variables present 
in each dataset then then also this process occur and they show blank spaces when the variable 
does not match ;

















DATA Test1;
    SET TEXT.TEST;
RUN;
PROC SORT DATA=Test1;
BY Gender;
RUN;
PROC PRINT DATA=Test1 NOOBS SPLIT='/';
LABEL Year='Academic/Year';
BY Gender;
RUN;
DATA Test2;
     SET TEXT.TEST; 
     IF Gender='m';
RUN;
PROC PRINT DATA=Test2;
RUN;

DATA Test3;
     SET TEXT.TEST;
     IF Gender='f';
RUN;
PROC PRINT DATA=Test3;
RUN;


DATA CONCOT;
     SET Test2 Test3;
RUN;
PROC PRINT DATA=CONCOT;
RUN;

