clc
% p1indata是经过人工处理的附件1的数据
% 第一列是企业代号
% 第二列是进项金额
% 第三列是进项税额
% 第四列代表发票状态，1为有效发票，0为作废发票
[line,column]=size(p1indata);
result=zeros(123,7);
for i=1:123
    result(i,1)=i;
end
for i=1:123
    count=0;% 总计数器
    effective_count=0;% 有效发票计数器
    negative_count=0;% 负数发票计数器
    income_sum=0;% 进项总额
    tax_sum=0;% 税总额
    max_income=0;% 最高进项
    max_tax=0;% 最高税务
    for j=1:line
        if p1indata(j,1) == i % 对应公司
            count=count+1; % 求总发票数
            if p1indata(j,4) == 1 % 如果是有效发票
                effective_count=effective_count+1; % 求有效发票数
                if p1indata(j,2)<0 % 如果是负数发票
                    negative_count=negative_count+1; % 求负数发票数
                end
            	income_sum=income_sum+p1indata(j,2);% 求和进项总额
                tax_sum=tax_sum+p1indata(j,3);% 求和进项税总额
                % 求最大进项
                if p1indata(j,2)>max_income
                    max_income=p1indata(j,2);
                end
                % 求最大进项税收
                if p1indata(j,3)>max_tax
                    max_tax=p1indata(j,3);
                end
            end
        elseif p1indata(j,1)>i
            break;
        end
    end
    result(i,2)=effective_count/count; % 有效率
    result(i,3)=negative_count/count;% 负数率
    result(i,4)=income_sum;
    result(i,5)=tax_sum;
    result(i,6)=max_income;
    result(i,7)=max_tax;
end