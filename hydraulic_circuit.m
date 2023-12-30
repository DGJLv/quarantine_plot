%%
clear; clc

p0=1;
R0=3.5;
R1=4.5;
R2=5.0;
R3=6.5;
R4=4.5;
R5=3.5;
R6=4.0;
R7=12;
R8=2.5;
Rv1=3.5;
Rv2=3.5;
Rv3=3.5;
Q=input("What is initial flow rate Q(m^3*h^-1)?")
%Q=(p1-pJ1)/R1
%Q4=(pJ1-pJ2)/R4
%Q4=(pJ2-p0)/(R5+Rv(2)+R6)+(pJ2-p0)/(R7+Rv(3)+R8)
%Q-Q4=Q1
%Q4=Q2+Q3
%19.5pJ1-15pJ2=4.5+67.5Q
%-198pJ1+328.5pJ2=130.5
A=[19.5 -15;-198 328.5;];
B=[67.5*Q+4.5 130.5]';
C=A\B;
pJ1=C(1);
pJ2=C(2);
Q1=(pJ1-p0)/(R2+Rv1+R3);
Q2=(pJ2-p0)/(R5+Rv2+R6);
Q3=(pJ2-p0)/(R7+Rv3+R8);
p1=Q*R1+pJ1;
display(['Q1: ', num2str(Q1)])
display(['Q2: ',num2str(Q2)])
display(['Q3: ',num2str(Q3)])
display(['p1: ',num2str(p1)])
fprintf("\n")

%%

%Q1_4=(pJ1_2-p0)/(R2+Rv1_2+R3);
%Q2_2=(pJ2_2-p0)/(R5+Rv2_2+R6);
%Q3_2=(pJ2_2-p0)/(R7+Rv3+R8);
%p1_2=Q*R1+pJ1_2;


A_2=[18 -13.5;2 -3;];
B_2=[81*Q+4.5 -1]';
C_2=A_2\B_2;
pJ1_2=C_2(1);
pJ2_2=C_2(2);

Q3_2=(pJ2_2-p0)/(R7+Rv3+R8);
p1_2=Q*R1+pJ1_2;
K1=(pJ1_2-p0-15*Q3_2)/(R0*Q3_2);
K2=(pJ2_2-p0-11*Q3_2)/(R0*Q3_2);
Q1_2=(pJ1_2-p0)/(R2+R0*(1+K1)+R3);
Q2_2=(pJ2_2-p0)/(R5+R0*(1+K2)+R6);
%Q1_2=(pJ1_2-p0)/(R2+Rv1_2+R3);
%Q2_2=(pJ2_2-p0)/(R5+Rv2_2+R6);
fprintf("If Q1=Q2=Q3\n")
display(['Q1: ',num2str(Q1_2)])
display(['Q2: ',num2str(Q2_2)])
display(['Q3: ',num2str(Q3_2)])
display(['p1: ',num2str(p1_2)])
alpha_1=fzero(@(a_1) ((1-a_1^2)^2/a_1^4)-K1,0.5)
alpha_2=fzero(@(a_2) ((1-a_2^2)^2/a_2^4)-K2,0.5)

