clear all;
clear close;

figure;
A=rgb2gray(imread('img\15.jpeg'));
imshow(A);
axis on; title('image initial au niveaux de gris');

%% Ajouter un bruit a un image 
figure;

%Image avec un bruit gaussien 
ImG=imnoise(A,'gaussian');
subplot(1,2,1);
imshow(ImG);
axis on; title('Image avec un bruit gaussien ');

%Image avec un bruit poivre et sel 
ImSP=imnoise(A,'salt & pepper');
subplot(1,2,2);
imshow(ImSP);
axis on; title('Image avec un bruit poivre et sel ');

%% Filtre moyenne et median des images bruités
figure;

Mpb=[1/9 1/9 1/9 ;1/9 1/9 1/9 ;1/9 1/9 1/9];
ImGfilMoy=imfilter(ImG,Mpb);
subplot(2,2,1);
imshow(ImGfilMoy);
axis on; title('Filtre moyenne pour une bruit gaussien');

ImGfilMed=medfilt2(ImG);
subplot(2,2,2);
imshow(ImGfilMed);
axis on; title('Filtre median pour une bruit gaussien');

ImSPfilMoy=imfilter(ImSP,Mpb);
subplot(2,2,3);
imshow(ImSPfilMoy);
axis on; title('Filtre moyenne pour une bruit poivre et sel');

ImSPfilMed=medfilt2(ImSP);
subplot(2,2,4);
imshow(ImSPfilMed);
axis on; title('Filtre median pour une bruit poivre et sel');

%% Filtre passe haut avec et sans moyenne des images bruités
MphA=[0 0 0 ; 0 1 0 ; 0 0 0 ]-Mpb;

ImAfilPasseHuatAvecMoyenne=imfilter(A,MphA);
subplot(1,2,1);
imshow(ImAfilPasseHuatAvecMoyenne);
axis on; title('Filtre passe haut avec moyenne');

MphS=[0 0 0 ; 0 9 0 ; 0 0 0 ]-9*Mpb;
ImAfilPasseHuatSansMoyenne=imfilter(A,MphS);
subplot(1,2,2);
imshow(ImAfilPasseHuatSansMoyenne);
axis on; title('Filtre passe haut sans moyenne');

%% Filtres accentuateur des images bruités
MacA=[0 0 0 ; 0 1 0 ; 0 0 0 ]-MphA;
ImAfilPasseHuatAvecMoyenne=imfilter(A,MacA);
subplot(1,2,1);
imshow(ImAfilPasseHuatAvecMoyenne);
axis on; title('Filtre accentuateur avec passe haut avec moyenne');

MacS=[0 0 0 ; 0 9 0 ; 0 0 0 ]-MphS;
ImAfilPasseHuatSansMoyenne=imfilter(A,MacS);
subplot(1,2,2);
imshow(ImAfilPasseHuatSansMoyenne);
axis on; title('Filtre accentuateur avec passe haut sans moyenne');

%% Filtres morphologiques
figure;

se=strel('disk',11);
B=imread('img\15.jpeg');

ErodeGris=imerode(A,se);
subplot(2,2,1);
imshow(ErodeGris);
axis on; title('érosion en niveuax de gris');

ErodeCol=imerode(B,se);
subplot(2,2,2);
imshow(ErodeCol);
axis on; title('érosion en couleur');

DilatGris=imdilate(A,se);
subplot(2,2,3);
imshow(DilatGris);
axis on; title('dilataion en niveuax de gris');

DilatCol=imdilate(B,se);
subplot(2,2,4);
imshow(DilatCol);
axis on; title('dilataion en couleur');

%% Fermeture et ouverture morphologiques
figure;
Fermeture=imerode(DilatGris,se);
subplot(1,2,1);
imshow(Fermeture);
axis on; title('Fermeture en niveuax de gris');

Ouverture=imdilate(ErodeGris,se);
subplot(1,2,2);
imshow(Ouverture);
axis on; title('Ouverture en niveuax de gris');

%% Trnasformer de Fourier d'une image
A=imread('img\Image1.jpeg');
figure;
Afft = fftshift(fft2(A));

subplot(1,4,1);
imshow(Afft);
axis on; title('Transformer');

subplot(1,4,2);
imshow(A);
axis on; title('Image orginal');

%module de TF(A)
AfftModule = log(1+abs(Afft));
subplot(1,4,3);
imshow(AfftModule,[]);
axis on; title('module de TF(A)');

%agrument de A
AfftArg = angle(Afft);
subplot(1,4,4);
imshow(AfftArg,[]);
axis on; title('arg(A)');
%% Image blanche avec un bruit gaussien 
figure;
WhitePic=A;
WhitePic(:,:)=255;
WhitePic=imnoise(WhitePic,'gaussian');
imshow(WhitePic);
axis on; title('image Blanche bruité');
%% Trnasformer de Fourier d'une image blanche
figure;
WhitePicfft = fftshift(fft2(WhitePic));
%module de TF(B)
AfftModule = log(1+abs(WhitePicfft));
subplot(1,2,1);
imshow(AfftModule,[]);
axis on; title('module de TF(B)');

%agrument de B
WhitePicArg = angle(WhitePicfft);
subplot(1,2,2);
imshow(WhitePicArg,[]);
axis on; title('arg(B)');






























