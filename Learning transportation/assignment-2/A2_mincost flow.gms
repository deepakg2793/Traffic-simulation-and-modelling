*minimum cost flow problem-2 assignment-2
*DEEPAK SHANKAR G (1214689567)

sets
 i node /1*4/
 alias (i,j);

parameter u(i,j) link capacity
/
1.2 500
1.3 900
2.3 700
3.2 400
2.4 600
3.4 1000/;

parameter w(i,j) cost
/
1.2 20
1.3 25
2.3 10
3.2 15
2.4 20
3.4 40/;

parameter
origin(i);
origin('1')=1;
parameter
destination(i);
destination('4')=1
parameter
inter_node(i);
inter_node(i)= (1-origin(i))*(1-destination(i));

variable
z
positive variable x(i,j);


equations
obj_function,
origin_flow,
Destination_flow,
inter_flow(i),
link_capacity;



obj_function.. z =e= sum((i,j)$(w(i,j)),w(i,j)*x(i,j));
origin_flow.. sum(j$(w('1',j)), x('1',j)) =e= 1200;
inter_flow(i)$(inter_node(i)=1).. sum(j$(w(i,j)), x(i,j))-sum(j$(w(j,i)), x(j,i))=e= 0;
Destination_flow.. sum(j$(w(j,'4')), x(j,'4'))=e= 1200;
link_capacity(i,j)$(u(i,j)>0.1).. x(i,j)=l=u(i,j);


Model minimum_costflow /all/ ;

solve minimum_costflow using LP minimizing z;

display x.l;
display z.l;

