%% package for counting the clusters and settling the centroidcoordinates
function [Centroid,num]=centroidfind(BW)
[~,num]=bwlabel(BW);                             %identify and return the no. of clusters
s=regionprops(BW,'Centroid');
Centroid = vertcat(s.Centroid);                  %concatnate array vertically
end