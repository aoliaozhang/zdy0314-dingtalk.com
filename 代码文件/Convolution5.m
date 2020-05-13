function y=Convolution5(x,h)
x=input(' 输入信号， x=');
h=input(' 输入信号， h=');
lx=length(x);
lh=length(h);
lmax=max(lx,lh);
if lx>lh nx=0;nh=lx-lh;
else if lx<lh nh=0;nx=lh-lx;
else nx=0;nh=0; 
 end
end
lt=lmax; 
u=[zeros(1,lt),x,zeros(1,nx),zeros(1,lt)];
%m=[zeros(1,lt),h,zeros(1,nh),zeros(1,lt)];
t1=(-lt+1:2*lt);
h=[zeros(1,lt),h,zeros(1,nh),zeros(1,lt)];
hf=zeros(1,length(h));
s=fliplr(h);
subplot(5,1,1);stem(t1,u)
set(gcf,'color','w')
axis([-lt,2*lt,min(u),max(u)])
hold on; ylabel('x[n]')
%subplot(5,1,2);stem(t1,h)
%axis([-lt,2*lt,min(h),max(h)])
%hold on;ylabel('h[n]')
for a=(1:length(h));
hf(a)=s(a);
subplot(5,1,2);stem(t1,hf)
set(gcf,'color','w')
ylabel('h[-n]')
pause(0.5)
end
y=zeros(1,3*lt);
for k=(0:2*lt);
p=[zeros(1,k),s(1:end-k)];
y1=u.*p;
yk=sum(y1);
y(k+lt+1)=yk;
%%subpolt(6,1,2);stem(t1,u)
%set(gcf,'color','w')
%axis([-lt,2*lt,min(u),max(u)])
%hold on;ylabel('x[n]')
subplot(5,1,3);stem(t1,p)
set(gcf,'color','w')
axis([-lt,2*lt,min(p),max(p)])
ylabel('h[k-n]')
subplot(5,1,4);stem(t1,y1)
ylabel('s=u*h[k-n]')
subplot(5,1,5);stem(k,yk)
axis([-lt,2*lt,min(y1),max(y1)+eps])
axis([-lt,2*lt,floor(min(y)+eps),ceil(max(y+eps))]);
hold on;
ylabel('y[k]=sum(s)') 
%subplot(5,1,6);stem(t1,hf)
if k==round(0.8*lt)
%disp(' 暂停，按任意键继续 ');
pause 
else pause(1)
end 
end
end