%% Script that checks data availability for certain period and position at ICES database
function  [data,avPo] = scanICES(AXES,lonmin,lonmax,latmin,latmax,start_time,end_time)

%% get all submissions and positions of measurement stations
% get list of all submissions
url = 'https://underwaternoise.ices.dk/continuous/api/getListSubmissions';
S = webread(url);

% get list of all stations at ICES from vocab api
url2 = 'https://vocab.ices.dk/services/api/Code/dd591b83-fa5c-4ad9-b6f2-6d875d2eb320';
All = webread(url2);

% find all stations, for which continuous noise data has been submitted
AllStats = zeros(1,length(All));
for ii = 1:length(All)
   AllStats(ii) = str2double(All(ii).key); 
end

SubStats = zeros(1,length(S));
for ii = 1:length(S)
   SubStats(ii) = str2double(S(ii).stationCode); 
end
SubStats = unique(SubStats); % SubStats contains keys of all stations with submitted data
% [~,idx] = find(ismember(AllStats,SubStats)); %idx are indices in "All" of stations for which acoustic data has been submitted
for ii = 1:length(SubStats)
    idx(ii) = find(ismember(AllStats,SubStats(ii)));
end


% get detailed Information for acoustic stations again from vocab api
for ii = 1:length(idx)
   id = All(idx(ii)).guid;
   urldetail = ['https://vocab.ices.dk/services/api/CodeDetail/dd591b83-fa5c-4ad9-b6f2-6d875d2eb320/' id];
   StatDetail{ii} = webread(urldetail);
end

% get positions
for ii = 1:length(StatDetail)
   A = StatDetail{1,ii}.attribute(end).value;
   try % works only if a Point Coordinate is given for the station
       posstart = strfind(A,'POINT(');
       posend = strfind(A,')');
       Pos = A(posstart+6:posend-1);
       lz = strfind(Pos,' ');
       lon(ii) = str2double(Pos(1:lz));
       lat(ii) = str2double(Pos(lz:end));
   catch % calculate mean lats and lons from polygon points in case no "POINT" is given
       posstart = strfind(A,'POLYGON((');
       posend = strfind(A,'))');
       Pos = A(posstart+9:posend-2);
       Pos = split(Pos,',');
       for jj = 1:length(Pos)
            pos{jj} = split(Pos{jj},' ');
            lat_poly(jj) = str2double(cell2mat(pos{jj}(2)));
            lon_poly(jj) = str2double(cell2mat(pos{jj}(1)));
       end     
       lon(ii) = mean(lon_poly);
       lat(ii) = mean(lat_poly);
   end 
end

%% Check for spatial data availability (find which stations are within lat/lon) limits
for ii = 1:length(lat)
   sda(ii) = lonmin<lon(ii) && lon(ii)<lonmax && latmin<lat(ii) && lat(ii)<latmax ;
end
SubStats = SubStats.*sda;

%% Check for temporal data availability
ad = 0;
for st = 1:length(idx)
% if sda(st) == 0
%     continue
% end
depl = find(strcmp({S.stationCode}, num2str(SubStats(st)))==1); % find all deployments for the st'th station in the Submission list S
if isempty(depl)
    continue
end

for ii = 1:length(depl)
        start = datetime(S(depl(ii)).startDate,'InputFormat',['yyyy-MM-dd''T''HH:mm:SS']);
        ende = datetime(S(depl(ii)).endDate,'InputFormat',['yyyy-MM-dd''T''HH:mm:SS']);
        start = dateshift(start, 'start', 'day');
        ende = dateshift(ende,'start','day');
        % Check if times overlap with definded start and end limits
%         if ende >= start_time && ende <= end_time
%             status = 1;
%         elseif start >= start_time && ende <= end_time
%             status = 1;
%         elseif start <= start_time && ende >= end_time
%             status = 1;
%         else
%             status = 0;
%         end
        overlap = intersect([start:ende],[start_time:end_time]);
        if ~isempty(overlap)
            status = 1;
        else
            status = 0;
        end

        if status ==1
            ad = ad+1;
            available_data{ad}.key = num2str(SubStats(st));
            available_data{ad}.station_name = All(idx(st)).description;
            available_data{ad}.filename = S(depl(ii)).fileName;
            available_data{ad}.uploadid = S(depl(ii)).tblUploadID;
            available_data{ad}.lat = lat(st);
            available_data{ad}.lon = lon(st);
            available_data{ad}.days = length(overlap);
        end
end
end

if ~exist('available_data','var') == 1
    disp('No data found.')
else
% combine data from same station
for ii = 1:length(available_data)
ids{ii} = available_data{1,ii}.key;
end
[q,~,u] = unique(ids);
for ii = 1:length(q)
    sames = find(u==ii);
    data{ii}.station_name = available_data{sames(1)}.station_name;
    data{ii}.key = available_data{sames(1)}.key;
    data{ii}.lat = available_data{sames(1)}.lat;
    data{ii}.lon = available_data{sames(1)}.lon;
    data{ii}.filename = [];
    data{ii}.nodays = 0;
    for jj = 1:length(sames)
        C{jj} = available_data{sames(jj)}.filename;
        D{jj} = available_data{sames(jj)}.uploadid;
        data{ii}.nodays = data{ii}.nodays + available_data{sames(jj)}.days;
    end
    data{ii}.filename = C;
    data{ii}.uploadid = D;
    clear C D
end

%% plot available data 
% addpath('X:\Meereskunde\Unterwasserschall\HDF5_Testdaten_Skripte\Skripte\Matlabskripte\matlab_toolbox\m_map1.4\m_map')
addpath(genpath('.\libs\m_map1.4\m_map'))
clear lon lat
for ii = 1:length(data)
    lat(ii) = data{ii}.lat;
    lon(ii) = data{ii}.lon;
    name{ii} = data{ii}.station_name;
    nodays(ii) = data{ii}.nodays;
end

LONLIMS = [-7   29];
LATLIMS = [50   69];

cla(AXES,'reset')
m_proj('Mercator','long',LONLIMS,'lat',LATLIMS);
m_gshhs_l('patch',[.85 .85 .85],'Parent',AXES);
m_gshhs_l('color','k','Parent',AXES);
m_gshhs_l('speckle','color','k','Parent',AXES);
m_grid(AXES,'linewi',2,'tickdir','out');
close
% figure('Renderer', 'painters', 'Position', [200 200 800 800])
% m_proj('Mercator','long',LONLIMS,'lat',LATLIMS);
% % [CS,CH]=m_etopo2('contourf',[-3000:500:0],'edgecolor','none');
% % colormap((m_colmap('blues')));  
% m_gshhs_l('patch',[.85 .85 .85]);
% m_gshhs_l('color','k');              % Coastline...
% m_gshhs_l('speckle','color','k');    % with speckle added
% m_grid('linewi',2,'tickdir','out'); % ,'backcolor',[.2 .65 1]); could add background color instead of white
% hold on
% 
mini = min(nodays);
maxi = max(nodays);
range = maxi-mini;
skala = mini:range/11:maxi;
skala = round(skala);
cmap = colormap(jet(12));
for ii = 1:length(nodays)
   cc(ii,:) = cmap(min(find(le(nodays(ii),skala)==1)),:); 
end
hold(AXES, 'on' )
avPo = m_scatter(lon,lat,60,cc,'filled','MarkerEdgeColor','k','Parent',AXES);
close
cmap = colormap(AXES,jet(12)) ; %Create Colormap
cbh = colorbar(AXES) ; %Create Colorbar
close
cbh.Ticks = 1/12:1/12:1; %Create 8 ticks from zero to 1
cbh.TickLabels = num2cell(skala) ; 
cbh.Label.String = "Number of available days";
cbh.Label.FontSize = 12;


bndry_lat=[latmin latmax latmax latmin latmin];
bndry_lon=[lonmin lonmin lonmax lonmax lonmin];
m_line(bndry_lon,bndry_lat,'Parent',AXES,'Color',[1.00,0.07,0.65],'LineWidth',1);

end
end
