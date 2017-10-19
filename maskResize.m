function [tempMask] = maskResize(mask,a,b,c)
[X,Y,Z] = size(mask);
tempMask = zeros(a,b,c);
%[a b c]
%[X Y Z]

dX = (X-1)/(a);
dY = (Y-1)/(b);
dZ = (Z-1)/(c);
%[dX,dY,dZ]

ind1=1;
ind2=0;
ind3=0;

tempMask(1,1,1) = mask(1,1,1);


for i = 1 : a  
     ind1 = ind1 + dX;
     ind2 = 1;
    for j = 1 : b
        ind2 = ind2 + dY;
        ind3 = 1;
        for k = 1 : c
            ind3 = ind3 + dZ;
            t1 = floor(ind1);
            t2 = floor(ind2);
            t3 = floor(ind3);
            if(t1>X)
                t1 = X;
            end
            if(t2>Y)
                t2 = Y;
            end
            if(t3>Z)
                t3 = Z;
            end
            %[t1 t2 t3]
            tempMask(i,j,k) = mask(t1,t2,t3);
            
        end  
        
    end
   
end


end

