function [inMri,len] = readMri( name , oppsite)
%% file direstory
fileFolder = fullfile(pwd,name);
files = dir(fullfile(fileFolder,'*.dcm'));
fileNames = {files.name};

%% file header
info = dicominfo(fullfile(fileFolder,fileNames{1}))
len = length(fileNames);

%% read slice images generae 3D matrix
%hWaitBar = waitbar(0,'Reading DICOM files');

%mri = zeros(info.Rows,info.Columns,numImages,class(info.BitDepth));

for i = length(fileNames):-1:1
    fname = fullfile(fileFolder,fileNames{i});
    inMri(:,:,i) = double(dicomread(fname));
    %waitbar((length(fileNames)-i+1/length(fileNames)))
end
%delete(hWaitBar);

%h.Normalization = 'countdensity';
%%

figure, 
edges = [-1300 -1200:2:-400 -400];
h = histogram(inMri,edges);

if(oppsite ==1)
    [a,b,c] = size(inMri);
    t = zeros(a,b,c);
    for i = 1 : len
        t(:,:,len+1-i) = inMri(:,:,i);
    end
    inMri = t;
end

if(info.RescaleIntercept~=0)
    for i = 1 : len
        inMri(:,:,i) = inMri(:,:,i) + info.RescaleIntercept;
    end
end


end

