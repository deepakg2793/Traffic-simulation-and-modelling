*Maximum flow problem-1 with virtual arc_assignment-2
*DEEPAK SHANKAR 1214689567

set i nodes /1*6/;
alias (i, j);

parameter w(i,j)
/
1.2 5
1.3 10
2.4 4
2.5 5
3.4 5
3.5 5
4.6 8
5.6 10
6.1 100 /;

variable z;
positive variable x(i,j);

equations
obj,
flow_bal(i),
link_capacity(i,j);

obj.. z =e= x('6','1');
flow_bal(i).. sum(j$(w(i,j)), x(i,j))-sum(j$(w(j,i)),x(j,i))=e= 0;
link_capacity(i,j)$(w(i,j)>0.1).. x(i,j)=l=w(i,j);

Model maximum_flow_problem2 /all/ ;

solve maximum_flow_problem2 using LP maximizing z;

display x.l;
display z.l;

