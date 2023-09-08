clear all
close all

%% Get Token
url = 'https://underwaternoise.ices.dk/continuous/api/token';
username = 'basan';
password='Frba2706';
headerFields = {'Content-type' 'application/x-www-form-urlencoded';'charset' 'UTF-8'};
options = weboptions('HeaderFields', headerFields);
response = webwrite(url,...
'grant_type','password',...
'username',username,...
'password',password,...
options);
jwt = response.result.token;



%% Upload
URL = 'https://underwaternoise.ices.dk/continuous/api/UploadFile';
%  Create file provider
fileProvider = matlab.net.http.io.FileProvider('X:\\Meereskunde\\Unterwasserschall\\AMSO23\\OSTSEE\\ARK\\HDF5\\H1\\2020\\ICESformat\\ARK_20200501_20200531.h5');
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