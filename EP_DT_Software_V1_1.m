close all; clear all; clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Matlab EP Software Auto Plot - 21/02/2018
%   G B Pintarelli 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%inputs here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load('09-600') % File with pulse information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Remove Zero Artifacts %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P1 = NormalizePulse(P1);
P2 = NormalizePulse(P2);
P3 = NormalizePulse(P3);
P4 = NormalizePulse(P4);
P5 = NormalizePulse(P5);
P6 = NormalizePulse(P6);
P7 = NormalizePulse(P7);
P8 = NormalizePulse(P8);

PlotSinglePulse(P1);
PlotVs(P1,P2,P3,P4,P5,P6,P7,P8);
PlotIs(P1,P2,P3,P4,P5,P6,P7,P8);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Organize and Multiple Pulses in Matrix Px %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Px(linha,coluna,NPulso)
% Linhas = Valores de tempo
% Colunas: 1=Tempo, 2=V, 3=I, 4=H, 5=S
Px(:,:,1) = P1(:,:);
Px(:,:,2) = P2(:,:);
Px(:,:,3) = P3(:,:);
Px(:,:,4) = P4(:,:);
Px(:,:,5) = P5(:,:);
Px(:,:,6) = P6(:,:);
Px(:,:,7) = P7(:,:);
Px(:,:,8) = P8(:,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% EP Angle %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EP Angle V %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for p = 1:max(size(Px(1,1,:))) % Cria matriz "med_V_each_pulse"
    for c = 1:max(size(Px(:,1)))
            med_V_each_pulse(p) = 0;
            a(p) = 0;
    end
end

for p = 1:max(size(Px(1,1,:))) % size(Px(1,1,:)) = numero de pulsos (8)
    for c = 1:max(size(Px(:,1))) % size(Px(1,1,:)) = numero de amostras total por intervalo de pulso (50)
        if Px(c,5,p) == 1 % Situação pulso positivo (S e H em 'ON')
            if Px(c,4,p) == 1 % Situação pulso positivo (H e S em 'ON')
                if Px(c,1,p) >= 60 % Delay introduzido nessa linha (somente conta a metade final do pulso para med da corrente!!!)
                    med_V_each_pulse(p) = Px(c,2,p) + med_V_each_pulse(p);
                    a(p)=a(p)+1; %(numero de leituras durante parte alta do pulso)
                end
            end
        end
    end
    med_V_each_pulse(p) = med_V_each_pulse(p)/a(p); % a/max(size(Px(1,1,:)))=19 (+/-)
end

for p = 1:max(size(Px(1,1,:))) % Cria matriz dos pulsos V medio (somente para plot)
    for c = 1:max(size(Px(:,1)))
        if Px(c,5,p) == 1
            if Px(c,4,p) == 1
                P_med(c,2,p) = med_V_each_pulse(p);
            end
        else
             P_med(c,2,p) = 0;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EP Angle I %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for p = 1:max(size(Px(1,1,:))) % Cria matriz "med_V_each_pulse"
    for c = 1:max(size(Px(:,1)))
            med_I_each_pulse(p) = 0;
            a(p) = 0;
    end
end

for p = 1:max(size(Px(1,1,:))) % size(Px(1,1,:)) = numero de pulsos (8)
    for c = 1:max(size(Px(:,1))) % size(Px(1,1,:)) = numero de amostras total por intervalo de pulso (50)
        if Px(c,5,p) == 1 % Situação pulso positivo (S e H em 'ON')
            if Px(c,4,p) == 1 % Situação pulso positivo (H e S em 'ON')
                if Px(c,1,p) >= 60 % Delay introduzido nessa linha (somente conta a metade final do pulso para med da corrente!!!)
                    med_I_each_pulse(p) = Px(c,3,p) + med_I_each_pulse(p);
                    a(p)=a(p)+1; %(numero de leituras durante parte alta do pulso)
                end
            end
        end
    end
    med_I_each_pulse(p) = med_I_each_pulse(p)/a(p); % a/max(size(Px(1,1,:)))=19 (+/-)
end

for p = 1:max(size(Px(1,1,:))) % Cria matriz dos pulsos V medio (somente para plot)
    for c = 1:max(size(Px(:,1)))
        if Px(c,5,p) == 1
            if Px(c,4,p) == 1
                P_med(c,3,p) = med_I_each_pulse(p);
            end
        else
             P_med(c,3,p) = 0;
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Organize Multiple Pulses in Single Variable Pz %%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:max(size(Px(1,:,1)))
    for j = 1:max(size(Px(:,1,1)))
        for z = 1:max(size(Px(1,1,:)))
            Pz(j+z*max(size(Px(:,1,1)))-max(size(Px(:,1,1))),i) = Px(j,i,z);
        end
    end  
end

for i = 1:max(size(P_med(1,:,1)))
    for j = 1:max(size(P_med(:,1,1)))
        for z = 1:max(size(P_med(1,1,:)))
            Pz_med(j+z*max(size(P_med(:,1,1)))-max(size(P_med(:,1,1))),i) = P_med(j,i,z);
        end
    end  
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

meanV8 = mean(med_V_each_pulse);
meanI8 = mean(med_I_each_pulse);

% Z=V/I %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:max(size(Px(1,1,:))) % size(Px(1,1,:)) = numero de pulsos (8)
    %Z_med(i) = med_V_each_pulse(i)/med_I_each_pulse(i);
    Z_med(i) = meanV8/med_I_each_pulse(i);
    %Z_med(i) = 250/med_I_each_pulse(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Plot Multiple Pulses %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
hold on;
subplot(2,1,1); plot(Pz(:,2),'r-o','LineWidth',2); hold on; plot(Pz_med(:,2),'b','LineWidth',1); %V
ylabel('Voltage [V]'); xlabel('Sample [n]'); legend('V');

subplot(2,1,2); plot(Pz(:,3),'r-o','LineWidth',2); hold on; plot(Pz_med(:,3),'b','LineWidth',1); %I
ylabel('Current [A]'); xlabel('Sample [n]'); legend('I');
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Line Plot V and I %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(2,1,1);plot(med_V_each_pulse,'b--o','LineWidth',2);
ylabel('Med Voltage Per Pulse [V]'); xlabel('Sample [n]');

subplot(2,1,2);plot(med_I_each_pulse,'b--o','LineWidth',2);
ylabel('Med Current Per Pulse [A]'); xlabel('Sample [n]');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Line Plot Z %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
plot(Z_med,'b--o','LineWidth',2);
ylabel('Med |Z| per pulse'); xlabel('Sample [n]');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
