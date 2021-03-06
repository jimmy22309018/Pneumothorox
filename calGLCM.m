function [glcm] = calGLCM(Mri,mask,len,delx,dely,delz,dis,upperBound,lowerBound)
glcm = zeros(upperBound-lowerBound+1,upperBound-lowerBound+1);
[a,b,c] = size(Mri);
dx = dis*delx;
dy = dis*dely;
dz = dis*delz;

Mri = int32(Mri);

%%
for x = 1 : a-dis
    for y = 1 : b-dis
        for z = 1 : c-dis
            if(x+dx<= a && y+dy<=b && z+dz <=c)
                if(mask(x,y,z) > 0 && mask(x+dx,y+dy,z+dz)>0)

                    a = Mri(x,y,z);
                    b = Mri(x+dx,y+dy,z+dz);
                   if(a<upperBound && a >=lowerBound && b <upperBound && b>=lowerBound)
                        glcm(a-lowerBound+1,b-lowerBound+1) = glcm(a-lowerBound+1,b-lowerBound+1) + 1;
                   end
                end
            end
            
        end
    end
end
glcm = glcm + glcm.';

end

