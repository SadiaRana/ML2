clear all;
k=1;
ro=0.1;

w = [7,-3,8];
nu=1;
x=[ 1,0,2;1,1,2;1,2,1;1,-3,1;1,-2,-1;1,-3,-2;1,0,2;1,1,2;1,2,1;1,-3,1;1,-2,-1;1,-3,-2;1,0,2;];
t=[1;1;1;0;0;0;1;1;1;0;0;0;1];

T1='y=';
T2='new w';
T3='test3';
T4='test4';
C1='crucial';
S='k is';

while k<14
    %w?w+?(t?y) xt
    disp(S);
    disp(k);
    %disp(w)
    y=dot(w,x(k,:));
    if y>0
        y=1;
        w = w+((t(k,1)-y).*x(k,:));
    elseif y<=0
        y=0;
        w = w+((t(k,1)-y).*x(k,:));
    end
    disp(T2);
    disp(w);
    disp(T1);
    disp(y);
    k=k+1;
    
end
