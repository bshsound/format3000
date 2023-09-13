%% routine that gets all currently uploaded data to ICES continuous noise database
% and gets and eventually plots the station positions


%% get list of all submissions
url = ['https://underwaternoise.ices.dk/continuous/api/getListSubmissions'];
S = webread(url);

%% get list of all stations at ICES from vocab api
url2 = ['https://vocab.ices.dk/services/api/Code/dd591b83-fa5c-4ad9-b6f2-6d875d2eb320'];
All = webread(url2);

%% find all stations, for which continuous noise data has been submitted
for ii = 1:length(All)
   AllStats(ii) = str2num(All(ii).key); 
end

for ii = 1:length(S)
   SubStats(ii) = str2num(S(ii).stationCode); 
end
SubStats = unique(SubStats);
[~,idx] = find(ismember(AllStats,SubStats)); %idx are indices of stations for which acoustic data has been submitted

%% get detailed Information for acoustic stations again from vocab api
for ii = 1:length(idx)
   id = All(idx(ii)).guid;
   urldetail = ['https://vocab.ices.dk/services/api/CodeDetail/dd591b83-fa5c-4ad9-b6f2-6d875d2eb320/' id];
   StatDetail{ii} = webread(urldetail);
end

%% get positions
for ii = 1:length(StatDetail)
   A = StatDetail{1,ii}.attribute(end).value;
   try % works only if a Point Coordinate is given for the station
       posstart = strfind(A,'POINT(');
       posend = strfind(A,')');
       Pos = A(posstart+6:posend-1);
       lz = strfind(Pos,' ');
       lon(ii) = str2num(Pos(1:lz));
       lat(ii) = str2num(Pos(lz:end));
   catch % calculate mean lats and lons from polygon points in case no "POINT" is given
       posstart = strfind(A,'POLYGON((');
       posend = strfind(A,'))');
       Pos = A(posstart+9:posend-2);
       Pos = split(Pos,',');
       for jj = 1:length(Pos)
            pos{jj} = split(Pos{jj},' ');
            lat_poly(jj) = str2num(cell2mat(pos{jj}(2)));
            lon_poly(jj) = str2num(cell2mat(pos{jj}(1)));
       end     
       lon(ii) = mean(lon_poly);
       lat(ii) = mean(lat_poly);
   end 
end

%% plot positions of all stations

addpath('X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\matlab_toolbox\legendScatter\')
addpath('X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\matlab_toolbox\m_map1.4\m_map')
LONLIMS = [min(lon)-0.2   max(lon)+0.2];
LATLIMS = [min(lat)-0.2   max(lat)+0.2];
figure('Renderer', 'painters', 'Position', [200 200 800 800])
m_proj('Mercator','long',LONLIMS,'lat',LATLIMS);
[CS,CH]=m_etopo2('contourf',[-2000:200:0],'edgecolor','none');
colormap((m_colmap('blues')));  
m_gshhs_l('patch',[.85 .85 .85],'edgecolor',[0 0 0]);
m_grid('linewi',2,'tickdir','out');
title(['Measurement locations for cont. noise (ICES)' ],...
     'fontsize',14,'fontweight','bold');
m_scatter(lon,lat,30,[0.8 0.4 0],'filled','MarkerEdgeColor','k')



