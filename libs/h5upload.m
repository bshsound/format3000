%% function that uploads one more files to the ICES continuous noise database
function h5upload(User,Password,filenameS,pathS)
    import matlab.net.http.*
    import matlab.net.http.field.*
    import matlab.net.http.io.*

%% 1. Create Token
    url = 'https://underwaternoise.ices.dk/continuous/api/token';
    username = User;
    password = Password;
    headerFields = {'Content-type' 'application/x-www-form-urlencoded';'charset' 'UTF-8'};
    options = weboptions('HeaderFields', headerFields);
    response = webwrite(url,...
    'grant_type','password',...
    'username',username,...
    'password',password,...
    options);
    jwt = response.result.token;
    
%% 2. Upload file(s)
    for ii = 1:length(filenameS)
        %% Upload
        URL = 'https://underwaternoise.ices.dk/continuous/api/UploadFile';
        %  Create file provider
        fileProvider = matlab.net.http.io.FileProvider([pathS filenameS{ii}]);
        % Set media type to multipart/form-data 
        mediaType = matlab.net.http.MediaType('multipart/form-data');
        % Set HTTP header
        header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt],'Accept','multipart/form-data');
        % Crete multipart form provider
        formProvider = matlab.net.http.io.MultipartFormProvider('fileToUpload', fileProvider);
        % Create HTTP request message
        request = matlab.net.http.RequestMessage(matlab.net.http.RequestMethod.POST, header, formProvider);
        % Set HTTP options and enable SavePayload for debugging
        options =  matlab.net.http.HTTPOptions('SavePayload', true); 
        % Send HTTP request
        [resp,a,req] = request.send(URL, options);
        % Get result
        disp(resp.Body.Data)
    end
    f = msgbox([num2str(length(filenameS)) ' h5 files have been uploaded to the ICES continuous noise database!'],"Upload successfull");
end