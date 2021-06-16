function letter = readLetter(Image)

load NewTemplates 
global NewTemplates 
Image = imresize(Image,[42 24]); 
record=[ ];

for n=1:length(NewTemplates)
    corr = corr2(NewTemplates{1,n},Image); 
    record = [record corr]; 
end

index = find(record == max(record));

if index==1 
    letter='A';
elseif index==2 
    letter='B';
elseif index==3
    letter='C';
elseif index==4 
    letter='D';
elseif index==5
    letter='E';
elseif index==6
    letter='F';
elseif index==7
    letter='G';
elseif index==8
    letter='H';
elseif index==9
    letter='I';
elseif index==10
    letter='J';
elseif index==11
    letter='K';
elseif index==12
    letter='L';
elseif index==13
    letter='M';
elseif index==14
    letter='N';
elseif index==15 
    letter='O';
elseif index==16
    letter='P';
elseif index==17
    letter='Q';
elseif index==18
    letter='R';
elseif index==19
    letter='S';
elseif index==20
    letter='T';
elseif index==21
    letter='U';
elseif index==22
    letter='V';
elseif index==23
    letter='W';
elseif index==24
    letter='X';
elseif index==25
    letter='Y';
elseif index==26
    letter='Z';
elseif index==27
    letter='1';
elseif index==28
    letter='2';
elseif index==29
    letter='3';
elseif index==30 
    letter='4';
elseif index==31
    letter='5';
elseif index==32 
    letter='6';
elseif index==33
    letter='7';
elseif index==34
    letter='8';
elseif index==35
    letter='9';
else
    letter='0';
end
end