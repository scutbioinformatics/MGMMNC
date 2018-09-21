function [mx,my]=plot_my_roc(x,y)
n=length(x);
tx=x(1);
ty=y(1);
mx=tx;
my=ty;
dis=0.15;
for i=2:n-1
    if norm([x(i)-tx,y(i)-ty])>dis || norm([x(i)-x(i+1),y(i)-y(i+1)])>dis
        mx=[mx,x(i)];
        my=[my,y(i)];
        tx=x(i);
        ty=y(i);
    end
end

mx=[mx,x(n)];
my=[my,y(n)];
end