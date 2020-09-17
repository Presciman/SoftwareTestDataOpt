function rel = bubbleTest( a)
%  比较的数组长度
len=size(a,2);
% 记录路径  其中len*（len-1）/2为数组的长度
route=zeros(1,len*(len-1)/2);
% route数组的指针
index=1;
for i=1:size(a,2)-1
    for j=1:size(a,2)-i
        if(a(j)>a(j+1))
            % 交换
            tem=a(j);
            a(j)=a(j+1);
            a(j+1)=tem;
            % 标记路径
            route(index)=1;
            index=index+1;
        else
            index=index+1;
        end
    end
end
% 将数组转化为整数
rel=0;
for k=1:size(route,2)
    rel=rel+route(k)*2^(k-1);
end
end

