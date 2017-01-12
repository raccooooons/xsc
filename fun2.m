function f=fun2(X,xdata)
[d1,d2]= size(xdata);

for i=1:d1
    f(i)=(X(i,1)-xdata(i,1))^2+(X(i,2)-xdata(i,2))^2+(X(i,3)-xdata(i,3))^2;
end;

end

