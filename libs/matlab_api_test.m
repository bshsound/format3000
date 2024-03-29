clear all
close all

%%
url = 'https://underwaternoise.ices.dk/continuous/api/token/';
r = weboptions;
r.HeaderFields = {'Authorization',  ['Bearer ' token]};

res = httr:POST('https://underwaternoise.ices.dk/continuous/api/token',body = list(Username = "basan",password = "Frba2706"),encode = "form")
res_content = httr::content(res)

get_uri

uri = matlab.net.URI('https://underwaternoise.ices.dk/continuous/api/token')
method = matlab.net.http.RequestMethod.POST;

body = matlab.net.http.MessageBody(Username = basan,password = Frba2706);
request = matlab.net.http.RequestMessage(method,[],body);
[response,completedrequest,history] = send(request,uri)
+

opts = weboptions('UserName', 'basan','password','Frba2706','RequestMethod','post','TimeOut',30);
response = webwrite(url,opts)


url = 'https://underwaternoise.ices.dk/continuous/api/token';
fieldName = 'basan';
fieldValue = 'Frba2706';
response = webwrite(url, fieldName, fieldValue, opts);

RunRScript


request = matlab.net.http.RequestMessage;
request.Method = matlab.net.http.RequestMethod.POST;
request.Body = matlab.net.http.MessageBody('UserName=basan,password=Frba2706');
request.Header = matlab.net.http.field.ContentTypeField('application/x-www-form-urlencoded;charset=utf-8');
response = request.send('https://underwaternoise.ices.dk/continuous/api/token')




% client_id = 'client_id_FILL';%'YOUR CLIENT ID ';
% client_secret = 'client_secret_FILL';%'YOUR CLIENT SECRET ';
%% FUNKTIONIERT !!!
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

% Upload File Test 1
url = 'https://underwaternoise.ices.dk/continuous/api/UploadFile';
headerFields = {'Content-Type' 'application/json';'Authorization'  ['Bearer ' jwt]};
options = weboptions('HeaderFields', headerFields);
response = webwrite(url,...
'fileToUpload','X:\Meereskunde\Unterwasserschall\AMSO23\Kuestenlaender\Import\PMO22-MP1-AMAR175_AMAR175.1.64000.GTI762_Sommer_Juli.h5',...
options);

% Upload File Test 2
import matlab.net.http.*
import matlab.net.http.field.*
import matlab.net.http.io.*

% dataFile = fullfile('X:\Meereskunde\Unterwasserschall\AMSO23\Kuestenlaender\Import', 'PMO22-MP1-AMAR175_AMAR175.1.64000.GTI762_Sommer_Juli.h5');
% fid = fopen(dataFile, 'r');
% data = char(fread(fid)');
% fclose(fid);
% Message = data;
% Message = ['fileToUpload',{'path','X:/Meereskunde/Unterwasserschall/AMSO23/Kuestenlaender/Import/PMO22-MP1-AMAR175_AMAR175.1.64000.GTI762_Sommer_Juli.h5','type','application/octet-stream'}]
URL = 'https://underwaternoise.ices.dk/continuous/api/UploadFile';
% MyBody = matlab.net.http.MessageBody(Message);
MyHTTPOptions = matlab.net.http.HTTPOptions();
% Request = matlab.net.http.RequestMessage;
% Request.Method = 'POST';
% Request.Header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt],'Accept','application/json, text/xml, application/xml, */*');
% Request.Body = MyBody;
% Request.Body = matlab.net.http.field('path', "X:\\Meereskunde\\Unterwasserschall\\AMSO23\Kuestenlaender\\Import\\PMO22-MP1-AMAR175_AMAR175.1.64000.GTI762_Sommer_Juli.h5", 'type',"application/octet-stream")')
provider = FileProvider('X:\\Meereskunde\\Unterwasserschall\\AMSO23/Kuestenlaender\\Import\\PMO22-MP1-AMAR175_AMAR175.1.64000.GTI762_Sommer_Juli.h5','Content-Disposition','application/octet-stream');
Request = RequestMessage('POST',[],provider);
Request.Method = 'POST';
Request.Header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt],'Accept','application/json, text/xml, application/xml, */*','conten-type','text/plain; charset=utf-8','Content-Disposition','application/octet-stream');
uri = matlab.net.URI(URL);
[resp, a, req] = Request.send(uri,MyHTTPOptions);

% Upload File Test 3
webwrite('https://underwaternoise.ices.dk/continuous/api/UploadFile','filename','X:/Meereskunde/Unterwasserschall/AMSO23/Kuestenlaender/Import/PMO22-MP1-AMAR175_AMAR175.1.64000.GTI762_Sommer_Juli.h5','Authorization', ['Bearer ' jwt])


% Upload File Test 4
dataFile = fullfile('C:\BSH\ICESUpload', 'test.h5');
fid = fopen(dataFile, 'r');
data = char(fread(fid)');
fclose(fid);
% Generate the custom header
[~,remoteFName, remoteExt] = fileparts(dataFile);
headerFields = {'Authorization', ['Bearer ', jwt]};
headerFields{2,1} = 'Dropbox-API-Arg';
headerFields{2,2} = sprintf('{"path": "/%s%s", "mode": "add", "autorename": true, "mute": false}',remoteFName, remoteExt);
headerFields{3,1} = 'Content-Type';
headerFields{3,2} = 'application/octet-stream';
headerFields = string(headerFields);
% Set the options for WEBWRITE
opt = weboptions;
opt.MediaType = 'application/octet-stream';
opt.CharacterEncoding = 'ISO-8859-1';
opt.RequestMethod = 'post';
opt.HeaderFields = headerFields;
% Upload the file
tempOutput = webwrite('https://underwaternoise.ices.dk/continuous/api/UploadFile', data, opt);

% Upload File Test 5
token=jwt;
% channel='mychannel';
filename='C:\BSH\ICESUpload\test.h5';
fid=fopen(filename, 'rb');
data=fread(fid, Inf, '*char')';
fclose(fid);
options = weboptions;
options.RequestMethod = 'post';
% options.MediaType = 'application/json';
options.HeaderFields = string({'Authorization', ['Bearer ' jwt]; 'filename', filename});
response = webwrite('https://underwaternoise.ices.dk/continuous/api/UploadFile', data, options);

% Upload File Test 6
token=jwt;
% channel='mychannel';
filename='C:\BSH\ICESUpload\test.h5';
fid=fopen(filename, 'rb');
data=fread(fid, Inf, '*char')';
fclose(fid);
options = weboptions;
options.RequestMethod = 'post';
options.MediaType = 'application/x-www-form-urlencoded';
response = webwrite(sprintf('https://underwaternoise.ices.dk/continuous/api/UploadFile?token=%s&filename=%s&file=', token, filename), options)

url = URL;
header = {'Authorization', ['Bearer ' jwt];'ContentType' 'application/x-www-form-urlencoded';'Accept' 'application/json';'filename', filename}; % header
options = weboptions('RequestMethod','POST','HeaderFields',header);
webwrite('https://underwaternoise.ices.dk/continuous/api/UploadFile', options);
