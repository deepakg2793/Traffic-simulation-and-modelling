*Maximum flow problem-1 assignment-2
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
5.6 10 /;

parameter origin(i);
origin('1')=1;

parameter destination(i);
destination('6')=1;

parameter inter(i);
inter(i)=(origin(i)-1)*(destination(i)-1);

variable z;
positive variable v,x(i,j);

equations
obj,
origin_node,
destination_node,
inter_node(i),
link_capacity(i,j);

obj.. v =e= z;
origin_node.. sum(j$(w('1',j)), x('1',j))=e= v;
destination_node.. sum(j$(w(j,'6')), x(j,'6'))=e= v;
inter_node(i)$(inter(i)=1).. sum(j$(w(i,j)), x(i,j))-sum(j$(w(j,i)),x(j,i))=e= 0;
link_capacity(i,j)$(w(i,j)>0.1).. x(i,j)=l=w(i,j);

Model maximum_flow_problem /all/ ;

solve maximum_flow_problem using LP maximizing z;

display x.l;
display v.l;
display z.l;

