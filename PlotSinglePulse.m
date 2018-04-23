function [ ] = PlotSinglePulse( Pi )

% INPUT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = Pi(:,1);
V = Pi(:,2);
I = Pi(:,3);
H = Pi(:,4);
S = Pi(:,5);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% STATE PLOT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
hold on;
plot(t,1.0*H,'r','LineWidth',2);  %Hi
plot(t,1.01*S,'b','LineWidth',2); %Si
title('H&S CMD State');
xlabel('-2\pi \leq x \leq 2\pi');
ylabel('State: ON [1] / OFF [0]');
xlabel('Sample [n]');
legend('H','S')
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% V/I Plot %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
hold on;

subplot(2,1,1); plot(t,V,'r-o','LineWidth',2); %V
ylabel('Voltage [V]'); xlabel('Sample [n]'); legend('V')

subplot(2,1,2); plot(t,I,'b-o','LineWidth',2); %I
ylabel('Current [A]'); xlabel('Sample [n]'); legend('I')
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

