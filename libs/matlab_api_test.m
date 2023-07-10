clear all
close all

%%
url = 'https://underwaternoise.ices.dk/continuous/api/token/';
r = weboptions;
r.HeaderFields = {'Authorization',  ['Bearer ' token]};

res = httr:POST('https://underwaternoise.ices.dk/continuous/api/token',body = list(Username = basan,password = Frba2706))get_uri

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