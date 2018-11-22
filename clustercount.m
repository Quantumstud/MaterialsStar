%% Function to count the clusters inside quantum well
ClusterQW=0;
% ClusteroutQW=0;
ClusterQWSize=zeros(22,1);
% ClusteroutQWSize=zeros(22,1);
ClusterQWIntensity=zeros(22,1);
% ClusteroutQWIntensity=zeros(22,1);
for i=1:numsnip
    %if Centroid(i,2)>18 && Centroid(i,2)<56
        ClusterQW=ClusterQW+1;
        ClusterQWSize(ClusterQW,1)=output.rho(i,1);
        ClusterQWIntensity(ClusterQW,1)=output.eta(i,1);
    %else
%         ClusteroutQW=ClusteroutQW+1;
%         ClusteroutQWSize(ClusteroutQW,1)=output.rho(i,1);
%         ClusteroutQWIntensity(ClusteroutQW,1)=output.eta(i,1);
    %end
end