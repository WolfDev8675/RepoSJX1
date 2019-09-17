%% Function classifyCommR
% Classify the best of the set of communist rulers among a given set of
% features provided each and individually erected and peer voted.
%
%% Introduction:
% Function to take from a set of data points with their features and find 
% using the features to get a set of communist rulers. Each ruler is peer
% elected and the best is selected pertaining to the voting pool
%
%% Function Operation
% Function is to take input as parameters
% #1 the data set on which the classification process is to be done.
% #2 the threshold percentage; which is used to find the nearest supporters
% using the equation pertaining to a certain feature set compared with all
% datapoints support=(max of feature - min of same feature)*threshold/100
% #3 the number of best of the communist leaders; this number defines the
% number of the communist rulers/ kings with the maximum of the
% votes/supports in their favour to be recovered from the data itself.
% The return type of the function is a cell structure of the beststanding
% datapoints that can be considered as the communist rulers their
% supporters and the number of supporters that gave it the rank in order as
% described respectively.
%% Variable List
% in the order of the first declaration
% dSetK : (Data-Set Kings) the returned cell array containing the pool 
% of the best rulers considering the features and the rulers and provided
% that these rulers are promoted by dedicated votes of peers in the 
% community other than themselves, along with the dedicated voters and 
% the number of votes that gave the ruler his position.
% dFile : (Data File)the data file taken in as matrix input.
% thr : (Threshold)the threshold limit that is used to calculate the 
% maximum support length that is required for a certain data point to be
% supported by the others in the community pool of the data-points
% and features.
% related equation :
%   support=(max of feature - min of same feature)*threshold/100.
% best :(Best) the number of the best rulers that is to be returned back 
% to the user of the function pertaining to the datafile and the threshold.
% r,c : row and column of the input data file (dFile)
% supThr : (Support Threshold)this is to create a support threshold
% for each feature that is used to compare and find out if other 
% data-points really supports a certain data-point whose credibility 
% to a ruler status is under scrutiny and will get support if the 
% difference in feature is less than that which is in the support
% threshold limit.
% ##related equation :
%   support=(max of feature - min of same feature)*threshold/100.
% allSupp : (All Supporters) cell structure to collect all supporters
% pertaining to a certain feature of a given data-point. This stores all
% the data-points whose feature is in the support zone for the particular
% data-point in question
% deSupp : (Dedicated Supporters) those data-points which support all the
% features of the data-point in question to raise it to a leader status.
% deSupFq : (Dedicated Suppporter Frequency) used for storing the number of
% dedicated supportive data-points supporting a certain data-point.
% i,j,k,l : loop variables used in the various 'for' loops for computing
%   and moving about the elements of the matrices and cell arrays
% gSuptFreq : (General Support Frequency) used as a counter variable as
% well as an updater variable to get the number of supporters at each
% feature individually for filling up the 'allSupp' cell array.
% sepFrq : (Separate Frequency) used for counting the frequency of the
% number of appearances of the data-points concerning a single data-point
% which is in question or being tested for leadership
% supC : (Support Count) shortening the count distance used as limit
% variable for finding the number of supporters in each array of the cell
% array 'allSupp'.
% desDSFq : (Descending Dedicated Support Frequency) ordered in descending
% manner, the array for dedicated supporters' frequency (deSupFq)
% indx : (Index) indexes of the array 'deSupFq' when the elements of the
% array is ordered in descending manner.
% tmpCtr : (Temporary Counter) temporary counter to count and used as a
% loop increment variable for storing up the dSetK.
%
%% Function Code 

function dSetK=classifyCommR(dFile,thr,best)
[r,c]=size(dFile);
supThr=zeros(1,c);
for i=1:c
    supThr(i)=abs(max(dFile(:,i))-min(dFile(:,i)))*(thr/100);
end
dSetK=cell(best,3);
allSupp=cell(r,c);
deSupp=cell(r,1);
deSupFq=zeros(r,1);
for i=1:r 
    for j=1:c
        gSuptFreq=0;
        for k=1:r
            if(abs(dFile(i,j)-dFile(k,j))<=supThr(j) && i~=k)
                gSuptFreq=gSuptFreq+1;
                allSupp{i,j}(gSuptFreq)=k;
            end
        end
        sepFrq=zeros(1,r);
        for k=1:c
            supC=size(allSupp{i,k});
            for l=1:supC
                sepFrq(allSupp{i,j}(l))=sepFrq(allSupp{i,j}(l))+1;
            end
        end
        for k=1:r
            if(sepFrq(k)==c)
                deSupFq(i)=deSupFq(i)+1;
                deSupp{i}(deSupFq)=k;
            end
        end
    end
end
[desDSFq,indx]=sort(deSupFq,'descend');
tmpCtr=1;
while(best>0)
    dSetK{tmpCtr,1}=indx(tmpCtr);
    dSetK{tmpCtr,2}=deSupp{indx(tmpCtr)};
    dSetK{tmpCtr,3}=desDSFq(tmpCtr);
    tmpCtr=tmpCtr+1;
    best=best-1;
end

end
    
%% Copyrights
%   (c) Programmed by Bishal Biswas
%      email: b.biswas_94587@ieee.org
        
 