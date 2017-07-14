/** Import an XLSX file.  **/

PROC IMPORT DATAFILE="/home/asaito10/AREC549/arec549_hw2 2016.xlsx"
		    OUT=example
		    DBMS=XLSX
		    REPLACE;
RUN;

/** Print the results. **/

PROC means data=example noprint maxdec=2;
	var income education;
	class country;
	output out=ex2
		   mean=avgincome evgeducation;
proc print data=ex2;
run;
/** how can I change the decimal of ex2? **/

proc print data=example; 
proc means data=example; run;

/** 13: creating two-way tables **/
proc format;
	value wtfmt 0-20='<20'
			  21-40='21-40'
			  41-60='41<';
	value htfmt 0-10='<10'
	 		   11-20='11<';
run;
proc freq data=example;
	tables medicalexpn*income;
	format medicalexpn wtfmt. income htfmt.;
run;

proc contents data=exaple;
run;
