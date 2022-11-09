%% Filters design
freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024;
fS = 44100;
f_bank = CreateFilters(freqArray, order, fS);
nums=randperm(10,3);
bTmp=f_bank(nums,:);
for i=1:3
[H(i, :), w(i,:)] = freqz(bTmp(i,:), 1, order);
end
todB=@(x)20*log10(x);
H=todB(abs(H));
w=(w/pi)*(fS/2);

%% Graph with standard functions
figure ('Name', '1');
plot (w(1,:),H(1,:),'Color','black','LineWidth',1);
title ('Filter numbers: №1,№2,№3', 'FontSize', 16);
hold on;
plot (w(2,:),H(2,:),'Color','blue','LineWidth',1,'Marker','*', 'LineStyle', '- -');
hold on;
plot (w(3,:),H(3,:),'Color','red','LineWidth',1,'Marker','s', 'LineStyle', '-.');
hold on; grid on; legend;set(0,'DefaultAxesFontSize', 14);
xlabel('f, kHz','FontSize',16); ylabel('|H|, dB','FontSize',16);
xlim ([0,21000]); ylim([-60,10]); 
xticks([2000, 8000, 16000]); xticklabels ({'2 kHz', '8 kHz', '16 kHz'});

%% Graph with changing object propertie
createfigure2(w(1,:),H(1,:),w(2,:),H(2,:),w(3,:),H(3,:));
hold on;

%% Graph with no formatting
figure ('Name','3','Position',[1360,40,560,400]);
plot (w(1,:),H(1,:));
hold on;
plot (w(2,:),H(2,:));
hold on;
plot (w(3,:),H(3,:));