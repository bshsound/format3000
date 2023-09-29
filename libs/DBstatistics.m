TS=strrep({S.insDateTime},'T', ' ');
ts = datetime(TS,'InputFormat', 'yyyy-MM-dd HH:mm:ss.SSS');
%% nach Jahren sortieren und plotten
tsy = year(ts)
[iz,iy,ix] = unique(tsy);
C = accumarray(ix,1).'
figure
bar(iz(1:4),C(1:4))
ylabel('no. of uploaded files')
grid on
%% Übersicht über Tage die hochgeladen wurden
for ii = 1:length(S)
tend = strrep({S(ii).endDate},'T', ' ');
tstart = strrep({S(ii).startDate},'T', ' ');
tstart = datetime(tstart,'InputFormat', 'yyyy-MM-dd HH:mm:ss');
tend = datetime(tend,'InputFormat', 'yyyy-MM-dd HH:mm:ss');
D(ii) = days(tend - tstart);
end
for yy = 1:4
Y=find(ix == yy) ;
DaysUpedPerYear(yy) = sum(D(Y));
end
figure
bar(iz(1:4),DaysUpedPerYear(1:4))
ylabel('no of uploaded days')
grid on
%% display how much data is available for each year
for ii = 1:length(S)
tstart = strrep({S(ii).startDate},'T', ' ');
tstart = datetime(tstart,'InputFormat', 'yyyy-MM-dd HH:mm:ss');
Ms(ii) = year(tstart);
end
[iz2,iy2,ix2] = unique(Ms);
DM = accumarray(ix,1).'
[iz2,iy2,ix2] = unique(Ms);
DM = accumarray(ix2,1).'
figure
bar(iz2(1:4),DM(1:4))
ylabel('no. of uploaded files for year')
grid on
figure
bar(iz2(1:11),DM(1:11))
ylabel('no. of uploaded files for year')
grid on
for ii = 1:11
index = find(Ms == iz2(ii));
GemTage(ii) = sum(D(index))
end
figure
bar(iz2(1:11),GemTage(1:11))
ylabel('no. of uploaded days for year')
grid on