%% Function Cart2PolN
%
%% Introduction:
% Function to convert an n-dimensional cartesian coordinate system into
% n-dimentional spherical polar coordinate system.
%% Function Definition:
% Function takes in the values of the n-dimensional cartesian system
% coordinates of a single point in space in the form of an 1-dimensional
% array in the parameter list and return as output the spherical polar
% version of the same coordinates of the same point as another 1-d array
%% Operation Procedure:
% syntax: polar_coordinates=cart2PolN(cartesian_coordinates)
% NB.: both cartesian_coordinates and polar_coordinates are in the form of
% 1-d arrays or row vectors
%% Variable List:
% List of variables in order of declaration and usage
% polars: spherical polar coordinate values of a point that is returned as
% the result. (vector)
% cartesn: cartesian coordinate values of a point that is taken in as input
% parameters to the function.(vector)
% dim: dimensions of cartesn and polar
% sumD2: sum of the squares of dimensions.
% sumD1: reverse sum of the squares of dimensions. 
% i: loop variable
%% Function Code
function polars=cart2PolN(cartesn)
dim=size(cartesn);
polars=zeros(dim);
sumD2=0;
for i=1:dim(2)
    sumD2= sumD2 + power(cartesn(i),2);
end
polars(1)=sqrt(sumD2); 
sumD1=0;
for i=2:dim(2)
    sumD1=sumD1+power(cartesn(i-1),2);
    if(i==dim(2))
        polars(i)=2*acot((cartesn(i-1)+sqrt(power(cartesn(i),2)+power(cartesn(i-1),2)))/cartesn(i));
    else
        polars(i)=acot(cartesn(i-1)/sqrt(sumD2-sumD1));
    end
end

end



%% Copyrights
%   (c) Programmed by Bishal Biswas
%      email: b.biswas_94587@ieee.org