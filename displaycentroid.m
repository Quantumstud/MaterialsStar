%plot together
function displaycentroid(I,ActCent)

im=figure,imagesc(I);
hold on
scatter(ActCent(:,1),ActCent(:,2),20,'black','filled');
set(gca,'color','none');
dcm=datacursormode(im);
datacursormode on
set(dcm, 'updatefcn', {@myfunction2})
end