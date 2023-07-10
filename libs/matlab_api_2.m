url = 'https://underwaternoise.ices.dk/continuous/api/token/';
opts = weboptions('UserName', 'basan','password','Frba2706','RequestMethod','post');
opts.ContentType = 'json';
response = webwrite(url,opts)