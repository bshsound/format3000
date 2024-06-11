            AllStats = zeros(1,length(All));
            for ii = 1:length(All)
               AllStats(ii) = str2double(All(ii).key); 
            end
            for ii = 1:length(SubStats)
                idx(ii) = find(ismember(AllStats,SubStats(ii)));
            end
            age = {All.description};
            age = age(idx);
            app.stationnameDropDown.Items = [app.stationnameDropDown.Items,age];
            app.All = All;
            app.MB = startmap(app.uimap);