%% Calculate the mean of the Non-QW and QW region
I=load('Untitled.txt');                                         % Change untitled.txt with your image

%% Specify the Non-QW region

Region1=I(1:18,:);                                              % Change the numbers '1:18' for the first part outside QW
Region2=I(70:90,:);                                             % Change the numbers '70:90' for the second part outside QW
NonQwRegion=[Region1;Region2];                                  
clear -vars Region1 Region2
Mean_NQW=mean(NonQwRegion(:));                                 
Std_NQW=std(NonQwRegion(:));                                   

%% Specify the the QW region

QwRegion=I(19:69,:);                                             %Change the number '19:69' for the region inside the QW
Mean_QW=mean(QwRegion(:));
std_QW=std(QwRegion(:));
