DATA TEST;
INPUT ID Trail Sol1 Sol2 Growthrate;
DATALINES;
1      1       0.0     0.0      0.13
2      2       0.0     0.0      0.40
3      3       0.0     0.0      0.22
4      1       0.0     0.1      0.30
5      2       0.0     0.1      0.24
6      3       0.0     0.1      0.88
7      1       0.0     0.2      0.57
8      2       0.0     0.2      0.06
9      3       0.0     0.2      0.26
10      1       0.0     0.3      0.43
11      2       0.0     0.3      0.85
12      3       0.0     0.3      0.72
13      1       0.0     0.4      0.87
14      2       0.0     0.4      0.83
15      3       0.0     0.4      0.61
16      1       0.0     0.5      0.32
17      2       0.0     0.5      0.04
18      3       0.0     0.5      0.59
19      1       0.1     0.0      0.11
20      2       0.1     0.0      0.64
21      3       0.1     0.0      0.85
22      1       0.1     0.1      0.71
23      2       0.1     0.1      0.36
24      3       0.1     0.1      0.34
25      1       0.1     0.2      0.31
26      2       0.1     0.2      0.28
27      3       0.1     0.2      0.23
28      1       0.1     0.3      0.33
29      2       0.1     0.3      0.31
30      3       0.1     0.3      0.95
31      1       0.1     0.4      0.94
32      2       0.1     0.4      0.35
33      3       0.1     0.4      0.79
34      1       0.1     0.5      0.29
35      2       0.1     0.5      0.26
36      3       0.1     0.5      0.64
37      1       0.2     0.0      0.98
38      2       0.2     0.0      0.38
39      3       0.2     0.0      0.44
40      1       0.2     0.1      0.12
41      2       0.2     0.1      0.34
42      3       0.2     0.1      0.40
43      1       0.2     0.2      0.99
44      2       0.2     0.2      0.55
45      3       0.2     0.2      0.28
46      1       0.2     0.3      0.56
47      2       0.2     0.3      0.12
48      3       0.2     0.3      0.45
49      1       0.2     0.4      0.48
50      2       0.2     0.4      0.48
51      3       0.2     0.4      0.49
52      1       0.2     0.5      0.17
53      2       0.2     0.5      0.80
54      3       0.2     0.5      0.56
55      1       0.3     0.0      0.06
56      2       0.3     0.0      0.74
57      3       0.3     0.0      0.39
58      1       0.3     0.1      0.32
59      2       0.3     0.1      0.29
60      3       0.3     0.1      0.54
61      1       0.3     0.2      0.96
62      2       0.3     0.2      0.14
63      3       0.3     0.2      0.21
64      1       0.3     0.3      0.87
65      2       0.3     0.3      0.46
66      3       0.3     0.3      0.56
67      1       0.3     0.4      0.79
68      2       0.3     0.4      0.91
69      3       0.3     0.4      0.33
70      1       0.3     0.5      0.39
71      2       0.3     0.5      0.63
72      3       0.3     0.5      0.54
73      1       0.4     0.0      0.82
74      2       0.4     0.0      0.63
75      3       0.4     0.0      0.51
76      1       0.4     0.1      0.79
77      2       0.4     0.1      0.87
78      3       0.4     0.1      0.97
79      1       0.4     0.2      0.19
80      2       0.4     0.2      0.20
81      3       0.4     0.2      0.68
82      1       0.4     0.3      0.30
83      2       0.4     0.3      0.24
84      3       0.4     0.3      0.18
85      1       0.4     0.4      0.10
86      2       0.4     0.4      0.93
87      3       0.4     0.4      0.06
88      1       0.4     0.5      0.21
89      2       0.4     0.5      0.81
90      3       0.4     0.5      0.68
91      1       0.5     0.0      0.68
92      2       0.5     0.0      0.04
93      3       0.5     0.0      0.91
94      1       0.5     0.1      0.43
95      2       0.5     0.1      0.59
96      3       0.5     0.1      0.85
97      1       0.5     0.2      0.60
98      2       0.5     0.2      0.59
99      3       0.5     0.2      0.30
100      1       0.5     0.3      0.57
101      2       0.5     0.3      0.66
102      3       0.5     0.3      0.69
103      1       0.5     0.4      0.74
104      2       0.5     0.4      0.83
105      3       0.5     0.4      0.94
106      1       0.5     0.5      0.48
107      2       0.5     0.5      0.48
108      3       0.5     0.5      0.70
;
RUN;
PROC PRINT DATA=TEST NOOBS;
RUN;

PROC TABULATE DATA=TEST FORMAT=4.2;
   TITLE 'Growth Rate Table';
   LABEL SOL1='Solution 1 Concentration'
         SOL2='Solution 2 Concentration';
   CLASS SOL1 SOL2;
   VAR GROWTHRATE;
   TABLE SOL1, SOL2*GROWTHRATE=' '*MEAN=' ';
RUN;
PROC MEANS DATA=TEST MAXDEC=2 ;
VAR  SOL2 GROWTHRATE;
CLASS SOL1 ;
RUN;
/* CLASS-CLASS variables are used to categorize data. CLASS variables 
can be either character or numeric, but they should contain 
a limited number of discrete values that represent meaningful groupings. 
If a CLASS statement is used, then the N Obs statistic is calculated. 
The N Obs statistic is based on the CLASS variables*/

PROC SORT DATA=TEST OUT=WORK.TEST1;
BY SOL1;
RUN;
PROC MEANS DATA=TEST MAXDEC=2;
VAR  SOL2 GROWTHRATE;
BY SOL1 ;
RUN;
/*HERE the avtivity of both class and by statement is same except that for BY statement
 to use to sort the dataset using the by variable and  
If you don't specify an output data set by using the OUT= option,PROC SORT 
will overwrite your initial data set with the newly sorted observations.

 
You can use the NOPRINT option in the PROC MEANS statement to suppress the default report. 
For example, the following program creates only the output data set */
PROC CONTENTS DATA=TEST VARNUM;
RUN;
PROC UNIVARIATE DATA=TEST;
RUN;
/*If you placed a PRINT option in the PROC SUMMARY statement above,
 this program would produce the same report as if you replaced the word SUMMARY with MEANS.*/
 PROC SUMMARY DATA=TEST PRINT;
 VAR  SOL2 GROWTHRATE;
CLASS SOL1 ;
RUN;

PROC FREQ DATA=TEST;
 RUN;
 PROC FREQ DATA=TEST;
 TABLES GROWTHRATE;
 RUN;
 
 /*TABLES statement is used when we need PROC FREQ  for specified variables*/
 
  PROC FREQ DATA=TEST;
 TABLES GROWTHRATE / NOCUM;
 RUN;
 
 /*Adding NOCUM options in TABLE statement supress the display of
 cumulative frequency and cumulative percent */



