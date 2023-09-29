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
url = ['https://underwaternoise.ices.dk/continuous/api/pushFileDatabase/' num2str(id)];
options = weboptions('KeyName','Authorization','KeyValue',['Bearer ' jwt]);
res = webwrite(url,options);
end