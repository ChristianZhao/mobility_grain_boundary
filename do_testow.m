fis = 0.08;
A = 2.5e-5;
q=1.6021766208*10^(-19); %C
c3 = polyfit(1./Temperature',log( Io_DLTS(A,uc,Temperature,fis,epsR,eps) )',1);
figure(6)
semilogy(1./Temperature', Io_DLTS(A,uc,Temperature,fis,epsR,eps),'x','MarkerSize',12)                  
hold on
y_est = polyval(c3,1./Temperature);
plot(1./Temperature,exp(y_est)','--','LineWidth',2)
hold off                  
title('I_0DLTS[mA/cm2] ~ domieszkowania')

fprintf('Ea:   %f, Io:   %f\n',-c3(1)*k/q,exp(c3(2)))


% c = polyfit(1./Temperature',log(all_mobilities(:,tmp)),1);
% plot(1./Temperature', log(all_mobilities(:,tmp)))

%% Do zapami�tania
    %ZMIENNE
    %temperatura
    % UWAGA: ka�da zmiana T powoduje, �e
    %        trzeba jeszcze raz przeliczy� ca�ki w Mathematice!!!
%     Temperature = [300,250,200,150,100];
%     T=Temperature(5);%K
    %szeroko�� ziarna
%     L=1e-6;%m
    %szeroko�� granicy ziarna
%     delta=2e-9;%m
    % g�sto�� przestrzenna �adunku na granicy ziaren 
%     Qt=0.2e10*1e4;%m^-2
    % po�o�enie Et wzgl�dem Ei
%     Et=0.25*q;%eV
    % szeroko�� po��wkowa 
    % UWAGA: ka�da zmiana delta_Et (bazowo: 0.083q) powoduje, �e
    %        trzeba jeszcze raz przeliczy� ca�ki w Mathematice!!!
%     delta_Et = 0.083*q;
    %przerwa energetyczna
%     Eg = 1.20*q;
    % przenikalno�� elektryczna wzgl�dna
%     epsR = 13;