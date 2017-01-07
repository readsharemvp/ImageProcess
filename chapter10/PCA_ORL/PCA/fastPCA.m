function [pcaA V] = fastPCA( A, k )
% ����PCA
%
% ���룺A --- ��������ÿ��Ϊһ������
%      k --- ��ά�� k ά
%
% �����pcaA --- ��ά��� k ά��������������ɵľ���ÿ��һ������������ k Ϊ��ά�����������ά��
%      V --- ���ɷ�����

[r c] = size(A);

% ������ֵ
meanVec = mean(A);

% ����Э��������ת�� covMatT
Z = (A-repmat(meanVec, r, 1));
covMatT = Z * Z';

% ���� covMatT ��ǰ k ������ֵ�ͱ�������
[V D] = eigs(covMatT, k);

% �õ�Э������� (covMatT)' �ı�������
V = Z' * V;

% ����������һ��Ϊ��λ��������
for i=1:k
    V(:,i)=V(:,i)/norm(V(:,i));
end

% ���Ա任��ͶӰ����ά�� k ά
pcaA = Z * V;

% ����任���� V �ͱ任ԭ�� meanVec
save('Mat/PCA.mat', 'V', 'meanVec');