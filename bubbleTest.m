function rel = bubbleTest( a)
%  �Ƚϵ����鳤��
len=size(a,2);
% ��¼·��  ����len*��len-1��/2Ϊ����ĳ���
route=zeros(1,len*(len-1)/2);
% route�����ָ��
index=1;
for i=1:size(a,2)-1
    for j=1:size(a,2)-i
        if(a(j)>a(j+1))
            % ����
            tem=a(j);
            a(j)=a(j+1);
            a(j+1)=tem;
            % ���·��
            route(index)=1;
            index=index+1;
        else
            index=index+1;
        end
    end
end
% ������ת��Ϊ����
rel=0;
for k=1:size(route,2)
    rel=rel+route(k)*2^(k-1);
end
end

