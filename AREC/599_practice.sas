/** Import an XLSX file.  **/

PROC IMPORT DATAFILE="/home/asaito10/AREC549/hw1_table1.1.xlsx"
		    OUT=practice
		    DBMS=XLSX
		    REPLACE;
RUN;


proc print data=practice;
title 'no ristriction';
run;

proc print data=practice;
      where y>1000;
	  format y dollar5.0;
	  title 'for y>1000' ;
run;

proc print data=practice;
	  where y>1000;
	  format y dollar5.0;
	  where y<1000;
	  format y comma4.0;
	  title 'for y>1000 and y<1000';
run;



data=new set=practice;
Z=y;
	 if y>1000 then Z=" ";
	 
proc print data=new label;
	 
	 
	 var Z l k;
     label Z=Y;
run;     
   
	 
