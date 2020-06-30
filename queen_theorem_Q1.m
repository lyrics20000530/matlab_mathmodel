n=10000;%模拟顾客数;
dt=exprnd(10,1,n);%到达时间间隔;
st=normrnd(6.5,1.2,1,n);%服务时间;
a=zeros(1,n);%到达时间;
b=zeros(1,n);%开始服务时间;
c=zeros(1,n);%离开时间;
a(1)=0;
for i=2:n
    a(i)=a(i-1)+dt(i-1);%第i个人到达时间;
end
b(1)=0;%第一个人开始服务时间为到达时间;
c(1)=st(1);%第一个人离开时间为服务时长；
for i=2:n
    if a(i)>c(i-1)
        b(i)=a(i);
    else
        b(i)=c(i-1);%第i个人服务时间;
    end
    c(i)=b(i)+st(i);%第i个人离开时间;
end
cost=zeros(1,n);%记录停留时间;
for i=1:n
    cost(i)=c(i)-a(i);
end
T=c(n);%所有顾客离开时间;
p=sum(st)/T;%服务率;
avert=sum(cost)/n;%平均停留时间;
fprintf('顾客平均逗留时间:%6.2f秒\n',avert);
fprintf('系统工作强度：%6.3f\n',p);