ods html body='/folders/myfolders/Result/data.html' 
		 contents='/folders/myfolders/Result/toc.html' 
		 frame='/folders/myfolders/Result/frame.html';
proc print data=SASHELP.AACOMP ;
run;
ods html close;
ods html;
 
ODS HTML BODY='/folders/myfolders/DATA.html';

LIBNAME TEXT '/folders/myfolders/';
DATA TEXT.TEST;
INPUT Exam $ Gender $ Year Score;
DATALINES;
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

ODS HTML BODY= '/folders/myfolders/Text.html';
PROC PRINT DATA=TEXT.TEST (obs=12);
RUN;

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


















