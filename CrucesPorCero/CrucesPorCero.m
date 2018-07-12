% INTENSIDAD DE CRUCES POR CERO
% No=CrucesPorCero(reg,Fs,ti,tf)
%
% INPUT
% reg: Registro de Aceleraciones [g]
% Fs: Frecuencia de Muestreo [Hz]
% ti: Tiempo Inicial [s]
% tf: Tiempo Final [s]
% 106

% OUTPUT
% No: Intensidad de Cruces por Cero [1/s]
function No=CrucesPorCero(reg,dx,ti,tf)
  n   = length(reg);
  t   = [0,linspace(dx,dx*(n-1),(n-1))];
  tc1 = false; tc2=false;

  for j=1:length(t)
    if t(j)>=ti && tc1==false
      ki=j; tc1=true;
    end

    if t(j)>=tf && tc2==false
      kf=j; tc2=true;
    end
  end

  nu=0;

  for i=ki:kf-1
    if reg(i)*reg(i+1)<0
      nu=nu+1;
    end
  end
  tiempo=t(kf)-t(ki);
  No=nu/tiempo;
end
