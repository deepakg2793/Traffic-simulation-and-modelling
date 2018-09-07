$title Transportation problem
*DEEPAK SHANKAR G (1214689567)assignment-1 

Set i /1*2/;
alias (i, j);

parameter a(i)/
1 100
2 200
/;

parameter b(j)/
1 150
2 150
/;

parameter c(i,j)/
1. 1   1
1. 2   2
2. 1   2
2. 2   2
/;

variable z;
positive variables  x(i,j);

equations
obj
demand(i)
supply(j)
;

obj.. z =e= sum((i,j),c(i,j)*x(i,j));
demand(i).. sum(j,x(i,j)) =e= a(i);
supply(j).. sum(i,x(i,j)) =e= b(j);

Model problem_2 /all/;
solve problem_2 using LP minimizing z;

display x.l;
display z.l;
