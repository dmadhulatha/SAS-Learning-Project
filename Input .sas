/*When reading variable-length records that contain fixed-field data,
 you can avoid problems by using the PAD option in the INFILE statement.
 The PAD option pads each record with blanks so that all data lines have the same length*/


infile receipts pad;


*The PAD option is useful only when missing data occurs at the end 
of a record or when SAS encounters an end-of-record marker before 
all fields are completely read.
The default value of the maximum record length is determined by your operating system.
 If you encounter unexpected results when reading many variables, 
you might need to change the maximum record length by specifying the 
LRECL=option in the INFILE statement. For more information about the LRECL= option, 
see the SAS documentation for your operating environment;


/*'MISSOVER IS USED AT THE INFILE STATEMENT AND IT WORKS ONLY
 FOR MISSING VALUES AT THE END OF THE RECORD AND IT ASSIGNS PERIOD AT THE MISSING VALUES'*/
 infile creditcard missover;
 * delimiter sensitive data dsd is used at the infile statement 
to  sets the default delimiter to a comma
which treats two consecutive delimiters as a missing value and
 removes quotation marks from values.;
 infile creditcardcomma.dat dsd; 
 *The DSD option can also be used to read raw data when there is a missing value at
 the beginning of a record, as long as a delimiter precedes the first value in the record
You can also use the DSD and DLM= options to read fields that are delimited by blanks.;
infile credit5.dat dsd dlm=' ';
*you can use both the DSD option and the DLM= option in the INFILE statement.;


*Length statement should be used before the input statement
 variable that is defined in a LENGTH statement (if it precedes an INPUT statement) will appear
first in the data set, regardless of the order of the variables in the INPUT statement.;
length City $ 12;
 
 input Rank City & $12. 
         Pop86 : comma.;
         
*put and file statemens used to create raw data files from sas data sets;
data _null_; 
   set sasuser.finance; 
   file 'c:\data\findat2' dlm=','; 
   put ssn name salary date : date9.; 
run;
PROC EXPORT DATA=SAS-data-set;
OUTFILE=filename <DELIMITER='delimiter'>;
RUN;
*is another method to create raw datafile from sas datasets;