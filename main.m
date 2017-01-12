xdata=load('a.txt');
ydata=load('u.txt');

for zf=0:1000
    for i=1:4
        ydata(i,3)=zf;
    end;
    loc=0;
    for i=1:4
        for j=i+1:4
            loc=loc+1;
            y(loc)=(ydata(i,1)-ydata(j,1))^2+(ydata(i,2)-ydata(j,2))^2+(ydata(i,3)-ydata(j,3))^2;
        end
    end;

    X0=[0,0,0,0];
    [X,resnorm]=lsqcurvefit(@fun,X0,xdata,y)

    for i=1:4 
        y2(i)=X(i)^2*(ydata(i,1)^2+ydata(i,2)^2+ydata(i,3)^2);
    end;

    T0=[0,0,0;0,0,0;0,0,0;0,0,0];

    [T,resnorm]=lsqcurvefit(@fun2,T0,xdata,y2)

    R0=[1,0,0;0,0.8,0.6;0,-0.6,0.8];
    y3=(xdata-T)';
    yz=ydata';
    [R,resnorm]=lsqcurvefit(@fun3,R0,yz,y3);
    sc=strcat(num2str(zf),'.txt');
    sc;
    fid = fopen(sc,'wt');
    
    for i=1:4
        for j=1:3
        fprintf(fid,'%4.3f ',T(i,j)); 
        
        end
        fprintf(fid,'\n');
    end
    for i=1:3
        for j=1:3
        fprintf(fid,'%4.3f ',R(i,j)); 
        end
        fprintf(fid,'\n');
    end
    fclose(fid);
end;
