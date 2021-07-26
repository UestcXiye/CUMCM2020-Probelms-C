[line,column]=size(data);
result=zeros(3,6);
for i=1:line
    if data(i,3)<0
        result(1,data(i,2))=result(1,data(i,2))+1;
    elseif data(i,3)==0
        result(2,data(i,2))=result(2,data(i,2))+1;
    elseif data(i,3)>0
        result(3,data(i,2))=result(3,data(i,2))+1;
    end
end