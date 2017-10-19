function [variance,mean,roughness] = textureAnalyze(tempData,tempMask)
[row,column,height] = size(tempData);
sum = 0;
sum2 = 0;
counter = 0;


for i = 1 : row
    for j = 1 : column
        for k = 1 : height
            
            if (tempMask(i,j,k)>0)
                %tempData(i,j,k)
                sum = sum + tempData(i,j,k);
                counter = counter+1 ;
            end
           
        end
    end
end


mean = sum/counter;

for i = 1 : row
    for j = 1 : column
        for k = 1 : height
            
            if (tempMask(i,j,k)>0)
                sum2 = sum2 + (tempData(i,j,k)-mean)*(tempData(i,j,k)-mean);
            end
           
        end
    end
end

variance = sum2/counter;
roughness = 1-1/(1+variance*variance);
if(counter ==0)
    mean = 0;
    variance = 0;
    roughness = 0;
end
end

