%% Function ClusterCenPolar
% 
%% Introduction:
% Function to find the centered( Centroid ) points after clustering ...
% the data taken in as input and giving in result the list of the centered points
% in polar co-ordintaes. 
%% Function operation:
% The input parameters are the matrix of the loaded un-categorised datafile 
% and the variation length of the points using euclidean distance 
% the datafile is to be double-floating point data features.
% Output is the set of centroid points 
%% Variable List
% dFile : datafile taken in as a matrix input
% varx : variation of the euclidean distance between neighbouring points
% r,c : row and column length of dFile viz., r: number of data points; 
%           c: the corresponding features
% centPl : polar variation of the centroid points
% centCrt : cartesian variation of the centroid points
% clsDFile : clusterdata function operated result on the datafile. This
%           variable defines the cluster members with respect to the
%               corresponding datapoint position 
%       more info: Mathworks(TM) Statistical and Machine Learning Toolbox 
% cntLn : maximum number of clusters considering any and every cluster.
%
% NB.: the centroid being attained is a simple mean of the feature value of
%           the datapoints that are concentrated to a single cluster.
%
% freqCentP : updater matrix variable to check the frequency and update 
%           if required the number of members of each cluster
% sumCentP : updater matrix variable to find the summation of the values of
% the corresponding features pertaining to various datapoints pertaining to
%            a single cluster of data due to the nature of centroid value.
% clsCount : cluster counter variable to move between clusters and also at
% times being used as a validation variable to the clsDFile member cluster
% marker point to variate one cluster from the other. Variable is also used
% as a control variable for sumCentP and freqCentP matrices and vectors
% i, j, k : loop control variables
%
%
%% Function Code :
function centPl=clusterCenPolar(dFile,varx)
 [r,c]=size(dFile);
  clsDFile=clusterdata(dFile,'Criterion','distance','Cutoff',varx); % cluster creation
  cntLn=max(clsDFile);                      % initialization section
  centCrt=zeros(cntLn,c);
  freqCentP=zeros(cntLn);
  sumCentP=zeros(cntLn,c);
  clsCount=0;
  while(clsCount<=cntLn)
      for i=1:r
          if(clsDFile(i)== clsCount)    %search for respective cluster member
             for j=1:c 
                 sumCentP(clsCount,j)=sumCentP(clsCount,j)+dFile(i,j); %summation updation
             end
             freqCentP(clsCount)=freqCentP(clsCount)+1; %frequency updation
          end
      end
      clsCount=clsCount+1;
  end
  
  for k=1:cntLn
      for j=1:c
          centCrt(k,j)=sumCentP(k,j)/freqCentP(k);  % centroid calculation
      end
  end
      centPl=0;   % finding polar centroid coordinates( to be done...*****)
end             

 %% Copyrights
 % (c) Programmed by Bishal Biswas
 %      email: b.biswas_94587@ieee.org