*warehouse customer problem-4 assignment-2
* deepak shankar 1214689567
set i facility /1*3/;
set j customer /1*4/;

parameter f(i) facility capacity
/
1 150
2 200
3 250
/;

parameter d(j) customer demand
/
1 70
2 230
3 100
4 150
/;

parameter c(i,j) cost per utility transported
/
1.1 4
1.2 5
1.3 7
1.4 8
2.1 5
2.2 3
2.3 5
2.4 9
3.1 6
3.2 5
3.3 6
3.4 7
/;

parameter o(i) operational cost
/
1 300
2 250
3 200
/;

variable z;
binary variable y(i);
positive variable x(i,j);

equations
obj,
demand(j),
supply(i),
warehouse(i);


obj..z=e= sum((i,j),c(i,j)*x(i,j))+sum(i,o(i)*y(i));
demand(j)..sum(i, x(i,j))=e= d(j);
supply(i)..sum(j, x(i,j))=l= f(i);
warehouse(i)..sum(j, x(i,j))- ((sum(j, d(j)))*y(i))=l= 0;


Model warehouse_customer /all/ ;

solve warehouse_customer using MIP minimizing z;

display x.l;
display z.l;
display y.l;



