function downloadfiles(dname,selection,data)
selection = unique(selection(:,1));
for ii = 1:length(selection) % loop through selected stations
    S = data{selection(ii)};
    uids = S.uploadid;
    filenames = S.filename;
    for jj = 1:length(uids) % loop over all available files
        %% set filename
        url = ['https://underwaternoise.ices.dk/continuous/api/DownloadFile/' num2str(uids{jj})];
        target = [dname '\' filenames{jj}];
        websave(target,url,weboptions('Timeout',60)); %set Timeout higher in case you have any difficulties   
    end
end
end


