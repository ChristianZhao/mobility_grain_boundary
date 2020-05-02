fis = 0.07;
A = 2e-6;
c = polyfit(1./Temperature', ...
            log(A*uc*Nv(Temperature).*...
            Emax(fis,0,1e21,epsR*eps).*...
            exp(-q*fis./(k*Temperature)) )'...
            ,1);
figure(6)
plot(1./Temperature', log(A*uc*Nv(Temperature).*...
                      Emax(fis,0,1e21,epsR*eps).*...
                      exp(-q*fis./(k*Temperature)) )')
(-c(1)*k/q)
exp(c(2))

c = polyfit(1./Temperature',log(all_mobilities(:,tmp)),1);
plot(1./Temperature', log(all_mobilities(:,tmp)))

%% Do zapami�tania
    %ZMIENNE
    %temperatura
    % UWAGA: ka�da zmiana T powoduje, �e
    %        trzeba jeszcze raz przeliczy� ca�ki w Mathematice!!!
    Temperature = [300,250,200,150,100];
    T=Temperature(5);%K
    %szeroko�� ziarna
    L=1e-6;%m
    %szeroko�� granicy ziarna
    delta=2e-9;%m
    % g�sto�� przestrzenna �adunku na granicy ziaren 
    Qt=0.2e10*1e4;%m^-2
    % po�o�enie Et wzgl�dem Ei
    Et=0.25*q;%eV
    % szeroko�� po��wkowa 
    % UWAGA: ka�da zmiana delta_Et (bazowo: 0.083q) powoduje, �e
    %        trzeba jeszcze raz przeliczy� ca�ki w Mathematice!!!
    delta_Et = 0.083*q;
    %przerwa energetyczna
    Eg = 1.20*q;
    % przenikalno�� elektryczna wzgl�dna
    epsR = 13;