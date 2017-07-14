data clinic.stress;
	input ID Name $ restHR MaxHR RecHR Tolerance $ TotalTime SumSec TestLength $;
	datalines;
	2458 Murray,W 72 185 128 D 758 6158 Normal
	2539 LaMance,K 75 168 141 D 706 6864 Short
	2572 Oberon,M 74 177 138 D 731 7595 Short
	2574 Peterson,V 80 164 137 D 849 8444 Long
	2584 Takahashi,Y 76 163 135 D 967 9411 Long
	;
proc print data=clinic.stress; run;

/**Create accumulative value**/
data clinic.stress2;
	set clinic.stress;
	retain cumHR 10000;
	cumHR+recHR;
	
	/**label and format**/
	label cumHR='Cumulative total HR (+10000)'; 
	format cumHR comma6.;
	
	/**SELECT**/
	select (resthr);
		when (72) x=resthr*10;
		otherwise x=resthr;
	end;
	select (testlength);
		when ("Long") group="LLL";
		otherwise group="NP";
	end;
	select (group);
		when ("LLL") price=50;
	    otherwise put "Check unknown price:" group=; /**???* P.353*/
	end;
run;
proc print data=clinic.stress2 label;
run;

/**If statement**/
data clinic.stress3;
	set clinic.stress2;
	if resthr<75 then delete;
	length type $ 4;
	if totaltime>800 then type='gandam';
	else if 750<=totaltime<=800 then type='human';
	else if totaltime<750 then type='pokemon';
proc print data=clinic.stress3;
run;

	

data a;
	input y x;
	cards;
	10 2
	12 4
	8 6
	9 10
	4 12
	14 4
	18 8
	. 9
	19 3
	28 .
	;
run;
data b;
	set a;
	if x='.' then x=999;
	lagx=lag(x);
	cumx+x;
run;	
data b;
	merge b b(firstobs=2 rename=(x=leadx));
	
run;
proc print data=b;
run;
   
