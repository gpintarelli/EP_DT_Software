function [ ] = PlotVs( Pa , Pb, Pc, Pd, Pe, Pf, Pg, Ph )

% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% V/I Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
hold on;

plot(Pa(:,1),Pa(:,2),'b-o','LineWidth',2); %V1
plot(Pb(:,1),Pb(:,2),'g-o','LineWidth',2); %V2
plot(Pb(:,1),Pc(:,2),'r-o','LineWidth',2); %V3
plot(Pb(:,1),Pd(:,2),'c-o','LineWidth',2); %V4
plot(Pb(:,1),Pe(:,2),'m-o','LineWidth',2); %V5
plot(Pb(:,1),Pf(:,2),'y-o','LineWidth',2); %V6
plot(Pb(:,1),Pg(:,2),'b-o','LineWidth',2); %V7
plot(Pb(:,1),Ph(:,2),'b-o','LineWidth',2); %V8

ylabel('Voltage [V]'); xlabel('Sample [n]'); legend('P1','P2','P3','P4','P5','P6','P8','P8')

hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

