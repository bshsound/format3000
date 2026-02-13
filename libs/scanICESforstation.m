
function [data,avPo] = scanICESforstation(AXES,start_time,end_time,key)

%% Script that checks data availability for certain period and station at ICES database

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



%% Check for temporal data availability
ad = 0;

depl = find(strcmp({S.stationCode},key)); % find all deployments for the chosen station in the Submission list S
stid = find(str2num(key)==SubStats);
if isempty(depl)
    uialert('No data was found for this station.')
end

for ii = 1:length(depl)
        start = parseICESdt(S(depl(ii)).startDate);
        ende  = parseICESdt(S(depl(ii)).endDate);

        % alles auf Tagesauflösung ziehen (wichtig!)
        start = dateshift(start, 'start', 'day');
        ende  = dateshift(ende,  'start', 'day');

        st = dateshift(start_time, 'start', 'day');
        en = dateshift(end_time,   'start', 'day');

        % Overlap-Check robust (ohne intersect-Probleme)
        if ende >= st && start <= en
            status = 1;
            overlapStart = max(start, st);
            overlapEnd   = min(ende,  en);
            overlap = overlapStart:caldays(1):overlapEnd;
        else
            status = 0;
            overlap = [];
        end


        if status ==1
            ad = ad+1;
            available_data{ad}.key = num2str(SubStats(stid));
            available_data{ad}.station_name = All(idx(stid)).description;
            available_data{ad}.filename = S(depl(ii)).fileName;
            % --- robust file id selection (preferred) --- added
            % 13.02.2026, weil upload über accessionid nicht mehr
            % funktioniert, weil ICES diese wohl nicht mehr vergibt
            fileId = [];
            if isfield(S(depl(ii)), 'tblUploadID') && ~isempty(S(depl(ii)).tblUploadID)
                fileId = S(depl(ii)).tblUploadID;
            elseif isfield(S(depl(ii)), 'id') && ~isempty(S(depl(ii)).id)
                fileId = S(depl(ii)).id;
            end

            available_data{ad}.uploadid = fileId;  % keep your existing fieldname
            available_data{ad}.lat = lat(stid);
            available_data{ad}.lon = lon(stid);
            available_data{ad}.days = length(overlap);
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
hold(AXES, 'on' )
avPo = m_scatter(lon,lat,70,[0.8 0.4 0],'filled','MarkerEdgeColor','k','Parent',AXES);
close
end
end



function dt = parseICESdt(s)
% Robust parser for ICES datetime strings, e.g.
% 2024-03-01T00:00:00
% 2024-03-01T00:00:00Z
% 2024-03-01T00:00:00.000000+00:00

s = char(string(s));

% remove fractional seconds
s = regexprep(s, '\.\d+', '');

% remove trailing timezone (Z or +hh:mm / -hh:mm)
s = regexprep(s, '(Z|[+\-]\d\d:\d\d)$', '');

% parse (UTC), then drop timezone so it compares to naive datetimes
dt = datetime(s, 'InputFormat', "yyyy-MM-dd'T'HH:mm:ss", 'TimeZone', 'UTC');
dt.TimeZone = '';
end











