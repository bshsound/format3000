
function screenList = screen(User,Password)
%% get filescreening list from ICES
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

%% 2. Create request
url = 'https://underwaternoise.ices.dk/continuous/api/getListFileScreenings';
header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt]);
% Create HTTP request message
request = matlab.net.http.RequestMessage(matlab.net.http.RequestMethod.POST, header);
% Send HTTP request
[resp,a,req] = request.send(url);
% Get result
screenList = resp.Body.Data;

% url2 = https://underwaternoise.ices.dk/continuous/API/pushFileDatabase/{tblFileScreeningID}
% 
% url2 = ['https://underwaternoise.ices.dk/continuous/api/getListOfScreeningFilesDetails/' num2str(screenList(1).tblFileScreeningID)];
% % url2 = ['https://underwaternoise.ices.dk/continuous/api/getScreeningSessionMessages/' num2str(screenList(1).tblFileScreeningID)];
% header = matlab.net.http.HeaderField('Authorization', ['Bearer ' jwt]);
% % Create HTTP request message
% request = matlab.net.http.RequestMessage(matlab.net.http.RequestMethod.POST, header);
% % Send HTTP request
% [resp,a,req] = request.send(url2);
% % Get result
% screenList = resp.Body.Data;
end