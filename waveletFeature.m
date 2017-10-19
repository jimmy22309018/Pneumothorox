function [s] = waveletFeature(data,mask)
s = zeros(2,15);

wd1 = wavedec3(data,2,'db1');

for i = 1 : 15
    a = wd1.dec{i};
    [M,N,L] = size(a);
    tempMask = maskResize(mask,M,N,L);
    
    a = a.*tempMask;
   
    mini = min(min(a(:)));
    maxi = max(max(a(:)));
	
    if(mini ==0 && maxi ==0)
        s(1,i) = 0;
        s(2,i) = 0;
    else
        entropy = 0;
        energy = 0;
        p = zeros(1,ceil(maxi-mini)+10);
        total = sum(sum(tempMask(:)));
		%total = M * N * L;
        if(total ~= 0)
            for j = 1 : M
                for k = 1 : N
                    for l = 1 : L
                        
                        if(a(j,k,l)~=0)
                            energy = energy + a(j,k,l)*a(j,k,l);
                            t = round(a(j,k,l)-mini);
                            p(1,t+1) = p(1,t+1) +1;
                        end
						
                    end
                end
            end
            for j = 1 : ceil(maxi-mini)+10
				p(1,j) = p(1,j)/total;
				if p(1,j) ~= 0 
					entropy = entropy - p(1,j)*log2(p(1,j))/log2(total);
				end
            end
            if(~isnan(energy))
                s(1,i) = energy;
            end
            if(~isnan(entropy))
                s(2,i) = entropy;
            end
        end
    end
end

end

