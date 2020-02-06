Ef       = -0.015901907378312;
delta_Qt = 3.5927e+14;
p_L2     = 2.2855e+16;
pgb      = 9.0209e+16;

%gl�wny parametr:
Na=1e21; %m^-3

q=1.6021766208*10^(-19);
k = 1.38064852*10^(-23); %J/K
T=300;%K
eps = 13*8.85*10^-12;%A^2 s^4 / kh m^3 
epsR = 12;
e_eff_mass = 0.09;
h_eff_mass = 0.72;
Nc = 2.5*10^19*((e_eff_mass)^(3/2))*(T/300)^(3/2);
Nv= 2.5*10^19*((h_eff_mass)^(3/2))*(T/300)^(3/2);
Eg = 1*q;
ni = sqrt(Nv*Nc)*exp(-Eg/(2*k*T))*1e6;

%szeroko�� ziarna:
L=1e-6;%m
%szeroko�c granicy mi�dzy ziarnami:
delta=1e-7;%m  
deltaE = 0.05*q;

Vb = q*Na*L^2/(8*eps*epsR);
%PARAMETRY BEZPO�REDNIE (potrzebne do policzenia Ef i tylko tyle)
Et=0.0*q;
delta_Et = 0.08*q;
delta_eps = delta_Et/(2*sqrt( log(2) ));
Qt=1e13*1e4;
% lambda_2_0     = Et/delta_eps;
% lambda_2_minus = ( 0.26*delta_eps/(k*T) - lambda_2_0 )/sqrt( 1+0.1*(delta_eps/k*T)^2 );
% lambda_2_plus  = ( 0.26*delta_eps/(k*T) + lambda_2_0 )/sqrt( 1+0.1*(delta_eps/k*T)^2 );
% 
% %zmienne zale�ne od Ef (wi�c b�d� zmienne w r�wnaniu)
% lambda_2_0_Ef = (q*Ef+Et+q*Vb)/delta_eps;
% lambda_2_minus_Ef = ( 0.26*delta_eps/(k*T) - lambda_2_0_Ef )/sqrt( 1+0.1*(delta_eps/k*T)^2 );
% lambda_2_plus_Ef  = ( 0.26*delta_eps/(k*T) + lambda_2_0_Ef )/sqrt( 1+0.1*(delta_eps/k*T)^2 );
% 
% 
% G_Ef = erfc(sqrt(lambda_2_0_Ef))+0.5*exp(lambda_2_0_Ef)*( ...
%                                             exp(lambda_2_minus_Ef)*erfc(sqrt(lambda_2_minus_Ef)) ...
%                                           - exp(lambda_2_plus_Ef )*erfc(sqrt(lambda_2_plus_Ef )));
% 
% G_0  = erfc(sqrt(lambda_2_0   ))+0.5*exp(lambda_2_0   )*( ...
%                                             exp(lambda_2_minus   )*erfc(sqrt(lambda_2_minus   )) ...
%                                           - exp(lambda_2_plus    )*erfc(sqrt(lambda_2_plus    )));
b1 = (q*Ef+Et+q*Vb)/(k*T);                                       
Q1 =  1.64696 - 0.844494 * exp((0.386513 - 0.0743295 * b1)* b1) + ... 
      exp((-0.386513 - 0.0743295 *b1) *b1) * (0.844494 - 0.844494 * erf(0.416573 - 0.46392*b1)) + ...
      0.844494 * exp((0.386513 - 0.0743295 *b1) *b1)* erf(0.416573 + 0.46392 * b1) - ... 
      1.64696 * erf(0.5381 * b1);
b2 = (Et)/(k*T);                                       
Q2 =  1.64696 - 0.844494 * exp((0.386513 - 0.0743295 * b2)* b2) + ... 
      exp((-0.386513 - 0.0743295 *b2) *b2) * (0.844494 - 0.844494 * erf(0.416573 - 0.46392*b2)) + ...
      0.844494 * exp((0.386513 - 0.0743295 *b2) *b2)* erf(0.416573 + 0.46392 * b2) - ... 
      1.64696 * erf(0.5381 * b2);


% pgb      - p_L2*exp(-(q*Vb-deltaE)/(k*T))
% p_L2     - ni*exp(-q*Ef/(k*T))
% %delta_Qt - 0.5*Qt*(G_Ef - G_0)
% delta_Qt - Qt*(k*T/(sqrt(pi)*delta_eps))*(Q1-Q2)
% Na*L     - delta_Qt - delta*pgb

Na*L -  Qt*(k*T/(sqrt(pi)*delta_eps))*(Q1-Q2) - delta*ni*exp(-q*Ef/(k*T))*exp(-(q*Vb-deltaE)/(k*T))
