clc
clear
ORLPath= ['/Users/fuyou/Desktop/ORL/s01';'/Users/fuyou/Desktop/ORL/s02';'/Users/fuyou/Desktop/ORL/s03';'/Users/fuyou/Desktop/ORL/s04';'/Users/fuyou/Desktop/ORL/s05';];
BMPPath = ['_01.jpg';'_02.jpg';'_03.jpg';'_04.jpg';'_05.jpg';'_06.jpg';'_07.jpg';'_08.jpg';'_09.jpg';'_00.jpg';'_11.jpg';'_12.jpg';'_13.jpg';'_14.jpg';'_15.jpg';'_16.jpg';'_17.jpg';'_18.jpg';'_19.jpg';'_20.jpg';'_21.jpg';'_22.jpg';'_23.jpg';'_24.jpg';'_25.jpg';'_26.jpg';'_27.jpg';'_28.jpg';'_29.jpg';'_30.jpg';'_31.jpg';'_32.jpg';'_33.jpg';'_34.jpg';'_35.jpg';'_36.jpg';'_37.jpg';'_38.jpg';'_39.jpg';'_40.jpg';'_41.jpg';'_42.jpg';'_43.jpg';'_44.jpg';'_45.jpg';'_46.jpg';'_47.jpg';'_48.jpg';'_49.jpg';'_50.jpg';];
% ??????A(:,:,i)  
s=5;
s5=50*s;
for i = 1: s
    for j = 1:50 
        w =[ORLPath(i,:), BMPPath(j,:)]; 
        a =double(rgb2gray(imread(w)));              % ??????????????? 
        A (:,:,(i-1)*50 +j) = a; 
    end 
end 
% ????? ef ????????  
ef=zeros(64,64); 
for i=1: s5
    ef=ef+A(:,:,i); 
end 
ef=ef/s5;                 %???ef
Gt=zeros(64,64);
for i=1:s5
     Gt= Gt+(A(:,:,i)-ef)'*(A(:,:,i)-ef);    % ????Gt 
   end
Gt=Gt/s5 ;
[V,D]=eig(Gt);       % ??Gt????V???????D 
d=diag(D);          % ??D??????d
[d1,index]=dsort(d);       % ?????????d??????????d1????index????d1?????d????
n=1;                           % ????n???????
for i=1:n
       X(:,i)=V(:,index(i));   % n????????????????????? X??92?n?
   end
 for i=1:s5     
        Y(:,:,i)=A(:,:,i)*X;       %  ????????? ?????X ???????????Y??112?92?*?92?n?=?112?n?
 end
    BMPPath = ['_51.jpg';'_52.jpg';'_53.jpg';'_54.jpg';'_55.jpg';'_56.jpg';'_57.jpg';'_58.jpg';'_59.jpg';'_60.jpg';'_61.jpg';'_62.jpg';'_63.jpg';'_64.jpg';'_65.jpg';'_66.jpg';'_67.jpg';'_68.jpg';'_69.jpg';'_70.jpg';'_71.jpg';'_72.jpg';'_73.jpg';'_74.jpg';'_75.jpg';'_76.jpg';'_77.jpg';'_78.jpg';'_79.jpg';'_80.jpg';'_81.jpg';'_82.jpg';'_83.jpg';'_84.jpg';'_85.jpg';'_86.jpg';'_87.jpg';'_88.jpg';'_89.jpg';'_90.jpg';'_91.jpg';'_92.jpg';'_93.jpg';'_94.jpg';'_95.jpg';'_96.jpg';'_97.jpg';'_98.jpg';'_99.jpg';'_00.jpg';];  % ????
for i = 1:s  
   for j = 1:50
       w = [ORLPath(i,:), BMPPath(j,:)]; 
       b = double(rgb2gray(imread(w))); 
       B(:,:,50*(i-1)+j)=b;             % ????B?200?????????S01_6,S01_7,S01_8,S01_9,S01_0,  S02_6,S02_7,S02_8,S02_9,S02_0,.........
   end 
end
for i=1:s5
    YT(:,:,i)=(B(:,:,i))*X;                    %   ?????B????????????? ?????? ?????YT
 end
 err=0;   ok=0;   ERR=ones(s5,1)  ;                        % ????? 
    Aclass=zeros(s,1);                  % ??????? 
    Bclass=zeros(s5,1);                  % ???????????? 
    Bresult=zeros(s5,1);                 % ???????????? 
   for ac=1:s
    Aclass(ac)=ac;                % ????????1 2 3 4 5  ..... 40
   end
for bc=1:s5
      Bclass(bc)=ceil(bc/50);                % ?????????  11111 22222 33333 444444 ......
end
for i=1:s5 
                       % ? i ???????????????
  
        for j=1:50:201
                     k=(j+49)/50;     % ??k??
                     YD(k,:)=norm(YT(:,:,i)-Y(:,:,j),'fro')+norm(YT(:,:,i)-Y(:,:,j+1),'fro')+norm(YT(:,:,i)-Y(:,:,j+2),'fro')+norm(YT(:,:,i)-Y(:,:,j+3),'fro')+norm(YT(:,:,i)-Y(:,:,j+4),'fro')+norm(YT(:,:,i)-Y(:,:,j+5),'fro')+norm(YT(:,:,i)-Y(:,:,j+6),'fro')+norm(YT(:,:,i)-Y(:,:,j+7),'fro')+norm(YT(:,:,i)-Y(:,:,j+8),'fro')+norm(YT(:,:,i)-Y(:,:,j+9),'fro')+norm(YT(:,:,i)-Y(:,:,j+10),'fro')+norm(YT(:,:,i)-Y(:,:,j+11),'fro')+norm(YT(:,:,i)-Y(:,:,j+12),'fro')+norm(YT(:,:,i)-Y(:,:,j+13),'fro')+norm(YT(:,:,i)-Y(:,:,j+14),'fro')+norm(YT(:,:,i)-Y(:,:,j+15),'fro')+norm(YT(:,:,i)-Y(:,:,j+16),'fro')+norm(YT(:,:,i)-Y(:,:,j+17),'fro')+norm(YT(:,:,i)-Y(:,:,j+18),'fro')+norm(YT(:,:,i)-Y(:,:,j+19),'fro')+norm(YT(:,:,i)-Y(:,:,j+20),'fro')+norm(YT(:,:,i)-Y(:,:,j+21),'fro')+norm(YT(:,:,i)-Y(:,:,j+22),'fro')+norm(YT(:,:,i)-Y(:,:,j+23),'fro')+norm(YT(:,:,i)-Y(:,:,j+24),'fro')+norm(YT(:,:,i)-Y(:,:,j+25),'fro')+norm(YT(:,:,i)-Y(:,:,j+26),'fro')+norm(YT(:,:,i)-Y(:,:,j+27),'fro')+norm(YT(:,:,i)-Y(:,:,j+28),'fro')+norm(YT(:,:,i)-Y(:,:,j+29),'fro')+norm(YT(:,:,i)-Y(:,:,j+30),'fro')+norm(YT(:,:,i)-Y(:,:,j+31),'fro')+norm(YT(:,:,i)-Y(:,:,j+32),'fro')+norm(YT(:,:,i)-Y(:,:,j+33),'fro')+norm(YT(:,:,i)-Y(:,:,j+34),'fro')+norm(YT(:,:,i)-Y(:,:,j+35),'fro')+norm(YT(:,:,i)-Y(:,:,j+36),'fro')+norm(YT(:,:,i)-Y(:,:,j+37),'fro')+norm(YT(:,:,i)-Y(:,:,j+38),'fro')+norm(YT(:,:,i)-Y(:,:,j+39),'fro')+norm(YT(:,:,i)-Y(:,:,j+40),'fro')+norm(YT(:,:,i)-Y(:,:,j+41),'fro')+norm(YT(:,:,i)-Y(:,:,j+42),'fro')+norm(YT(:,:,i)-Y(:,:,j+43),'fro')+norm(YT(:,:,i)-Y(:,:,j+44),'fro')+norm(YT(:,:,i)-Y(:,:,j+45),'fro')+norm(YT(:,:,i)-Y(:,:,j+46),'fro')+norm(YT(:,:,i)-Y(:,:,j+47),'fro')+norm(YT(:,:,i)-Y(:,:,j+48),'fro')+norm(YT(:,:,i)-Y(:,:,j+49),'fro');                      % ?i???????k???5?????????
                     
        end
       
        

    [Min,IND]=sort(YD);      % ??????,???????????? 
    Bresult(i)=Aclass(IND(1)); 
    if Bresult(i)~=Bclass(i)                % ????? 
        err=err+1; ERR(i)=1;
    end 
    if   Bresult(i)==Bclass(i)                           % ????
                      ok=ok+1;ERR(i)=0;
    end
 end

recognize=['recognition rate:',num2str((1-err/s5)*100),'%'];
