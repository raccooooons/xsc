function f=fun(X,xdata)
[d1,d2]= size(xdata);
loc=0;
xn=0;
for i=1:d1
    for j=i+1:d1
        loc=loc+1;
        xn=xdata(i,1)^2+xdata(i,2)^2+xdata(i,3)^2;
        xm=xdata(j,1)^2+xdata(j,2)^2+xdata(j,3)^2;
        f(loc)=X(i)^2*xn+X(j)^2*xm+2*X(i)*X(j)*(xdata(i,1)*xdata(j,1)+xdata(i,2)*xdata(j,2)+xdata(i,3)*xdata(j,3));
    end
end;
end
