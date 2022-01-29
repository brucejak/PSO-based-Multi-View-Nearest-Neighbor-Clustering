function [objValue] = getObjValue1(parameter)
%GETOBJECTIVE �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
DM1 = evalin('base', 'DM1');
DM2 = evalin('base', 'DM2');
%DM3 = evalin('base', 'DM3');
K = evalin('base', 'K');
%datalabels = evalin('base', 'datalabels');

num = size(DM1,1);

for i=1:1:num
    DM1(i,i)=-inf;
    DM2(i,i)=-inf;
%    DM3(i,i)=-inf;
end

%for i=1:1:num
%    DM1(i,i)=0;
 %   DM2(i,i)=0;
   % DM3(i,i)=0;
%end
    

a = parameter(1, 1);
b = parameter(1, 2);
%c = parameter(1, 3);

DM = a*DM1+b*DM2;

Idx=INNC(DM,(K-1));
%Idx=HAC_DM(DM,K,'ward');

%ljm = ljm_cal1(DM);
%AC=accuracy(Idx,datalabels)/100;
Ivalue = Inter_Intra2_new(Idx,DM);
%Ivalue = dunns(K,DM,Idx);
%objValue = 1/Ivalue+(a+b-1)^2;
%Ivalue = CVNN(Idx,DM,20);
% objValue = Ivalue+(a+b-1)^2;
%Ivalue = CVDDIndex(DM,Idx);
 %objValue = Ivalue+(a+b+c-1)^2;
objValue = 1/Ivalue+(a+b-1)^2;
%objValue = 1-AC;
%objValue = 1/Ivalue;
end

