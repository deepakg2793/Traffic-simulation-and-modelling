*integer program_assignment-2
*deepak shankar 1214689567

variable
z
integer variable x1,x2;

equation
obj
equ1
equ2;

obj..(3*x1)+(4*x2)=e=Z;
equ1..x1+(2*x2)=l=10;
equ2..(2.5*x1)+x2=l=12;

Model linear_programming / all /;

solve linear_programming using mip maximizing   z;

display x1.l, x2.l, z.l;
