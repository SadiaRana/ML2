clear
%DEFINE DATASET
X=[  1     0     0     1     1     1     1     0
     1     0     1     0     0     1     1     0
     1     1     0     0     0     1     1     1
     0     1     0     1     1     1     0     0
     1     1     1     1     0     0     0     0
     0     1     0     1     0     0     1     1
     0     0     1     1     1     1     0     1
     1     0     1     0     1     0     0     1
     0     1     1     0     1     0     1     1];
t=[  1,    1,    1,    1,    2,    2,    2,    2];
numClasses=2;
%sample to be classified:
x=[ 0.7922, 0.7552, 0.7109, 0, 0.4993, 0.2411, 0.1300, 0.9950, 0]';

display(X)
display(t)
display(x)


%DEFINE CLASS-SPCIFIC SUBDICTIONARIES (entries in each dictionary equal to samples from the training data with same class label)
for c=1:numClasses
  ind=logical(t==c);
  D{c}=X(:,ind);
end
%display sub-dictionaries treating each entry as a square image
for c=1:numClasses
  figure(c), clf
  [m,p]=size(D{c});
  toPlot=min(p,10);
  dim=sqrt(m);
  for i=1:toPlot,
    subplot(1,toPlot,i), 
    imagesc(reshape(D{c}(:,i),dim,dim)'), 
    axis('equal','tight','off'), 
  end
  subplot(1,toPlot,1), title(['Sub-dictionary for class ',int2str(c)]);
end



%USE SPARSE CODING TO CLASSIFY NEW SAMPLE
%display sample to be classified:
figure(numClasses+1),clf
subplot(1,numClasses+1,1); imagesc(reshape(x,dim,dim)'), 
axis('equal','tight','off'), 
title('Sample to be classified');
%FIND SUBDICTIONARY THAT CAN RECONSTRUCT DATA MOST ACCURATELY
for c=1:numClasses
  %find sparse code over class-spcific subdictionary:
  y=solvePFP(D{c},x,size(D{c},2),'nnpfp')
  %use sparse code to reconstruct sample:
  r=D{c}*y;
  subplot(1,numClasses+1,1+c); imagesc(reshape(r,dim,dim)'), 
  axis('equal','tight','off'), 
  title({'reconstruction by', 'sub-dictionary', ['for class ',int2str(c)]})
  %find the reconstruction error for this dictionary:
  reconError(c)=sum((x-r).^2);
end
%give sample class as dictionary with min error:
[val,classPredicted]=min(reconError)
 