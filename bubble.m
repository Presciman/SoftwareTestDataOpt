function  a= bubble(a)
% ð�ݳ���
for i=1:size(a,2)-1
    for j=1:size(a,2)-i
        if(a(j)>a(j+1))
            tem=a(j);
            a(j)=a(j+1);
            a(j+1)=tem;
        end
    end
end
end
