A=imread('BitMapImages/A.bmp');
B=imread('BitMapImages/B.bmp');
C=imread('BitMapImages/C.bmp');
D=imread('BitMapImages/D.bmp');
E=imread('BitMapImages/E.bmp');
F=imread('BitMapImages/F.bmp');
G=imread('BitMapImages/G.bmp');
H=imread('BitMapImages/H.bmp');
I=imread('BitMapImages/I.bmp');
J=imread('BitMapImages/J.bmp');
K=imread('BitMapImages/K.bmp');
L=imread('BitMapImages/L.bmp');
M=imread('BitMapImages/M.bmp');
N=imread('BitMapImages/N.bmp');
O=imread('BitMapImages/O.bmp');
P=imread('BitMapImages/P.bmp');
Q=imread('BitMapImages/Q.bmp');
R=imread('BitMapImages/R.bmp');
S=imread('BitMapImages/S.bmp');
T=imread('BitMapImages/T.bmp');
U=imread('BitMapImages/U.bmp');
V=imread('BitMapImages/V.bmp');
W=imread('BitMapImages/W.bmp');
X=imread('BitMapImages/X.bmp');
Y=imread('BitMapImages/Y.bmp');
Z=imread('BitMapImages/Z.bmp');

one=imread('BitMapImages/1.bmp');
two=imread('BitMapImages/2.bmp');
three=imread('BitMapImages/3.bmp');
four=imread('BitMapImages/4.bmp');
five=imread('BitMapImages/5.bmp'); 
six=imread('BitMapImages/6.bmp');
seven=imread('BitMapImages/7.bmp');
eight=imread('BitMapImages/8.bmp');
nine=imread('BitMapImages/9.bmp'); 
zero=imread('BitMapImages/0.bmp');

letters=[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z];
numbers=[one two three four five six seven eight nine zero];
characters = [letters numbers];
NewTemplates=mat2cell(characters,42,[24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24 24]);
save ('NewTemplates','NewTemplates')
clear all