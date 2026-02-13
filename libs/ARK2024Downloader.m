%% ARK2024Downloader_robust.m
stationCodeWanted = 2654;   % Arkona Deep
yearWanted        = 2024;

% 1) list
urlList = 'https://underwaternoise.ices.dk/continuous/api/getListSubmissions';
S = webread(urlList);

n = numel(S);

% 2) Build filters robustly (guaranteed n×1)
isARK  = false(n,1);
isYear = false(n,1);

for i = 1:n
    % --- stationCode ---
    if isfield(S(i),'stationCode') && ~isempty(S(i).stationCode)
        sc = S(i).stationCode;
        if ischar(sc) || isstring(sc)
            scNum = str2double(sc);
        else
            scNum = double(sc);
        end
        isARK(i) = (scNum == stationCodeWanted);
    end

    % --- fileName / filename ---
    fname = "";
    if isfield(S(i),'fileName') && ~isempty(S(i).fileName)
        fname = string(S(i).fileName);
    elseif isfield(S(i),'filename') && ~isempty(S(i).filename)
        fname = string(S(i).filename);
    end

    if strlength(fname) > 0
        isYear(i) = contains(fname, sprintf('_%04d_', yearWanted));
    end
end

K = find(isARK & isYear);

if isempty(K)
    error('No entries found for stationCode=%d and year=%d.', stationCodeWanted, yearWanted);
end

k = K(1);

% 3) Choose best download ID
fileId = [];
if isfield(S(k),'id') && ~isempty(S(k).id)
    fileId = S(k).id;
elseif isfield(S(k),'tblUploadID') && ~isempty(S(k).tblUploadID)
    fileId = S(k).tblUploadID;
end
if isempty(fileId)
    error('No usable ID found (neither id nor tblUploadID) for selected entry.');
end

% 4) Output file name
if isfield(S(k),'fileName') && ~isempty(S(k).fileName)
    outName = char(S(k).fileName);
elseif isfield(S(k),'filename') && ~isempty(S(k).filename)
    outName = char(S(k).filename);
else
    outName = sprintf('ARK_%d_download.h5', yearWanted);
end

outDir = uigetdir(pwd, 'Select download folder');
if isequal(outDir, 0), error('Canceled.'); end
outFile = fullfile(outDir, outName);

% 5) Download with fallback URLs
urlA = sprintf('https://underwaternoise.ices.dk/continuous/api/DownloadFile/%d', fileId);
urlB = sprintf('https://underwaternoise.ices.dk/continuous/API/DownloadFile/%d', fileId);
opts = weboptions('Timeout', 300);

fprintf('Trying download: %s (ID=%d)\n', outName, fileId);

try
    websave(outFile, urlA, opts);
    fprintf('SUCCESS via /api -> %s\n', outFile);
catch ME1
    fprintf('Failed via /api: %s\nTrying /API...\n', ME1.message);
    websave(outFile, urlB, opts);
    fprintf('SUCCESS via /API -> %s\n', outFile);
end
