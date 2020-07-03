clear 
clc 
fitnessfcn=@multiobj_1;
 nvars=4; 
 lb=[0,0,0,0]; 
 ub=[inf,inf,inf,inf]; 
 A=[-1,0,-1,0;0,-1,0,-1;1,1,0,0;0,0,1,1];b=[-30,-30,120,48]; 
 Aeq=[];beq=[]; 
 
options=gaoptimset('paretoFraction',0.3,'populationsize',200,'generations',300,'stallGenLimit',200,'TolFun',1e-10,'PlotFcns',@gaplotpareto); 

[x,fval]=gamultiobj(fitnessfcn,nvars,A,b,Aeq,beq,lb,ub,options)

plot(-fval(:,1),fval(:,2),'pr')
xlabel('f_1(x)')
ylabel('f_2(x)')
title('Pareto front')
grid on