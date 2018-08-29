$title city-airport-passenger problem
sets
   i city /1*2/
   j airport /1*2/;

parameter a(i)
/
1 100
2 200 /;

parameter b(j)
/
  1 150
  2 150 /;

parameter c(i,j)
/
1.1 10
1.2 10
2.1 5
2.2 5
/;

variable

x(i,j) passenger travelling from city to airport
z objective function;

 positive variable x;

equation
obj
demand(i)
supply(j);

obj..z=e=sum((i,j),c(i,j)*x(i,j));
demand(i)..sum((j),x(i,j))=e=a(i);
supply(j)..sum((i),x(i,j))=e=b(j);

Model opt_1 / all /;

solve opt_1 using lp maximizing   z;

display x.l,z.l;
