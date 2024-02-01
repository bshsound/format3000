function res = PushFile(id,User,Password)
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

%% get screening message
% url = ['https://underwaternoise.ices.dk/continuous/api/pushFileDatabase/' num2str(id)];
% options = weboptions('KeyName','Authorization','KeyValue',['Bearer ' jwt]);
% res = webwrite(url,options);



%% Upload
        URL = ['https://underwaternoise.ices.dk/continuous/api/pushFileDatabase/' num2str(id)];
        %  Create file provider
%         if class(filenameS) == "char"
%             fileProvider = matlab.net.http.io.FileProvider([pathS filenameS]);
%         else
%             fileProvider = matlab.net.http.io.FileProvider([pathS filenameS{ii}]);
%         end
        % Set media type to multipart/form-data 
        mediaType = matlab.net.http.MediaType('multipart/form-data');
        % Set HTTP header
        header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt],'Accept','multipart/form-data');
        % Crete multipart form provider
%         formProvider = matlab.net.http.io.MultipartFormProvider('fileToUpload', fileProvider);
        % Create HTTP request message
        request = matlab.net.http.RequestMessage(matlab.net.http.RequestMethod.POST, header);
        % Set HTTP options and enable SavePayload for debugging
        options =  matlab.net.http.HTTPOptions('SavePayload', true); 
        % Send HTTP request
        [resp,a,req] = request.send(URL, options);
        % Get result
        disp(resp.Body.Data)





end