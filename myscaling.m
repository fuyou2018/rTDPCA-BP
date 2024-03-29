function [SVFM, lowVec, upVec] = myscaling(VecFeaMat, bTest, lRealBVec, uRealBVec)
% Input:  VecFeaMat --- ??scaling? m*n ??????????????????????
%         bTest ---  =1????????????scaling??????? lRealBVec ? uRealBVec
%                       ??????????????? scaling ????
%                    =0???????????? scaling
%         lRealBVec --- n????????? scaling ?????????????
%         uRealBVec --- n????????? scaling ?????????????
%
% output: SVFM --- VecFeaMat? scaling 
%         upVec --- ???????(???????scaling?????bTest = 0)
%         lowVec --- ???????(???????scaling?????bTest = 0)
if nargin < 2   
    %???????????????????2?????????????bTest????2018.11.29_FB 
    %nargin???????nargout??????
    bTest = 0;
end

% ??????[-1, 1]
lTargB = -1;
uTargB = 1;

%pcaFaces?200*49?
m=250;n=64*64;
SVFM = zeros(m, n);

if bTest
    if nargin < 4
        error('To do scaling on testset, param lRealB and uRealB are needed.')
    end
    
    if nargout > 1  %nargout??????
        error('When do scaling on testset, only one output is supported.')
    end

    for iCol = 1:n  %n?pcaFaces  ??   k=49
        if uRealBVec(iCol) == lRealBVec(iCol)  %?????? = ??????
            SVFM(:, iCol) = uRealBVec(iCol);
            SVFM(:, iCol) = 0;
        else
            %lTargB = -1;  uTargB = 1;
            SVFM(:, iCol) = lTargB  +  ( VecFeaMat(:, iCol) - lRealBVec(iCol) ) / ( uRealBVec(iCol)-lRealBVec(iCol) ) * (uTargB-lTargB); % ?????scaling
        end
    end
else
    
    %?????scaling???
    upVec = zeros(1, n);%  ???  ??????????????????
    lowVec = zeros(1, n);

    for iCol = 1:n
        lowVec(iCol) = min( VecFeaMat(:, iCol) );  %?????????
        upVec(iCol) = max( VecFeaMat(:, iCol) );
        if upVec(iCol) == lowVec(iCol)
            SVFM(:, iCol) = upVec(iCol);      
            SVFM(:, iCol) = 0;
        else
            SVFM(:, iCol) = lTargB  +  ( VecFeaMat(:, iCol) - lowVec(iCol) ) / ( upVec(iCol)-lowVec(iCol) ) * (uTargB-lTargB); % ?????scaling
        end
    end
end
