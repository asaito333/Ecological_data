proc iml;
n=5; /*n=samplesize*/
m=1000; /*m is number of replications*/
y=j(n,1,0); x=j(n,1,0); meanx5=j(m,1,0); /*meanx5 contains m sample means of x*/
Do j=1 to m;
		Do i=1 to n;
			y[i]=ranuni(2000);
			x[i]=10*y[i];
		end;
	samplemean=mean(x);
	meanx5[j]=samplemean;
end;
print meanx5;
create sushi var{meanx5};append;


proc iml;
n=10; /*n=samplesize*/
m=1000; /*m is number of replications*/
y=j(n,1,0); x=j(n,1,0); meanx10=j(m,1,0); /*meanx10 contains m sample means of x*/
Do j=1 to m;
		Do i=1 to n;
			y[i]=ranuni(2000);
			x[i]=10*y[i];
		end;
	samplemean=mean(x);
	meanx10[j]=samplemean;
end;
print meanx10;
create ramen var{meanx10};append;

proc iml;
n=100; /*n=samplesize*/
m=1000; /*m is number of replications*/
y=j(n,1,0); x=j(n,1,0); meanx100=j(m,1,0); /*meanx100 contains m sample means of x*/
Do j=1 to m;
		Do i=1 to n;
			y[i]=ranuni(2000);
			x[i]=10*y[i];
		end;
	samplemean=mean(x);
	meanx100[j]=samplemean;
end;
print meanx100;
create katsu var{meanx100};append;

data all; merge sushi ramen katsu;
sigmasq=100/12;
z5=(meanx5-5)/((sigmasq/5)**.5);
z10=(meanx10-5)/((sigmasq/5)**.5);
z100=(meanx100-5)/((sigmasq/5)**.5);

proc means;
run;

proc sgplot data=all;
title "hw4 histogram for all xbar";
histogram meanx5/transparency=.5
			legendlabel="n=5";
histogram meanx10/transparency=.5
			legendlabel="n=10";
histogram meanx100/transparency=.5
			legendlabel="n=100";
density meanx5;
density meanx10;
density meanx100;
run;

proc sgplot data=all;
title "hw4 histogram for all zbar";
histogram z5/transparency=.5
			legendlabel="n=5";
histogram z10/transparency=.5
			legendlabel="n=10";
histogram z100/transparency=.5
			legendlabel="n=100";
density z5;
density z10;
density z100;
run;






