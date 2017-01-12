function f=fun3(X,xdata)
for i=1:3
        for k=1:4
            f(i,k)=0;
        end
end
for i=1:3
    for j=1:3
        for k=1:4
            f(i,k)=f(i,k)+X(i,j)*xdata(j,k);
        end
    end
end


end

