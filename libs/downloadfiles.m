function downloadfiles(dname,selection,data)
selection = unique(selection(:,1));
for ii = 1:length(selection) % loop through selected stations
    S = data{selection(ii)};
    uids = S.uploadid;
    filenames = S.filename;
    for jj = 1:length(uids) % loop over all available files
        %% set filename
        url = ['https://underwaternoise.ices.dk/continuous/api/DownloadFile/' num2str(uids{jj})];
        %% rename filename to .zip file
        filename = filenames{jj};
        filename = filename(1:end-3);
        filename = [filename '.zip'];
        %% concatenate outputpath and filename
        target = [dname '\' filename];
        %% save .zip file from ICES continuous noise database
        websave(target,url,weboptions('Timeout',60)); %set Timeout higher in case you have any difficulties 
%         %% unzip
%         prefixed_filename = gunzip(target,[dname '\']);
%         %% rename unzipped h5 file
%         ix = strfind(prefixed_filename{2},'\');
%         prefixed_filename = prefixed_filename{2}(ix(end)+1:end);
%         ix = strfind(prefixed_filename,'_');
%         movefile([dname '\' prefixed_filename],[dname '\' prefixed_filename(ix(1)+1:end)]);
%         %% delete .zip file
%         delete(target)
    end
end
end
% automatically unpack - requires 7zip
% sys_cmd_unzip = @(z,d) ['"C:\Program Files\7-Zip\7z.exe" e -y -r -o"' d '" "' z '" *'];
% cellfun(@(z,d) system(sys_cmd_unzip(z,d)), all_zip_files, new_zip_file_dirs,'uniformoutput',false)

