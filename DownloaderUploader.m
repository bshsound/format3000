classdef DownloaderUploader < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ICESUpAndDownloaderUIFigure     matlab.ui.Figure
        Menu                            matlab.ui.container.Menu
        HelpMenu                        matlab.ui.container.Menu
        TabGroup                        matlab.ui.container.TabGroup
        UploadTab                       matlab.ui.container.Tab
        UploadfilesButton               matlab.ui.control.Button
        GetScreeningListDropDownLabel   matlab.ui.control.Label
        GetScreeningListDropDown        matlab.ui.control.DropDown
        PushselectiontoICESdatabaseButton  matlab.ui.control.Button
        UITable2                        matlab.ui.control.Table
        GetDetailedInformationonSessionButton  matlab.ui.control.Button
        DownloadTab                     matlab.ui.container.Tab
        GeographicalLimitsPanel         matlab.ui.container.Panel
        NorthSpinnerLabel               matlab.ui.control.Label
        NorthSpinner                    matlab.ui.control.Spinner
        SouthSpinnerLabel               matlab.ui.control.Label
        SouthSpinner                    matlab.ui.control.Spinner
        EastSpinnerLabel                matlab.ui.control.Label
        EastSpinner                     matlab.ui.control.Spinner
        WestSpinnerLabel                matlab.ui.control.Label
        WestSpinner                     matlab.ui.control.Spinner
        TemporalLimitsPanel             matlab.ui.container.Panel
        StartDateDatePickerLabel        matlab.ui.control.Label
        StartDateDatePicker             matlab.ui.control.DatePicker
        EndDateDatePickerLabel          matlab.ui.control.Label
        EndDateDatePicker               matlab.ui.control.DatePicker
        GetavailabledatafromICESButton  matlab.ui.control.Button
        UITable                         matlab.ui.control.Table
        DownloadSelectionButton         matlab.ui.control.Button
        SearchforstationnameorstationIDPanel  matlab.ui.container.Panel
        stationnameDropDownLabel        matlab.ui.control.Label
        stationnameDropDown             matlab.ui.control.DropDown
        stationIDEditFieldLabel         matlab.ui.control.Label
        stationIDEditField              matlab.ui.control.EditField
        uimap                           matlab.ui.control.UIAxes
        BSH2023Label                    matlab.ui.control.Label
    end

    
    properties (Access = private)
        libpath = addpath('./libs')
        startdate = datetime(2013,1,1)% user defined start date of period for which ICES database will be searched
        enddate = datetime(2023,9,13)% user defined end date of period for which ICES database will be searched
        northlim = 69 % user defined geographical limits
        southlim = 50    
        eastlim = 29
        westlim = -7
        avdata % available data at ICES database for chosen period and area
        selection % selected stations that shall be downloaded
        avPo % scatter output of available positions
        backup % Backup to restore colormap when selection changes in uitable
        All % list of all ICES stations
        MB % Map boundaries that can be set interactively 
        User % ICES User name
        Password % ICES Password
        selectionupload % selection of sessions that shall be pushed or investigated in "upload" tab
        UT % UploadTable
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app, SM)
            addpath('.\libs\m_map1.4\m_map')
            app.UITable.SelectionType = 'row';
            app.UITable2.SelectionType = 'row';
            app.UITable.Multiselect = 'on';
            %% fill station drop down menu
            S = webread('https://underwaternoise.ices.dk/continuous/api/getListSubmissions');
            for ii = 1:length(S)
               SubStats(ii) = str2double(S(ii).stationCode); 
            end
            SubStats = unique(SubStats);
            % get list of all stations at ICES from vocab api
            url2 = 'https://vocab.ices.dk/services/api/Code/dd591b83-fa5c-4ad9-b6f2-6d875d2eb320';
            All = webread(url2);
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
        end

        % Value changed function: StartDateDatePicker
        function StartDateDatePickerValueChanged(app, event)
            app.startdate = app.StartDateDatePicker.Value;
        end

        % Value changed function: EndDateDatePicker
        function EndDateDatePickerValueChanged(app, event)
            app.enddate = app.EndDateDatePicker.Value;
        end

        % Value changed function: NorthSpinner
        function NorthSpinnerValueChanged(app, event)
            app.northlim = app.NorthSpinner.Value;
            delete(app.MB)
            bndry_lat=[app.southlim app.northlim app.northlim app.southlim app.southlim];
            bndry_lon=[app.westlim app.westlim app.eastlim app.eastlim app.westlim];
            app.MB = m_line(bndry_lon,bndry_lat,'Parent',app.uimap,'Color',[1.00,0.07,0.65],'LineWidth',2);
        end

        % Value changed function: SouthSpinner
        function SouthSpinnerValueChanged(app, event)
            app.southlim = app.SouthSpinner.Value;
            delete(app.MB)
            bndry_lat=[app.southlim app.northlim app.northlim app.southlim app.southlim];
            bndry_lon=[app.westlim app.westlim app.eastlim app.eastlim app.westlim];
            app.MB = m_line(bndry_lon,bndry_lat,'Parent',app.uimap,'Color',[1.00,0.07,0.65],'LineWidth',2);
        end

        % Value changed function: EastSpinner
        function EastSpinnerValueChanged(app, event)
            app.eastlim = app.EastSpinner.Value;
            delete(app.MB)
            bndry_lat=[app.southlim app.northlim app.northlim app.southlim app.southlim];
            bndry_lon=[app.westlim app.westlim app.eastlim app.eastlim app.westlim];
            app.MB = m_line(bndry_lon,bndry_lat,'Parent',app.uimap,'Color',[1.00,0.07,0.65],'LineWidth',2);
        end

        % Value changed function: WestSpinner
        function WestSpinnerValueChanged(app, event)
            app.westlim = app.WestSpinner.Value;
            delete(app.MB)
            bndry_lat=[app.southlim app.northlim app.northlim app.southlim app.southlim];
            bndry_lon=[app.westlim app.westlim app.eastlim app.eastlim app.westlim];
            app.MB = m_line(bndry_lon,bndry_lat,'Parent',app.uimap,'Color',[1.00,0.07,0.65],'LineWidth',2);
        end

        % Button pushed function: GetavailabledatafromICESButton
        function GetavailabledatafromICESButtonPushed(app, event)
            if isempty(app.stationIDEditField.Value) 
                d = uiprogressdlg(app.ICESUpAndDownloaderUIFigure,'Title','Scanning ICES continuous noise database','Indeterminate','on');
                drawnow
                [app.avdata,app.avPo] = scanICES(app.uimap,app.westlim,app.eastlim,app.southlim,app.northlim,app.startdate,app.enddate);
                close(d)
                for ii = 1:length(app.avdata)
                    station{ii} = app.avdata{ii}.station_name;
                    nofiles(ii) = length(app.avdata{ii}.filename);
                    nodays(ii) = app.avdata{ii}.nodays;
                    key{ii} = app.avdata{ii}.key;
                end
                avdatatable = table(station',key',nofiles',nodays');
                app.UITable.Data = avdatatable;
                app.backup = app.avPo.CData;
            else
                d = uiprogressdlg(app.ICESUpAndDownloaderUIFigure,'Title','Scanning ICES continuous noise database','Indeterminate','on');
                drawnow
                [app.avdata,app.avPo] = scanICESforstation(app.uimap,app.startdate,app.enddate,app.stationIDEditField.Value);
                close(d)
                for ii = 1:length(app.avdata)
                    station{ii} = app.avdata{ii}.station_name;
                    nofiles(ii) = length(app.avdata{ii}.filename);
                    nodays(ii) = app.avdata{ii}.nodays;
                    key{ii} = app.avdata{ii}.key;
                end
                avdatatable = table(station',key',nofiles',nodays');
                app.UITable.Data = avdatatable;
                app.backup = app.avPo.CData;
            end
        end

        % Cell selection callback: UITable
        function UITableCellSelection(app, event)
            app.selection = event.Indices; %% indices of selected stations to be downloaded
            sel = unique(app.selection(:,1));
            all = 1:length(app.avdata);
            ix = setxor(all,sel);
            app.avPo.CData(sel,:) = repmat([1.00,0.07,0.65],numel(sel),1); % all selections to magenta
            app.avPo.CData(ix,:) = app.backup(ix,:);% all unselected files back to old color
        end

        % Button pushed function: DownloadSelectionButton
        function DownloadSelectionButtonPushed(app, event)
            dname = uigetdir('C:\','Select Download Directory');
            downloadfiles(dname,app.selection,app.avdata)
        end

        % Value changed function: stationnameDropDown
        function stationnameDropDownValueChanged(app, event)
            value = app.stationnameDropDown.Value;
            %% find corresponding station ID/key for entered station name
            idx = find(strcmp({app.All.description}, value));
            app.stationIDEditField.Value = app.All(idx).key;
        end

        % Button pushed function: UploadfilesButton
        function UploadfilesButtonPushed(app, event)
        %% Start dialogue where user can chosse to either upload 1 or more files
            if isempty(app.User)
                prompt = {'Enter ICES user name:','Enter ICES password:'};
                dlgtitle = 'ICES login credentials';
                dims = [1 35];
                definput = {'Username','Password'};
                answer = inputdlg(prompt,dlgtitle,dims,definput);
                app.User = answer{1};
                app.Password = answer{2};
                [filenameS, pathS] = uigetfile('*.h5','Select one or more h5 file(s) to upload','MultiSelect', 'on');
                h5upload(app.User,app.Password,filenameS,pathS);
            else
                [filenameS, pathS] = uigetfile('*.h5','Select one or more h5 file(s) to upload','MultiSelect', 'on');
                h5upload(app.User,app.Password,filenameS,pathS);
            end
        end

        % Value changed function: GetScreeningListDropDown
        function GetScreeningListDropDownValueChanged(app, event)
            value = app.GetScreeningListDropDown.Value;
                        %% Make sure users have entered the type of table that should be displayed

            %% Start dialogue with login credentials
            if isempty(app.User)
                prompt = {'Enter ICES user name:','Enter ICES password:'};
                dlgtitle = 'ICES login credentials';
                dims = [1 35];
                definput = {'Username','Password'};
                answer = inputdlg(prompt,dlgtitle,dims,definput);
                app.User = answer{1};
                app.Password = answer{2};
                screenList = screen(app.User,app.Password);
            else
                screenList = screen(app.User,app.Password);
            end
            %% check which case to display correct table
            switch value
                case 'files ready to push'
                        idx = find([screenList.fileValidForUpload] == 1 & [screenList.fileUploadedToDB] == 0);
                        T = table({screenList(idx).fileName}',{screenList(idx).screeningDatetime}',...
                            {screenList(idx).hangFireMessage}',{screenList(idx).fileValidForUpload}',...
                            {screenList(idx).fileUploadedToDB}');
                        app.UITable2.Data = T;
                case 'files with errors'
                        idx = find([screenList.fileValidForUpload] == 0 & [screenList.fileUploadedToDB] == 0);
                        T = table({screenList(idx).fileName}',{screenList(idx).screeningDatetime}',...
                            {screenList(idx).hangFireMessage}',{screenList(idx).fileValidForUpload}',...
                            {screenList(idx).fileUploadedToDB}');
                        app.UITable2.Data = T;
                case 'all files'
                        T = table({screenList(:).fileName}',{screenList(:).screeningDatetime}',...
                            {screenList(:).hangFireMessage}',{screenList(:).fileValidForUpload}',...
                            {screenList(:).fileUploadedToDB}');
                        app.UITable2.Data = T;
            end
            app.UT = screenList;
        end

        % Button pushed function: 
        % GetDetailedInformationonSessionButton
        function GetDetailedInformationonSessionButtonPushed(app, event)
            %% get id
            switch app.GetScreeningListDropDown.Value
                case 'files ready to push'
                            idx = find([app.UT.fileValidForUpload] == 1 & [app.UT.fileUploadedToDB] == 0);
                            T = app.UT(idx);
                    case 'files with errors'
                            idx = find([app.UT.fileValidForUpload] == 0 & [app.UT.fileUploadedToDB] == 0);
                            T = app.UT(idx);
                    case 'all files'
                            T = app.UT;
            end
        id = T(app.selectionupload(1,1)).tblFileScreeningID;
        SM = getSessionMessage(id,app.User,app.Password);
        Udialog(SM)
        end

        % Cell selection callback: UITable2
        function UITable2CellSelection(app, event)
            app.selectionupload = event.Indices;            
        end

        % Button pushed function: PushselectiontoICESdatabaseButton
        function PushselectiontoICESdatabaseButtonPushed(app, event)
            %% get id
            switch app.GetScreeningListDropDown.Value
                case 'files ready to push'
                            idx = find([app.UT.fileValidForUpload] == 1 & [app.UT.fileUploadedToDB] == 0);
                            T = app.UT(idx);
                    case 'files with errors'
                            idx = find([app.UT.fileValidForUpload] == 0 & [app.UT.fileUploadedToDB] == 0);
                            T = app.UT(idx);
                    case 'all files'
                            T = app.UT;
            end
            id = T(app.selectionupload(1,1)).tblFileScreeningID;
            res = PushFile(id,app.User,app.Password)
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ICESUpAndDownloaderUIFigure and hide until all components are created
            app.ICESUpAndDownloaderUIFigure = uifigure('Visible', 'off');
            app.ICESUpAndDownloaderUIFigure.Color = [0 0.2314 0.4118];
            app.ICESUpAndDownloaderUIFigure.Position = [400 100 1078 611];
            app.ICESUpAndDownloaderUIFigure.Name = 'ICES UpAndDownloader';
            app.ICESUpAndDownloaderUIFigure.Icon = 'ices.gif';

            % Create Menu
            app.Menu = uimenu(app.ICESUpAndDownloaderUIFigure);
            app.Menu.Text = 'Menu';

            % Create HelpMenu
            app.HelpMenu = uimenu(app.ICESUpAndDownloaderUIFigure);
            app.HelpMenu.Text = 'Help';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.ICESUpAndDownloaderUIFigure);
            app.TabGroup.TabLocation = 'left';
            app.TabGroup.Position = [14 31 1044 568];

            % Create UploadTab
            app.UploadTab = uitab(app.TabGroup);
            app.UploadTab.Title = 'Upload';

            % Create UploadfilesButton
            app.UploadfilesButton = uibutton(app.UploadTab, 'push');
            app.UploadfilesButton.ButtonPushedFcn = createCallbackFcn(app, @UploadfilesButtonPushed, true);
            app.UploadfilesButton.Position = [18 540 100 22];
            app.UploadfilesButton.Text = 'Upload file(s)';

            % Create GetScreeningListDropDownLabel
            app.GetScreeningListDropDownLabel = uilabel(app.UploadTab);
            app.GetScreeningListDropDownLabel.HorizontalAlignment = 'right';
            app.GetScreeningListDropDownLabel.Position = [177 540 104 22];
            app.GetScreeningListDropDownLabel.Text = 'Get Screening List';

            % Create GetScreeningListDropDown
            app.GetScreeningListDropDown = uidropdown(app.UploadTab);
            app.GetScreeningListDropDown.Items = {'Select ...', 'files ready to push', 'files with errors', 'all files'};
            app.GetScreeningListDropDown.ValueChangedFcn = createCallbackFcn(app, @GetScreeningListDropDownValueChanged, true);
            app.GetScreeningListDropDown.Position = [296 540 100 22];
            app.GetScreeningListDropDown.Value = 'Select ...';

            % Create PushselectiontoICESdatabaseButton
            app.PushselectiontoICESdatabaseButton = uibutton(app.UploadTab, 'push');
            app.PushselectiontoICESdatabaseButton.ButtonPushedFcn = createCallbackFcn(app, @PushselectiontoICESdatabaseButtonPushed, true);
            app.PushselectiontoICESdatabaseButton.Position = [736 540 192 22];
            app.PushselectiontoICESdatabaseButton.Text = 'Push selection to ICES database';

            % Create UITable2
            app.UITable2 = uitable(app.UploadTab);
            app.UITable2.ColumnName = {'filename'; 'upload time'; 'ICES message'; 'valid for upload'; 'uploaded'};
            app.UITable2.RowName = {};
            app.UITable2.ColumnSortable = true;
            app.UITable2.CellSelectionCallback = createCallbackFcn(app, @UITable2CellSelection, true);
            app.UITable2.Position = [19 23 924 499];

            % Create GetDetailedInformationonSessionButton
            app.GetDetailedInformationonSessionButton = uibutton(app.UploadTab, 'push');
            app.GetDetailedInformationonSessionButton.ButtonPushedFcn = createCallbackFcn(app, @GetDetailedInformationonSessionButtonPushed, true);
            app.GetDetailedInformationonSessionButton.Position = [514 540 209 22];
            app.GetDetailedInformationonSessionButton.Text = 'Get Detailed Information on Session';

            % Create DownloadTab
            app.DownloadTab = uitab(app.TabGroup);
            app.DownloadTab.Title = 'Download';

            % Create GeographicalLimitsPanel
            app.GeographicalLimitsPanel = uipanel(app.DownloadTab);
            app.GeographicalLimitsPanel.Title = 'Geographical Limits';
            app.GeographicalLimitsPanel.Position = [1 417 173 151];

            % Create NorthSpinnerLabel
            app.NorthSpinnerLabel = uilabel(app.GeographicalLimitsPanel);
            app.NorthSpinnerLabel.HorizontalAlignment = 'right';
            app.NorthSpinnerLabel.Position = [12 105 35 22];
            app.NorthSpinnerLabel.Text = 'North';

            % Create NorthSpinner
            app.NorthSpinner = uispinner(app.GeographicalLimitsPanel);
            app.NorthSpinner.Limits = [-90 90];
            app.NorthSpinner.ValueChangedFcn = createCallbackFcn(app, @NorthSpinnerValueChanged, true);
            app.NorthSpinner.Position = [62 105 100 22];
            app.NorthSpinner.Value = 69;

            % Create SouthSpinnerLabel
            app.SouthSpinnerLabel = uilabel(app.GeographicalLimitsPanel);
            app.SouthSpinnerLabel.HorizontalAlignment = 'right';
            app.SouthSpinnerLabel.Position = [10 79 37 22];
            app.SouthSpinnerLabel.Text = 'South';

            % Create SouthSpinner
            app.SouthSpinner = uispinner(app.GeographicalLimitsPanel);
            app.SouthSpinner.Limits = [-90 90];
            app.SouthSpinner.ValueChangedFcn = createCallbackFcn(app, @SouthSpinnerValueChanged, true);
            app.SouthSpinner.Position = [62 79 100 22];
            app.SouthSpinner.Value = 50;

            % Create EastSpinnerLabel
            app.EastSpinnerLabel = uilabel(app.GeographicalLimitsPanel);
            app.EastSpinnerLabel.HorizontalAlignment = 'right';
            app.EastSpinnerLabel.Position = [17 53 30 22];
            app.EastSpinnerLabel.Text = 'East';

            % Create EastSpinner
            app.EastSpinner = uispinner(app.GeographicalLimitsPanel);
            app.EastSpinner.Limits = [-180 180];
            app.EastSpinner.ValueChangedFcn = createCallbackFcn(app, @EastSpinnerValueChanged, true);
            app.EastSpinner.Position = [62 53 100 22];
            app.EastSpinner.Value = 29;

            % Create WestSpinnerLabel
            app.WestSpinnerLabel = uilabel(app.GeographicalLimitsPanel);
            app.WestSpinnerLabel.HorizontalAlignment = 'right';
            app.WestSpinnerLabel.Position = [14 27 33 22];
            app.WestSpinnerLabel.Text = 'West';

            % Create WestSpinner
            app.WestSpinner = uispinner(app.GeographicalLimitsPanel);
            app.WestSpinner.Limits = [-180 180];
            app.WestSpinner.ValueChangedFcn = createCallbackFcn(app, @WestSpinnerValueChanged, true);
            app.WestSpinner.Position = [62 27 100 22];
            app.WestSpinner.Value = -7;

            % Create TemporalLimitsPanel
            app.TemporalLimitsPanel = uipanel(app.DownloadTab);
            app.TemporalLimitsPanel.Title = 'Temporal Limits';
            app.TemporalLimitsPanel.Position = [173 491 290 77];

            % Create StartDateDatePickerLabel
            app.StartDateDatePickerLabel = uilabel(app.TemporalLimitsPanel);
            app.StartDateDatePickerLabel.HorizontalAlignment = 'right';
            app.StartDateDatePickerLabel.Position = [1 31 67 22];
            app.StartDateDatePickerLabel.Text = 'Start Date';

            % Create StartDateDatePicker
            app.StartDateDatePicker = uidatepicker(app.TemporalLimitsPanel);
            app.StartDateDatePicker.Limits = [datetime([2013 1 1]) datetime([2060 12 31])];
            app.StartDateDatePicker.ValueChangedFcn = createCallbackFcn(app, @StartDateDatePickerValueChanged, true);
            app.StartDateDatePicker.Position = [82 31 125 22];
            app.StartDateDatePicker.Value = datetime([2013 1 1]);

            % Create EndDateDatePickerLabel
            app.EndDateDatePickerLabel = uilabel(app.TemporalLimitsPanel);
            app.EndDateDatePickerLabel.HorizontalAlignment = 'right';
            app.EndDateDatePickerLabel.Position = [1 5 67 22];
            app.EndDateDatePickerLabel.Text = 'End Date';

            % Create EndDateDatePicker
            app.EndDateDatePicker = uidatepicker(app.TemporalLimitsPanel);
            app.EndDateDatePicker.Limits = [datetime([2013 1 1]) datetime([2060 12 31])];
            app.EndDateDatePicker.ValueChangedFcn = createCallbackFcn(app, @EndDateDatePickerValueChanged, true);
            app.EndDateDatePicker.Position = [82 5 125 22];
            app.EndDateDatePicker.Value = datetime([2023 9 13]);

            % Create GetavailabledatafromICESButton
            app.GetavailabledatafromICESButton = uibutton(app.DownloadTab, 'push');
            app.GetavailabledatafromICESButton.ButtonPushedFcn = createCallbackFcn(app, @GetavailabledatafromICESButtonPushed, true);
            app.GetavailabledatafromICESButton.BackgroundColor = [1 0.0706 0.651];
            app.GetavailabledatafromICESButton.FontSize = 14;
            app.GetavailabledatafromICESButton.FontWeight = 'bold';
            app.GetavailabledatafromICESButton.Position = [528 521 376 41];
            app.GetavailabledatafromICESButton.Text = 'Get available data from ICES';

            % Create UITable
            app.UITable = uitable(app.DownloadTab);
            app.UITable.ColumnName = {'Station'; 'ID'; 'no. of files'; 'no. of days'};
            app.UITable.RowName = {};
            app.UITable.ColumnSortable = [true false true false];
            app.UITable.CellSelectionCallback = createCallbackFcn(app, @UITableCellSelection, true);
            app.UITable.Position = [477 67 474 435];

            % Create DownloadSelectionButton
            app.DownloadSelectionButton = uibutton(app.DownloadTab, 'push');
            app.DownloadSelectionButton.ButtonPushedFcn = createCallbackFcn(app, @DownloadSelectionButtonPushed, true);
            app.DownloadSelectionButton.BackgroundColor = [1 0.0745 0.651];
            app.DownloadSelectionButton.FontSize = 14;
            app.DownloadSelectionButton.FontWeight = 'bold';
            app.DownloadSelectionButton.Position = [528 13 376 41];
            app.DownloadSelectionButton.Text = 'Download Selection';

            % Create SearchforstationnameorstationIDPanel
            app.SearchforstationnameorstationIDPanel = uipanel(app.DownloadTab);
            app.SearchforstationnameorstationIDPanel.Title = 'Search for station name or station ID';
            app.SearchforstationnameorstationIDPanel.Position = [175 417 288 75];

            % Create stationnameDropDownLabel
            app.stationnameDropDownLabel = uilabel(app.SearchforstationnameorstationIDPanel);
            app.stationnameDropDownLabel.HorizontalAlignment = 'right';
            app.stationnameDropDownLabel.Position = [2 30 74 22];
            app.stationnameDropDownLabel.Text = 'station name';

            % Create stationnameDropDown
            app.stationnameDropDown = uidropdown(app.SearchforstationnameorstationIDPanel);
            app.stationnameDropDown.Items = {'Select station'};
            app.stationnameDropDown.ValueChangedFcn = createCallbackFcn(app, @stationnameDropDownValueChanged, true);
            app.stationnameDropDown.Position = [91 30 176 22];
            app.stationnameDropDown.Value = 'Select station';

            % Create stationIDEditFieldLabel
            app.stationIDEditFieldLabel = uilabel(app.SearchforstationnameorstationIDPanel);
            app.stationIDEditFieldLabel.HorizontalAlignment = 'right';
            app.stationIDEditFieldLabel.Position = [21 4 56 22];
            app.stationIDEditFieldLabel.Text = 'station ID';

            % Create stationIDEditField
            app.stationIDEditField = uieditfield(app.SearchforstationnameorstationIDPanel, 'text');
            app.stationIDEditField.Position = [92 4 175 22];

            % Create uimap
            app.uimap = uiaxes(app.DownloadTab);
            app.uimap.XTick = [];
            app.uimap.XTickLabel = '';
            app.uimap.YTick = [];
            app.uimap.YTickLabel = '';
            app.uimap.Position = [27 15 405 394];

            % Create BSH2023Label
            app.BSH2023Label = uilabel(app.ICESUpAndDownloaderUIFigure);
            app.BSH2023Label.FontName = 'Comic Sans MS';
            app.BSH2023Label.FontSize = 8;
            app.BSH2023Label.FontColor = [1 1 1];
            app.BSH2023Label.Position = [1012 1 46 22];
            app.BSH2023Label.Text = 'BSH, 2023';

            % Show the figure after all components are created
            app.ICESUpAndDownloaderUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = DownloaderUploader(varargin)

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ICESUpAndDownloaderUIFigure)

            % Execute the startup function
            runStartupFcn(app, @(app)startupFcn(app, varargin{:}))

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ICESUpAndDownloaderUIFigure)
        end
    end
end