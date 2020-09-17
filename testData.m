function [routeNum,access,relData] = testData( initpop,nums,bubbleTest,dim,interval)
%initpop ��ʼ��Ⱥ��С
%nums  ��������
%bubbleTest   ���Ժ���
%dim  ð�������ά��
%����������������������10 ���䷶Χ ������������
% �������������������� 3  ά��   ������������
% ��ʼ��Ⱥ
% ��¼ÿ��·���Ĳ������ݵĸ���

%  ð������Ĳ��ɴ�·��  ͨ��������Ʊ�״ͼ
% �ɴ�·��
m=factorial(dim);
% ·������
n=2^(dim*(dim-1)/2);

%  ����ֵ
relData=zeros(n,dim);
route=zeros(1,n);
while(nums>=0)
    init=ceil(interval*rand(initpop,dim));
    nums=nums-1;
    % ?????????  8  ·������   ������������
    for i=1:size(init,1)
        %����bubble���� ���صڼ���·��
        rel=bubbleTest(init(i,:));
        %��¼ͨ�����·�������ݸ���
        route(rel+1)=route(rel+1)+1;
        %�����ݽ�����浽relData
        relData(rel+1,:)=init(i,:);
    end   
end
%�ɴ�·�� �벻�ɴ�·��
routeNum=route;
%�ɴ�·����  �Ѿ��ҵ�
mfind=length(find(routeNum));   
access=[mfind,m-mfind,n-m];
end

