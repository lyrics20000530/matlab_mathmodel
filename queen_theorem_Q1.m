n=10000;%ģ��˿���;
dt=exprnd(10,1,n);%����ʱ����;
st=normrnd(6.5,1.2,1,n);%����ʱ��;
a=zeros(1,n);%����ʱ��;
b=zeros(1,n);%��ʼ����ʱ��;
c=zeros(1,n);%�뿪ʱ��;
a(1)=0;
for i=2:n
    a(i)=a(i-1)+dt(i-1);%��i���˵���ʱ��;
end
b(1)=0;%��һ���˿�ʼ����ʱ��Ϊ����ʱ��;
c(1)=st(1);%��һ�����뿪ʱ��Ϊ����ʱ����
for i=2:n
    if a(i)>c(i-1)
        b(i)=a(i);
    else
        b(i)=c(i-1);%��i���˷���ʱ��;
    end
    c(i)=b(i)+st(i);%��i�����뿪ʱ��;
end
cost=zeros(1,n);%��¼ͣ��ʱ��;
for i=1:n
    cost(i)=c(i)-a(i);
end
T=c(n);%���й˿��뿪ʱ��;
p=sum(st)/T;%������;
avert=sum(cost)/n;%ƽ��ͣ��ʱ��;
fprintf('�˿�ƽ������ʱ��:%6.2f��\n',avert);
fprintf('ϵͳ����ǿ�ȣ�%6.3f\n',p);