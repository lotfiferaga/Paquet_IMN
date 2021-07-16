% TP1 IMN 

% Manipuler les images num�riques 

% Lecture d'une image  en couleur de format .JPEG
picture=imread('TP1\166859811_232478065234811_5828548459302644229_n.jpg','JPG');
subplot(3,3,1);
% Affichage de l'image sur �cran 
imshow(picture);
axis on;title(' Image en format JPG  ');

% Afficher ses dimensions 
size(picture);
xlabel(size(picture));

% sauvegarde de l'image sous format PNG et TIFF
imwrite(picture,'TP1\new.png','png');
imwrite(picture,'TP1\new.tiff','tiff');

%affichage des nouveaux dimensions et tailles 
PicturePng=imread('TP1\new.png');
PictureTiff=imread('TP1\new.tiff');
% affichage d'image PNG
subplot(3,3,2);
imshow(PicturePng);
xlabel(size(PicturePng));
axis on;title('Image en format PNG');
% affichage d'image TIFF
subplot(3,3,3);
imshow(PictureTiff);
xlabel(size(PictureTiff));
axis on;title('Image en format TIFF');

%affichage de la premi�re image en diff�rents niveaux de couleurs 
% niveaux de rouge
rouge=picture;
rouge(:,:,[2 3])=0;
subplot(3,3,4);
imshow(rouge);
axis on; title('Image en niveaux de rouge');
%niveaux de vert
vert=picture;
vert(:,:,[1 3])=0;
subplot(3,3,5);
imshow(vert);
axis on; title('Image en niveaux de vert');
%niveaux de bleu
bleu=picture;
bleu(:,:,[1 2])=0;
subplot(3,3,6);
imshow(bleu);
axis on; title('Image en niveaux de bleu');

% Conversion de l'image en niveaux gris 

ImageGris=rgb2gray(picture);
subplot(3,3,7);
imshow(ImageGris);
axis on; title('Image au niveaux de gris');

% Conversion de l'image en binaire
% pkg load image en ligne de commande      
ImageBinaire=im2bw(picture);
subplot(3,3,8);
imshow(ImageBinaire);
axis on; title('Image En Binaire');

% reconstruction de l'image en utilisant les trois couleurs 
firstpic=picture;
RC = picture(:,:,1);
GC = picture(:,:,2);
BC = picture(:,:,3);
subplot(3,3,9);
im = cat(3,RC,GC,BC);
isequal(picture,im);
imshow(im);
axis on; title('Image reconstruite');

% trouvant l'inverse de la premi�re image et on l'affiche sur �cran 
inverse(:,:,:)=255-picture(:,:,:);
figure(2);
imshow(inverse);
axis on; title('Inverse de la premiere image');




