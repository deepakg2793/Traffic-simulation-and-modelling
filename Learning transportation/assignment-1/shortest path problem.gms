*DEEPAK SHANKAR G (1214689567)assignment-1

sets
 i node /1*4/
 alias (i,j);

parameter w(i,j) travel time
/ 1.2 2
  1.3 1
  3.2 1
  2.4 3
  3.4 1
   /;
parameter
origin(i) st node;
origin('1')=1;
parameter
destination(i) end node;
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
intermediate_flow(i);

obj_function.. z =e= sum((i,j)$(w(i,j)),w(i,j)*x(i,j));
origin_flow.. sum(j$(w('1',j)), x('1',j)) =e= 1;
intermediate_flow(i)$(inter_node(i)=1).. sum(j$(w(i,j)), x(i,j))-sum(j$(w(j,i)), x(j,i))=e= 0;
Destination_flow.. sum(j$(w(j,'4')), x(j,'4'))=e= 1;

Model shortest_path_problem /all/ ;

solve shortest_path_problem using LP minimizing z;

display x.l;
display z.l;
