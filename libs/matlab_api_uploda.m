
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
provider = FileProvider('X:\\Meereskunde\\Unterwasserschall\\AMSO23\\OSTSEE\\ARK\\HDF5\\H1\\2020\\ICESformat\\ARK_20200501_20200531.h5');
Request = RequestMessage('POST',[],provider);
Request.Method = 'POST';
Request.Header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt],'Accept','application/json, text/xml, application/xml, */*','conten-type','text/plain; charset=utf-8','Content-Disposition','application/octet-stream');
uri = matlab.net.URI(URL);

[resp, a, req] = Request.send(uri)