%% Download .h5 files from ICES continuous data base
% Script downloads current table of all submissions -S
% searches for Index of Arkona measurement station -idx
% downloads all .h5 files to directory "ICESpath" - please set the path
% before running the script
clear all
close all
%%
url = ['https://underwaternoise.ices.dk/continuous/api/getListSubmissions'];
S = webread(url);
idx = find(strcmp({S.stationCode}, '13559')==1);
for ii = 1:length(idx)
        filename = S(idx(ii)).fileName;
        url = ['https://underwaternoise.ices.dk/continuous/api/DownloadFile/' num2str(S(idx(ii)).tblUploadID)];
        disp(['Downloading ' filename ' ... - file ' num2str(ii) ' of ' num2str(length(idx)) '.'])
        websave(filename,url,weboptions('Timeout',60)); %set Timeout higher in case you have any difficulties
end