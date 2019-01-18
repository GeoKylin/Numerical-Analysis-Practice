function X=Erfen(f,x,a,b,e)
%二分法解非线性方程求根

X(1,1)=0;
X(1,2)=a;
X(1,3)=b;
X(1,4)=(X(1,2)+X(1,3))/2;
X(1,5)=(X(1,3)-X(1,2))/2;
sa=sign(subs(f,x,a));
sb=sign(subs(f,x,b));

k=1;
while X(k,5)>=e
    k=k+1;
    X(k,1)=k-1;
    if sign(subs(f,x,X(k-1,4)))==sa
        X(k,2)=X(k-1,4);
        X(k,3)=X(k-1,3);
    elseif sign(subs(f,x,X(k-1,4)))==sb
        X(k,3)=X(k-1,4);
        X(k,2)=X(k-1,2);
    else
        X(k,2)=subs(f,x,X(k-1,4));
        break;
    end
    X(k,4)=(X(k,2)+X(k,3))/2;
    X(k,5)=(X(k,3)-X(k,2))/2;
end