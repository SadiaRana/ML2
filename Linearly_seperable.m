clear all;

load 1_iris_class1_2_3_4D.mat


clf, plot(X(3,1:50),X(4,1:50),'rx'), hold on, plot(X(3,51:100),X(4,51:100),'bo'),
plot(X(3,101:150),X(4,101:150),'gs')
xlabel('Feature 3','fontsize',16); % Label axes
ylabel('Feature 4','fontsize',16); % Label axes
title(['Feature dimension plot'],'fontsize',16);hold on;
legend('Class 1','Class 2', 'Class 3')



% --------------------------PC analysis and plotting
% coeff = pca(X(:,:));
% 
% 
% plot(coeff(1:50,1),coeff(1:50,2),'rx');hold on;plot(coeff(51:100,1),coeff(51:100,2),'gx');
% plot(coeff(101:150,1),coeff(101:150,2),'bx');
% xlabel('First PC','fontsize',16); % Label axes
% ylabel('Second PC','fontsize',16); % Label axes
% title(['Principle Component analysis'],'fontsize',16);hold on;
% legend('Class 1','Class 2', 'Class 3');

