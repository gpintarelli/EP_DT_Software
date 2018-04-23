function [ ] = PlotIs( Pa , Pb, Pc, Pd, Pe, Pf, Pg, Ph )

% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% V/I Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
hold on;

plot(Pa(:,1),Pa(:,3),'b-o','LineWidth',2); %I1
plot(Pb(:,1),Pb(:,3),'g-o','LineWidth',2); %I2
plot(Pb(:,1),Pc(:,3),'r-o','LineWidth',2); %I3
plot(Pb(:,1),Pd(:,3),'c-o','LineWidth',2); %I4
plot(Pb(:,1),Pe(:,3),'m-o','LineWidth',2); %I5
plot(Pb(:,1),Pf(:,3),'y-o','LineWidth',2); %I6
plot(Pb(:,1),Pg(:,3),'b-o','LineWidth',2); %I7
plot(Pb(:,1),Ph(:,3),'b-o','LineWidth',2); %I8

ylabel('Current [I]'); xlabel('Sample [n]'); legend('P1','P2','P3','P4','P5','P6','P8','P8')

hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

