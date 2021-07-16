% TP3 Filtrage 
% 1- lecture de l'image cameraman .JPEG

figure;
A=imread('TP3\cameraman.jpg');
s=size(A);
imshow(A);
axis on; title('L''Image de cameraman ');

% 2- le trac� de l'histrogramme de l'image  
figure;
Histogramme=imhist(A);
plot(Histogramme);
axis on; title('Trac� de l''Histogramme de L''image Cameraman');

% 3- Translation de l'histogramme 
% on fait le traitement pour chaque pixel de l'image 
% 3-a- translation de l'histrogramme vers la droite 
B=A; 
for i=1:s(1)
    for j=1:s(2)
        B(i,j)=B(i,j)+100;
        if(B(i,j)>255)
            B(i,j)=255;
        end;
    end;
end;
% on aura comme resultat une image claire 
% 3-b- translation de l'histogramme vers la gauche
C=A;
for i=1:s(1)
    for j=1:s(2)
        C(i,j)=C(i,j)-100;
        if(C(i,j)<50)
            C(i,j)=0;
        end;
    end;
end;
% on aura une image sombre dans ce cas 
figure;
subplot(1,3,1);imshow(A);axis on; title('Image initiale ');
subplot(1,3,2);imshow(B);axis on; title('Image apr�s translation � droite ');
subplot(1,3,3);imshow(C);axis on; title('Image apr�s translation � gauche ');

% 4- chargement de l'image trui 
figure;
D=imread('TP3\trui.png');
imshow(D);
axis on; title('L''Image trui');

% 5- application du masque Wx de sobel et affichage des r�sultats 
Wx=[-1 0 1;-2 0 2;-1 0 1];
Dx=imfilter(D,Wx);
% 6- application du masque Wy de sobel et affichage des r�sultats 
Wy=[-1 -2 -1;0 0 0;1 2 1];
Dy=imfilter(D,Wy);

figure;
subplot(1,3,1); imshow(Dx); title('Application du masque Wx de sobel');
subplot(1,3,2); imshow(Dy); title('Application du masque Wy de sobel');
% 7- L'image qui donne le module du gradient 
subplot(1,3,3); imshow(max(Dx,Dy)); title('Le module du Gradient d''image');

% 8-a- G�n�ration de la TF d'un filtre pass bas de meme taille que l'image cameraman
% on prend la taille de l'image cameraman d'abord 
[x,y]=size(A);

% Transformer de fourier 
TFA=fft2(A);

% le filtre pass bas en domaine frequentiel 
FPB=zeros(x,y);

% on varie la fr�quence de coupure (U0,V0)
for i=x/2-10:x/2+10;
    for j=y/2-10:y/2+10;
        FPB(i,j)=1;
    end;
end;

% Filtre passe bas dans le domaine fr�quentiel tlqs le produit �l�ment par
% �l�menet
AFPB=TFA.*fftshift(FPB);

figure;

subplot(1,2,1); imshow(abs(fftshift(AFPB)));
imgf=ifft2(AFPB);
subplot(1,2,2); imshow(imgf,[]);

% 9- on refait le meme travail du question 8 
[v,w]=size(A);

% Transformer de fourier
TFB=fft2(A);

% le filtre pass haut en domaine frequentiel 
FPH=ones(v,w);

% on fait varier une fr�quence de coupure 
for i=v/2-10:v/2+10;
    for j=w/2-10:w/2+10
        FPH(i,j)=0;  
    end;
end;

% Filtre passe haut dans le domaine fr�quentiel 
AFPH=TFB.*fftshift(FPH);

% On affiche le transformer inverse de fourier
figure;
subplot(1,2,1); imshow(abs(fftshift(AFPH))); axis on;
imff=ifft2(AFPH);
subplot(1,2,2);imshow(imff,[]); axis on; title('Filtre passe haut ');






