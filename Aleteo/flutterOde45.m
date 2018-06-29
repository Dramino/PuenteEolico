%% Programa para obtener los desplazamientos para 8 derivadas aerodinámicas

clear
close all
proDim = 9;
derAer = 8;
proVie = 2;
proSim = 5;
coeAer = 5;
propiedades = proDim + derAer + proVie + proSim + coeAer;
datos       = importar(propiedades);

rho = datos(1);
m   = datos(2);
I   = datos(3);
B   = datos(4);
wh  = datos(5);
wa  = datos(6);
w   = datos(7);
ch  = datos(8);
ca  = datos(9);
H1  = datos(10);
H2  = datos(11);
H3  = datos(12);
H4  = datos(13);
A1  = datos(14);
A2  = datos(15);
A3  = datos(16);
A4  = datos(17);
Cd  = datos(18);
Cl  = datos(19);
Cm  = datos(20);
dCl = datos(21);
dCm = datos(22);
V   = datos(23);
h0  = datos(24);
a0  = datos(25);
vh  = datos(26);
va  = datos(27);
t   = datos(28);
dh  = datos(29);


Vr    = V/(w*B);
%[H,A] =derAerSC(Vr);

[velU,velV] = importarVel();
   
%% Constantes autoexitables
k=B*w/V;
q=1/2*rho*V^2;

h1 = H1 / m * q * B * k / V;
h2 = H2 / m * q * B * k / V;
h3 = H3 / m * q * B * k^2 ;
h4 = H4 / m * q * B * k^2 / B;

a1 = A1 / I * q * B^2 * k / V;
a2 = A2 / I * q * B^2 * k / V;
a3 = A3 / I * q * B^2 * k^2;
a4 = A4 / I * q * B^2 * k^2 / B;

%constantes por ráfagas
b1 = q * B / V / m * 2 * Cl;
b2 = q * B / V / m * (dCl + Cd);
b3 = q * B ^2 / V / I * 2* Cm;
b4 = q * B ^2 / V / I * dCm;

constB=[b1 b2 b3 b4];
%% Soluci󮿊df = 'flut8a';

C1 = h3-wh^2;       % h
C2 = h4;            % a
C3 = h1 - 2 *ch*wh; % dh
C4 = h2;            % da
C5 = a3;            % h
C6 = a4 - wa^2;     % a
C7 = a1;            % dh
C8 = a2-2*ca*wa;    % da

constHA=[C1 C2  C3 C4 C5 C6 C7 C8];
t0 = 0; tf = t; x0 = [h0 a0 vh va]; %start/final time and initial value

df = 'flut8a45';
tic
[t45,x45] = ode45(df,[t0 tf],x0,[],constHA,constB,velU,velV,dh);
toc
maxH=abs(max(x45(:,1)))
graficar(t45,x45);

%% Funcion de importar
function mDatos=importar(numDatos)

	[archivo,direccion] = uigetfile({'*.txt'},'File Selector');

	dirCom     = strcat(direccion,archivo);
	archivoID  = fopen(dirCom,'r');
	datos      = textscan(archivoID, '%s','Delimiter', '\n');
	matriz     = datos{1};
	
	fclose(archivoID);

	varConst  = zeros(1,numDatos);
	revConst  = false;
	numConst  = 0;
	for i = 1 : length(matriz)
		if revConst == false
			constante = strsplit(matriz{i},'=');
			if length (constante)== 2
				num                = str2double(strsplit(constante{2}));
				numConst           = numConst + 1;
				varConst(numConst) = num(2);
				if numConst == numDatos, revConst=true; end           
			end
			
		end
	end
	mDatos=varConst;
end

function [u,v]= importarVel()
	[archivo,direccion] = uigetfile({'*.txt'},'File Selector');
	dirCom = strcat(direccion,archivo);
	vel    = dlmread(dirCom,'',1,0);
	u      = vel(:,1);
	v      = vel(:,2);
end

function graficar(t,x)
	subplot(2,2,1)
	plot(t,x(:,1),'b','LineWidth',1.25)
	xlabel('$t$[s]','Interpreter','latex','Fontsize',11)
	ylabel('$h$[m]','Interpreter','latex','Fontsize',11)
	grid on

	subplot(2,2,2)
	plot(t,x(:,2),'b','LineWidth',1.25)
	xlabel('$t$[s]','Interpreter','latex','Fontsize',11)
	ylabel('$\alpha$[rad]','Interpreter','latex','Fontsize',11)
	grid on

	subplot(2,2,3)
	plot(t,x(:,3),'b','LineWidth',1.25)
	xlabel('$t$[s]','Interpreter','latex','Fontsize',11)
	ylabel('$V_h$[m/s]','Interpreter','latex','Fontsize',11)
	grid on

	subplot(2,2,4)
	plot(t,x(:,4),'b','LineWidth',1.25)
	xlabel('$t$[s]','Interpreter','latex','Fontsize',11)
	ylabel('$V_{\alpha}$[rad/s]','Interpreter','latex','Fontsize',11)
	grid on
	

end
