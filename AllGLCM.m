function [state] = AllGLCM(Mri,mask,sliceLen,dis,upperBound,lowerBound)


s1 = calGLCM(Mri,mask,sliceLen,0,0,1,dis,upperBound,lowerBound);
s2 = calGLCM(Mri,mask,sliceLen,0,1,0,dis,upperBound,lowerBound);
s3 = calGLCM(Mri,mask,sliceLen,1,0,0,dis,upperBound,lowerBound);
s4 = calGLCM(Mri,mask,sliceLen,0,1,1,dis,upperBound,lowerBound);
s5 = calGLCM(Mri,mask,sliceLen,1,0,1,dis,upperBound,lowerBound);
s6 = calGLCM(Mri,mask,sliceLen,1,1,0,dis,upperBound,lowerBound);
s7 = calGLCM(Mri,mask,sliceLen,1,1,1,dis,upperBound,lowerBound);

S = s1 + s2 + s3 + s4 + s5 + s6 + s7;
state = graycoprops(S);

end

