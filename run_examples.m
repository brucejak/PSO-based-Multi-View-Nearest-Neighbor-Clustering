clear
data=importdata('CMU_mtv.mat');
data1=data.data{1};
data2=data.data{2};
data3=data.data{3};
datalabels=data.gt;
commandhistory
K=numel(unique(datalabels));DM1=pdist(data1,'cosine');DM1=squareform(DM1);
DM2=pdist(data2,'cosine');DM2=squareform(DM2);
DM3=pdist(data3,'cosine');DM3=squareform(DM3);
for i=1:1:1%% can be changed to 3 for mean values
fun = @getObjValue;
% 优化参数的个数 (c、g)
nvars = 3;
% 优化参数的取值下限
lb = [0, 0, 0];
ub = [1, 1, 1];
SwarmSize = 5;
MaxIteration = 40;
options = optimoptions('particleswarm','SwarmSize',SwarmSize,...
'MaxIterations', MaxIteration,...
'Display', 'iter',  'PlotFcn', 'pswplotbestf');
bestx = particleswarm(fun, nvars, lb, ub, options);
commandhistory
a = bestx(1, 1);
b = bestx(1, 2);
c = bestx(1, 3);
DM = a*DM1+b*DM2+c*DM3;
Idx=INNC(DM,(K-1));
NM(1,i)=nmi(Idx,datalabels);
AC(1,i)=accuracy(Idx,datalabels)/100;
end
mean(AC),mean(NM)

clear
data=importdata('handwrittenRnsp.mat');
datalabels=data.truth;
data1=data.X1;
data2=data.X2;
K=numel(unique(datalabels));
commandhistory
K=numel(unique(datalabels));DM1=pdist(data1,'cosine');DM1=squareform(DM1);
DM2=pdist(data2,'cosine');DM2=squareform(DM2);
for i=1:1:1
fun = @getObjValue1;
% 优化参数的个数 (c、g)
nvars = 2;
% 优化参数的取值下限
lb = [0, 0];
ub = [1, 1];
SwarmSize = 5;
MaxIteration = 40;
options = optimoptions('particleswarm','SwarmSize',SwarmSize,...
'MaxIterations', MaxIteration,...
'Display', 'iter',  'PlotFcn', 'pswplotbestf');
bestx = particleswarm(fun, nvars, lb, ub, options);
commandhistory
a = bestx(1, 1);
b = bestx(1, 2);
DM = a*DM1+b*DM2;
Idx=INNC(DM,(K-1));
NM(1,i)=nmi(Idx,datalabels);
AC(1,i)=accuracy(Idx,datalabels+1)/100;
end
mean(AC),mean(NM)

