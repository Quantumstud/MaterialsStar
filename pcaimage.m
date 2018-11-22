clear;
clc;
load('S5Image.mat');
I=ImG;
[u1,s1,v1]=svd(I);
Blocksize=1;
s1(Blocksize+1:28,Blocksize+1:92)=0;
VT1=v1';
Output=u1(:,1:Blocksize)*s1(1:Blocksize,1:Blocksize)*VT1(1:Blocksize,:);
% figure,imagesc(Output);
% title('PCA1');
%% Substracted
newsubs=I-Output;
% figure,imagesc(newsubs);
% title('Substraction without equalising');
%%
% OutPSNR=psnr(Output,I);
% SubPSNR=psnr(newsubs,I);
% stdOutput=std(Output(:));
% stdnewsub=std(newsubs(:));
% avgOutput=mean(Output(:));
% avgnewsub=mean(newsubs(:));
%%Gauss
pcagauss=imgaussfilt(Output,0.625);
error_gauss=imgaussfilt(newsubs,0.625);
figure,imagesc(pcagauss);
title('PCA Post Gaussfilt 0.625pixel');
colorbar;
figure,imagesc(error_gauss);
title('Error Post Gaussfilt 0.625pixel');
colorbar;
fft_error_gauss=abs(fftshift(fft2(error_gauss)));
figure,imagesc(fft_error_gauss);
title('FFT of the errorgauss');
colorbar;
% fft_pca=abs(fftshift(fft2(pcagauss)));
% figure,imagesc(fft_pca);
% title('FFT of PCA Gauss');
% colorbar;
%% Comparison with HAADF and PCA
% HAADF=load('ADF.txt');
% HAADFfft=abs(fftshift(fft2(HAADF)));
% normHAADFfft=mat2gray(HAADFfft,[min(HAADFfft(:)) max(HAADFfft(:))]);
% normfft_pca=mat2gray(fft_pca,[min(fft_pca(:)) max(fft_pca(:))]);
% sub=abs(normHAADFfft-normfft_pca);
% figure,imagesc(sub);
% title('Substraction of normalised HAADF fft and normalised pca4 fft');
% colorbar;
%% Edge Detection
[BW,Threshold]=edge(error_gauss);

%% Centroidfind
[Centroid,num]=centroidfind(BW);
%% Specify the edge snip
up=4;
down=4;
left=4;
right=4;
[m,n,~]=size(error_gauss);
upstart=up;
downend=m-down;
leftstart=left;
rightend=n-right;
snippedresidual=error_gauss(upstart:downend,leftstart:rightend);
clear -vars i
snippedcentroid=zeros(1,2);
newnum=0;
for i=1:num
    if(Centroid(i,1)>upstart && Centroid(i,1)<downend)
        if(Centroid(i,2)>leftstart && Centroid(i,2)<rightend)
            newnum=newnum+1;
            snippedcentroid(newnum,:)=[Centroid(i,1)-up,Centroid(i,2)-down];
            
        end
    end
end
num=newnum;
clear -vars newnum up down left right i;
