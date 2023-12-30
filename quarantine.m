%% a
load data(1).mat;
qu=data(:,4);
[a,b]=find(qu==1);
Ix=data(a,2);
Iy=data(a,3);
x=data(:,2); 
y=data(:,3);
All=[x,y];
Inf=[Ix,Iy];
D=pdist2(All,Inf);
[a1,b1]=find(D<=2);
QID=data(a1,1);
[c1,d1]=find(D==0);
InfID=data(c1,1);
output=setxor(QID,InfID);
fprintf("Number of individuals who need to quarantine = %d\n\n",numel(setxor(QID,InfID)))

fprintf("List: \n")

fprintf("Individual no. %d\n",output)

%% b

load data(1).mat;

x=data(:,2);

y=data(:,3);

qu=data(:,4);

[a,b]=find(qu==1);

Ix=data(a,2);

Iy=data(a,3);

All=[x,y];

Inf=[Ix,Iy];

D=pdist2(All,Inf);

n=1;

r=1;

g=1;

b=1;

while n<=numel(x)

S=D(n,:);

L=S(0<S&S<=2);

L1=numel(L);

M=S(S==0);

M1=numel(M);

N=S(S>2);

N1=numel(N);

if L1>=1 && M1==0

n1=n;

Red(r,1)=data(n1,2);

Red(r,2)=data(n1,3);

r=r+1;

elseif M1==1;

n2=n;

Green(g,1)=data(n2,2);

Green(g,2)=data(n2,3);

g=g+1;

else

n3=n;

Blue(b,1)=data(n3,2);

Blue(b,2)=data(n3,3);

b=b+1;

end

n=n+1;

end

hold on

sz=50;

In=scatter(Red(:,1),Red(:,2),sz,[1,0,0],'displayname','Quarantine');hold on

Q=scatter(Green(:,1),Green(:,2),sz,[0,1,0],'displayname','Infected');hold on

NQ=scatter(Blue(:,1),Blue(:,2),sz,[0,0,1],'displayname','No quarantine');hold on

xlabel('x(m)');

ylabel('y(m)');

xticks(linspace(0,20,5));

yticks(linspace(0,20,5));

legend('location','best')

title('Distribution of different individuals in the event venue')

