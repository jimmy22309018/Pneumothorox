function [conv] = convexBorder(mask,threshold)
conv = mask;
if(sum(mask(:))>0)
    [len,wid] = size(mask);
    xa = [];
    ya = [];
    for i = 1 : len
        for j = 1 : wid
            if(mask(i,j) ~=0)
                xa = [xa,i];
                ya = [ya,j];
            end
        end
    end
    xa = xa';
    ya = ya';
    DT2 = delaunayTriangulation(xa,ya);
    k = convexHull(DT2);

    %%

    for i = 1 : size(xa)
        tx = xa(i);
        ty = ya(i);
        min = 1000;
        flag = 0;

        for j = 1 : size(k)
            testx = xa(k(j));
            testy = ya(k(j));
            dis = sqrt((tx-testx)*(tx-testx)+(ty-testy)*(ty-testy));
            if(dis<min)
                min = dis;
            end
            if(min<threshold)
                flag = 1;
                break;
            end
        end
        if(flag ==0)
            conv(tx,ty) = 0;
        end
    end
end
end

