%%
close all; clc; 
%% Parameters needed to be decided
name = 'CHENG-CHIH-WEN';
slice = 300; %% Cut into how many slices
overlap = 1; %% Should the cutting of the slices be overlap or not
dis = 2; %% For the relation distances in GLCM
width = 7; %% The width of the ring-like mask
oppsite = 0; %% For some lungs that are oppsite
%% Percentage of the Dialation and Erosion --> Influence the location of the mask
leftmode = 0.5; 
rightmode = 0.5;
leftBorder = 0;
rightBorder = 0;
%% Parameters that is consider suitable
lowerBound = -1200;
upperBound = -500;
threshold = 300;
esophagus = 130;
L = 1;
R = 1;
disThreshold = 20;
%% Getting input
[inMri,len] = readMri(name,oppsite);
%% Preprocessing (cutting and his-processing)
[hisMri,rawMri] = cutMri(inMri,len,lowerBound);

%% Getting the mask of lung
[maskAll] = masking(hisMri,len,esophagus,width);
[leftLung,rightLung] = cutLung(maskAll,width,leftmode,rightmode,leftBorder,rightBorder,L,R,disThreshold);
%{
[his1,his2] = hisCounting(rawMri,maskAll,maskRing,start);
[maskedMri] = outputRing(maskRing,hisMri);
%}
%% Sliding 

rawMri = int64(rawMri);
leftLung = int64(leftLung);
rightLung = int64(rightLung);
[a,b,c] = size(rawMri);

left = rawMri(:,1 : round(b/2)+8 , :);
leftM = leftLung;
[s,t] = detect(threshold,leftM);
[s t]
%[LstateGLCM,LstateWavelet,LstateDensity,LstateScan,LstateMiss,LtextureM,LtextureV,LtextureR,LhisSum] = sliding(left,slice,leftM,dis,upperBound,lowerBound,overlap,s,t);

right = rawMri(:,round(b/2)+9 : b , :);
rightM = rightLung;
[s,t] = detect(threshold,rightM);
[s t]

%[RstateGLCM,RstateWavelet,RstateDensity,RstateScan,RstateMiss,RtextureM,RtextureV,RtextureR,RhisSum] = sliding(right,slice,rightM,dis,upperBound,lowerBound,overlap,s,t);

