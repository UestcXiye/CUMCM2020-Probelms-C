clc
% p1outdata是经过人工处理的附件1的数据
% 第一列是企业代号
% 第二列是销项金额
% 第三列是销项税额
% 第四列代表发票状态，1为有效发票，0为作废发票
[line,column]=size(p1outdata);
result=zeros(123,7);
for i=1:123
    result(i,1)=i;
end
for i=1:123
    count=0;% 总计数器
    effective_count=0;% 有效发票计数器
    negative_count=0;% 负数发票计数器
    output_sum=0;% 销项总额
    tax_sum=0;% 税总额
    max_output=0;% 最高销项
    max_tax=0;% 最高税务
    for j=1:line
        if p1outdata(j,1) == i % 对应公司
            count=count+1; % 求总发票数
            if p1outdata(j,4) == 1 % 如果是有效发票
                effective_count=effective_count+1; % 求有效发票数
                if p1outdata(j,2)<0 % 如果是负数发票
                    negative_count=negative_count+1; % 求负数发票数
                end
            	output_sum=output_sum+p1outdata(j,2);% 求和销项总额
                tax_sum=tax_sum+p1outdata(j,3);% 求和销项税总额
                % 求最大销项
                if p1outdata(j,2)>max_output
                    max_output=p1outdata(j,2);
                end
                % 求最大销项税收
                if p1outdata(j,3)>max_tax
                    max_tax=p1outdata(j,3);
                end
            end
        elseif p1outdata(j,1)>i
            break;
        end
    end
    result(i,2)=effective_count/count; % 有效率
    result(i,3)=negative_count/count;% 负数率
    result(i,4)=output_sum;
    result(i,5)=tax_sum;
    result(i,6)=max_output;
    result(i,7)=max_tax;
end
