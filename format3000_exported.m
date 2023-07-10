classdef format3000_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        Menu                            matlab.ui.container.Menu
        LoadBSHh5fileMenu               matlab.ui.container.Menu
        LoadPAMGuidecsvfileMenu         matlab.ui.container.Menu
        LoadJOMOPANSh5fileMenu          matlab.ui.container.Menu
        HelpMenu                        matlab.ui.container.Menu
        SeeICEScontinuousnoisedataformatMenu  matlab.ui.container.Menu
        TabGroup                        matlab.ui.container.TabGroup
        FileInformationTab              matlab.ui.container.Tab
        EmailEditFieldLabel             matlab.ui.control.Label
        EmailEditField                  matlab.ui.control.EditField
        CreationDateDatePickerLabel     matlab.ui.control.Label
        CreationDateDatePicker          matlab.ui.control.DatePicker
        StartDateDatePickerLabel        matlab.ui.control.Label
        StartDateDatePicker             matlab.ui.control.DatePicker
        EndDateDatePickerLabel          matlab.ui.control.Label
        EndDateDatePicker               matlab.ui.control.DatePicker
        ContactEditFieldLabel           matlab.ui.control.Label
        ContactEditField                matlab.ui.control.EditField
        CountryCodeDropDownLabel        matlab.ui.control.Label
        CountryCodeDropDown             matlab.ui.control.DropDown
        TimeEditFieldLabel              matlab.ui.control.Label
        TimeEditField                   matlab.ui.control.EditField
        TimeEditField_2Label            matlab.ui.control.Label
        TimeEditField_2                 matlab.ui.control.EditField
        TimeEditField_3Label            matlab.ui.control.Label
        TimeEditField_3                 matlab.ui.control.EditField
        InstitutionEditFieldLabel       matlab.ui.control.Label
        InstitutionEditField            matlab.ui.control.EditField
        Lamp_Email                      matlab.ui.control.Lamp
        Lamp_CreationDate               matlab.ui.control.Lamp
        Lamp_StartDate                  matlab.ui.control.Lamp
        Lamp_EndDate                    matlab.ui.control.Lamp
        Lamp_Institution                matlab.ui.control.Lamp
        Lamp_Contact                    matlab.ui.control.Lamp
        Lamp_CountryCode                matlab.ui.control.Lamp
        Lamp_StationCode                matlab.ui.control.Lamp
        SelectDropDownLabel             matlab.ui.control.Label
        SelectDropDown                  matlab.ui.control.DropDown
        StationCodeEditFieldLabel       matlab.ui.control.Label
        StationCodeEditField            matlab.ui.control.EditField
        SelectDropDown_2Label           matlab.ui.control.Label
        SelectDropDown_StationCode      matlab.ui.control.DropDown
        MetadataTab                     matlab.ui.container.Tab
        CreateUUIDButton                matlab.ui.control.Button
        HydrophoneTypeDropDownLabel     matlab.ui.control.Label
        HydrophoneTypeDropDown          matlab.ui.control.DropDown
        HydrophoneSerialNumberEditFieldLabel  matlab.ui.control.Label
        HydrophoneSerialNumberEditField  matlab.ui.control.EditField
        RecorderTypeDropDownLabel       matlab.ui.control.Label
        RecorderTypeDropDown            matlab.ui.control.DropDown
        RecorderSerialNumberEditFieldLabel  matlab.ui.control.Label
        RecorderSerialNumberEditField   matlab.ui.control.EditField
        MeasurementHeightEditFieldLabel  matlab.ui.control.Label
        MeasurementHeightEditField      matlab.ui.control.EditField
        MeasurementPurposeDropDownLabel  matlab.ui.control.Label
        MeasurementPurposeDropDown      matlab.ui.control.DropDown
        MeasurementSetupDropDownLabel   matlab.ui.control.Label
        MeasurementSetupDropDown        matlab.ui.control.DropDown
        RigDesignDropDownLabel          matlab.ui.control.Label
        RigDesignDropDown               matlab.ui.control.DropDown
        FrequencyCountSpinnerLabel      matlab.ui.control.Label
        FrequencyCountSpinner           matlab.ui.control.Spinner
        FrequencyUnitDropDownLabel      matlab.ui.control.Label
        FrequencyUnitDropDown           matlab.ui.control.DropDown
        ChannelCountSpinnerLabel        matlab.ui.control.Label
        ChannelCountSpinner             matlab.ui.control.Spinner
        MeasurementUnitDropDownLabel    matlab.ui.control.Label
        MeasurementUnitDropDown         matlab.ui.control.DropDown
        AveragingTimeSpinnerLabel       matlab.ui.control.Label
        AveragingTimeSpinner            matlab.ui.control.Spinner
        ProcessingAlgorithmDropDownLabel  matlab.ui.control.Label
        ProcessingAlgorithmDropDown     matlab.ui.control.DropDown
        DataUUIDEditFieldLabel          matlab.ui.control.Label
        DataUUIDEditField               matlab.ui.control.EditField
        DatasetVersionSpinnerLabel      matlab.ui.control.Label
        DatasetVersionSpinner           matlab.ui.control.Spinner
        CalibrationProcedureDropDownLabel  matlab.ui.control.Label
        CalibrationProcedureDropDown    matlab.ui.control.DropDown
        Lamp_HydrophoneType             matlab.ui.control.Lamp
        Lamp_HydrophoneSerialNumber     matlab.ui.control.Lamp
        Lamp_RecorderType               matlab.ui.control.Lamp
        Lamp_RecorderSerialNumber       matlab.ui.control.Lamp
        Lamp_MeasurementHeight          matlab.ui.control.Lamp
        Lamp_MeasurementPurpose         matlab.ui.control.Lamp
        Lamp_MeasurementSetup           matlab.ui.control.Lamp
        Lamp_RigDesign                  matlab.ui.control.Lamp
        Lamp_FrequencyCount             matlab.ui.control.Lamp
        Lamp_FrequencyIndex             matlab.ui.control.Lamp
        FrequencyIndexPanel             matlab.ui.container.Panel
        individualFrequencyBandsCheckBox  matlab.ui.control.CheckBox
        consecutiveThirdOctaveBandsCheckBox  matlab.ui.control.CheckBox
        LowestTOBDropDownLabel          matlab.ui.control.Label
        LowestTOBDropDown               matlab.ui.control.DropDown
        HighestTOBDropDownLabel         matlab.ui.control.Label
        HighestTOBDropDown              matlab.ui.control.DropDown
        FrequencyIndexEditField         matlab.ui.control.EditField
        LoadFrequencyBandsfromCheckBox  matlab.ui.control.CheckBox
        fileButton                      matlab.ui.control.Button
        Lamp_FrequencyUnit              matlab.ui.control.Lamp
        Lamp_ChannelCount               matlab.ui.control.Lamp
        MeasurementTotalNoEditFieldLabel  matlab.ui.control.Label
        MeasurementTotalNoEditField     matlab.ui.control.NumericEditField
        Lamp_MeasurementTotalNo         matlab.ui.control.Lamp
        Lamp_MeasurementUnit            matlab.ui.control.Lamp
        Lamp_AveragingTime              matlab.ui.control.Lamp
        Lamp_ProcessingAlgorithm        matlab.ui.control.Lamp
        Lamp_DataUUID                   matlab.ui.control.Lamp
        Lamp_DatasetVersion             matlab.ui.control.Lamp
        Lamp_CalibrationProcedure       matlab.ui.control.Lamp
        Lamp_CalibrationDatetime        matlab.ui.control.Lamp
        CalibrationDatetimeDatePickerLabel  matlab.ui.control.Label
        CalibrationDatetimeDatePicker   matlab.ui.control.DatePicker
        TimeEditField_4Label            matlab.ui.control.Label
        TimeEditField_4                 matlab.ui.control.EditField
        Lamp_Comments                   matlab.ui.control.Lamp
        CommentsTextAreaLabel           matlab.ui.control.Label
        CommentsEditField               matlab.ui.control.TextArea
        fromfileButton_2                matlab.ui.control.Button
        fromfileButton                  matlab.ui.control.Button
        DataTab                         matlab.ui.container.Tab
        SelectDatetimeVectorButton      matlab.ui.control.Button
        DateTimeLabel                   matlab.ui.control.Label
        Lamp_DateTime                   matlab.ui.control.Lamp
        LeqMeasurementsPanel            matlab.ui.container.Panel
        WritetoICESh5fileButton         matlab.ui.control.Button
        MovealldatatoMATLABworkspaceButton  matlab.ui.control.Button
        Viewh5filewithhdfviewButton     matlab.ui.control.Button
        GotoICEScontinuousnoiseregistryButton  matlab.ui.control.Button
        BSH2021Label                    matlab.ui.control.Label
        ResetButton                     matlab.ui.control.Button
    end

    
    properties (Access = private)
        Email % Description
        CreationDate % Description
        StartDate
        EndDate
        Institution
        Contact
        CountryCode
        StationCode
        libpath = addpath('./libs')
        HydrophoneType % Description
        HydrophoneSerialNumber % Description
        RecorderType % Description
        RecorderSerialNumber % Description
        MeasurementHeight
        MeasurementPurpose % Description
        MeasurementSetup % Description
        RigDesign % Description
        FrequencyCount % Description
        fi_l % lower boundary of frequency index
        fi_u % upper boundary of frequency index
        fi % frequency index
        fu % Description
        ChannelCount % Description
        MeasurementTotalNo % Description
        MeasurementUnit % Description
        AveragingTime % Description
        ProcessingAlgorithm % Description
        UUID % Description
        DatasetVersion % Description
        CalibrationProcedure % Description
        CalibrationDate % Description
        calibrationtime
        comments % Description
        ActCH = '1' % Description
        datetimeindex % Description
        leq % Description
        creationtime
        starttime
        loadpath % Description
        endtime% Description
        New % Description
        saveh5name
    end
    

       
   
    

    
    methods (Access = private)
        
        function leqbuttondown(app, event,tt)
            %% get Channel
            p=max(strfind(event.Text,' '));
            channel = str2num(event.Text(p+1:end));
            %% get data
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5;*.mat;*.csv','Data Files (*.h5,*.mat,*.csv)';'*.*','All Files (*.*)'}, ...
            'Select File',lastdir); 
            drawnow;
            figure(app.UIFigure)
            p = max(strfind(file,'.'));
            type = file(p+1:end);
            if isequal(type,'mat')
                F = load([path file]);
                F = struct2cell(F);
                F = cell2mat(F);
                app.leq{1,channel} = double(F);
                app.LeqMeasurementsPanel.Children(end-(channel*2-1)).Color = 'g';
            elseif isequal(type,'csv')
                F = importdata([path file]);
                app.leq{1,channel} = double(F);
                app.LeqMeasurementsPanel.Children(end-(channel*2-1)).Color = 'g';
            elseif isequal(type,'h5')
                I=h5info([path file]);
%                 IG = I.Groups;
%                 for ii =1:length(IG)
%                     for jj=1:length(IG(ii).Datasets)
%                         name{ii,jj}=IG(ii).Datasets(jj).Name;
%                     end
%                 end
%                 emptyCells = cellfun(@isempty,name);
%                 datasets=name(emptyCells==0);
                 I=h5info([path file]);
 
                 %% datasets, die in der ersten Ebene liegen
                 idx=1;
                 for ii =1:length(I.Datasets)
                        name{idx}=I.Datasets(ii).Name;
                        group{idx}=I.Name;
                        idx=idx+1;
                 end
                 %% check wie viele Gruppen gibt es
                 if length(I.Groups)>=1
                    for ii=1:length(I.Groups)
                        for jj=1:length(I.Groups(ii).Datasets)
                            name{idx}= I.Groups(ii).Datasets(jj).Name;
                            group{idx}= I.Groups(ii).Name;
                            idx=idx+1;
                        end
                        if length(I.Groups(ii).Groups)>=1
                            for kk=1:length(I.Groups(ii).Groups)
                                for ll=1:length(I.Groups(ii).Groups(kk).Datasets)
                                    name{idx}= I.Groups(ii).Groups(kk).Datasets(ll).Name;
                                    group{idx}= I.Groups(ii).Groups(kk).Name;
                                    idx=idx+1;
                                end
                            end
                        end
                    end
                 end
                [indx,tf] = listdlg('SelectionMode','single','ListString',name);
                drawnow;
                figure(app.UIFigure)
%                 for ii =1:length(IG)
%                     for jj=1:length(IG(ii).Datasets)
%                         name=char(IG(ii).Datasets(jj).Name);
%                             if isequal(name,char(datasets(indx)))
%                                 Group = IG(ii).Name;
%                                 Dataset = IG(ii).Datasets(jj).Name;
%                             end
%                     end
%                 end
                Group = group{indx};
                Dataset = name{indx};
                F = h5read([path file],['/' Group '/' Dataset]);
                if size(F,1)>size(F,2)
                    F=F';
                end
                app.leq{1,channel}=double(F);
                drawnow;
                figure(app.UIFigure)
                app.LeqMeasurementsPanel.Children(end-(channel*2-1)).Color = 'g';
            end 
            app.loadpath = path;
        end
    end
           

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
           [directory,~,~] = fileparts(mfilename('fullpath'));
           cd(directory);
           addpath('./libs');
        end

        % Value changed function: EmailEditField
        function EmailEditFieldValueChanged(app, event)
            Email = app.EmailEditField.Value;
            p = max(strfind(Email,'.'));
            at = strfind(Email,'@');
            if ~isempty(p) && ~isempty(at) && at<p
                app.Email = Email;
                app.Lamp_Email.Color = 'g';
            else
                errordlg('The emailadress, which you have entered is not valid. Please try again')
                app.Lamp_Email.Color = 'r';
            end
        end

        % Value changed function: CreationDateDatePicker
        function CreationDateDatePickerValueChanged(app, event)
            app.CreationDate = app.CreationDateDatePicker.Value;
            app.CreationDate = char(datetime(app.CreationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            if ~isempty(app.creationtime)
                creationtime = datetime(app.TimeEditField.Value,"Format","HH:mm");
                creaHH = hour(creationtime);
                creamm = minute(creationtime);
                app.CreationDate = datetime(app.CreationDate) + hours(creaHH) + minutes(creamm);
                app.CreationDate = char(datetime(app.CreationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                app.CreationDate = char(datetime(app.CreationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            end
            app.Lamp_CreationDate.Color = 'g';
        end

        % Value changed function: TimeEditField
        function TimeEditFieldValueChanged(app, event)
            app.creationtime = datetime(app.TimeEditField.Value,"Format","HH:mm");
            creationtime=app.creationtime;
            creaHH = hour(creationtime);
            creamm = minute(creationtime);
            if ~isempty(app.CreationDate)
            app.CreationDate = datetime(app.CreationDate) + hours(creaHH) + minutes(creamm);
            app.CreationDate = char(datetime(app.CreationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                errordlg('Please enter date.')
            end
%             disp(app.CreationDate)
        end

        % Value changed function: StartDateDatePicker
        function StartDateDatePickerValueChanged(app, event)
            app.StartDate = app.StartDateDatePicker.Value;
            app.StartDate = char(datetime(app.StartDate,'Format','yyyy-MM-dd HH:mm:ss'));
            if ~isempty(app.starttime)
                starttime = datetime(app.TimeEditField_2.Value,"Format","HH:mm");
                startHH = hour(starttime);
                startmm = minute(starttime);
                app.StartDate = datetime(app.StartDate) + hours(startHH) + minutes(startmm);
                app.StartDate = char(datetime(app.StartDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                app.StartDate = char(datetime(app.StartDate,'Format','yyyy-MM-dd HH:mm:ss'));
            end
            app.Lamp_StartDate.Color = 'g';
        end

        % Value changed function: TimeEditField_2
        function TimeEditField_2ValueChanged(app, event)
            app.starttime = datetime(app.TimeEditField_2.Value,'InputFormat','HH:mm');
            starttime = app.starttime;
            startHH = hour(starttime);
            startmm = minute(starttime);
            if ~isempty(app.StartDate)
            app.StartDate = datetime(app.StartDate) + hours(startHH) + minutes(startmm);
            app.StartDate = char(datetime(app.StartDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                errordlg('Please enter date.')
            end
        end

        % Value changed function: EndDateDatePicker
        function EndDateDatePickerValueChanged(app, event)
            app.EndDate = app.EndDateDatePicker.Value;
            app.EndDate = char(datetime(app.EndDate,'Format','yyyy-MM-dd HH:mm:ss'));
            if ~isempty(app.endtime)
                endtime = datetime(app.TimeEditField_3.Value,"Format","HH:mm");
                endHH = hour(endtime);
                endmm = minute(endtime);
                app.EndDate = datetime(app.EndDate) + hours(endHH) + minutes(endmm);
                app.EndDate = char(datetime(app.EndDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                app.EndDate = char(datetime(app.EndDate,'Format','yyyy-MM-dd HH:mm:ss'));
            end
            app.Lamp_EndDate.Color = 'g';
        end

        % Value changed function: TimeEditField_3
        function TimeEditField_3ValueChanged(app, event)
            app.endtime = datetime(app.TimeEditField_3.Value,'InputFormat','HH:mm');
            endtime = app.endtime;
            endHH = hour(endtime);
            endmm = minute(endtime);
            if ~isempty(app.EndDate)
            app.EndDate = datetime(app.EndDate) + hours(endHH) + minutes(endmm);
            app.EndDate = char(datetime(app.EndDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                errordlg('Please enter date.')
            end
        end

        % Value changed function: InstitutionEditField
        function InstitutionEditFieldValueChanged(app, event)
            if app.Lamp_Institution.Color == [0,1,0]
                app.Lamp_Institution.Color = 'r';
            end
            institution = app.InstitutionEditField.Value;
            clear C
            fileID = fopen('.\libs\RECO_Export_07-14-2021-01-14-31.csv');
            Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=institution;
            ix=strfind(Q{1,3},matchstr);
            idx = find(~cellfun(@isempty,ix));
            C{1}='Select ...';
            for ii=1:length(idx)
                name=char(Q{1,3}(idx(ii)));
                C{ii+1} = name;
            end
            app.SelectDropDown.Items = C;
        end

        % Value changed function: SelectDropDown
        function SelectDropDownValueChanged(app, event)
            Institution = app.SelectDropDown.Value;
            fileID = fopen('.\libs\RECO_Export_07-14-2021-01-14-31.csv');
            Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=Institution;
            [~,idx]=intersect(Q{1,3},matchstr);
%             ix=strfind(Q{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one Institution with this name were found. Please try again or enter Institution code from: https://vocab.ices.dk/?ref=1398')
            else
                app.Institution = char(Q{1,2}(idx));
                app.Lamp_Institution.Color = 'g';
            end  
        end

        % Value changed function: ContactEditField
        function ContactEditFieldValueChanged(app, event)
            Contact = app.ContactEditField.Value;
            p = max(strfind(Contact,'.'));
            app.Contact = Contact;
            app.Lamp_Contact.Color = 'g';
        end

        % Value changed function: CountryCodeDropDown
        function CountryCodeDropDownValueChanged(app, event)
            app.CountryCode = app.CountryCodeDropDown.Value;
            app.Lamp_CountryCode.Color = 'g';
        end

        % Value changed function: StationCodeEditField
        function StationCodeEditFieldValueChanged(app, event)

            StationCode = app.StationCodeEditField.Value;
            clear C
            fileID = fopen('.\libs\StationCode.csv');
            Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=StationCode;
            ix=strfind(Q{1,3},matchstr);
            idx = find(~cellfun(@isempty,ix));
            C{1}='Select ...';
            for ii=1:length(idx)
                name=char(Q{1,3}(idx(ii)));
                C{ii+1} = name;
            end
            app.SelectDropDown_StationCode.Items = C;
        end

        % Value changed function: SelectDropDown_StationCode
        function SelectDropDown_StationCodeValueChanged(app, event)
            StationCode = app.SelectDropDown_StationCode.Value;
            if app.Lamp_StationCode.Color == [0,1,0]
                app.Lamp_StationCode.Color = 'r';
            else
            if isequal(StationCode, 'Select ...') 
                app.Lamp_HydrophoneType.Color = 'r';
            else
            fileID = fopen('.\libs\StationCode.csv');
            Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=StationCode;
            [~,idx]=intersect(Q{1,3},matchstr);
%             ix=strfind(Q{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one Station with this station code were found. Please try again or enter station code from: https://vocab.ices.dk/?ref=1399')
            else
                app.StationCode = char(Q{1,2}(idx));
                app.Lamp_StationCode.Color = 'g';
            end
            end  
            end
        end

        % Value changed function: HydrophoneTypeDropDown
        function HydrophoneTypeDropDownValueChanged(app, event)
            HydrophoneType = app.HydrophoneTypeDropDown.Value;
            if isequal(HydrophoneType, 'Select ...') 
                app.Lamp_HydrophoneType.Color = 'r';
            else
            fileID = fopen('.\libs\HydrophoneType.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=HydrophoneType;
            [~,idx]=intersect(C{1,3},matchstr);
%             ix=strfind(C{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one Hydrophone with this name were found. Please report incostency in Hydrophone type vocabulary to ICES (accessions@ices.dk).')
            else
                app.HydrophoneType =  C{1,2}(idx);
                app.Lamp_HydrophoneType.Color = 'g';
            end   
            end
        end

        % Value changed function: HydrophoneSerialNumberEditField
        function HydrophoneSerialNumberEditFieldValueChanged(app, event)
            app.HydrophoneSerialNumber = app.HydrophoneSerialNumberEditField.Value;
            app.Lamp_HydrophoneSerialNumber.Color = 'g';    
        end

        % Value changed function: RecorderTypeDropDown
        function RecorderTypeDropDownValueChanged(app, event)
            RecorderType = app.RecorderTypeDropDown.Value;
            if isequal(RecorderType, 'Select ...') 
                app.Lamp_RecorderType.Color = 'r';
            else
            fileID = fopen('.\libs\RecorderType.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=RecorderType;
            [~,idx]=intersect(C{1,3},matchstr);
            if length(idx)>1
                errordlg('More than one Recorder with this name were found. Please report incostency in Recorder type vocabulary to ICES (accessions@ices.dk).')
            else
                app.RecorderType =  C{1,2}(idx);
                app.Lamp_RecorderType.Color = 'g';
            end   
            end
        end

        % Value changed function: RecorderSerialNumberEditField
        function RecorderSerialNumberEditFieldValueChanged(app, event)
            app.RecorderSerialNumber = app.RecorderSerialNumberEditField.Value;
            app.Lamp_RecorderSerialNumber.Color = 'g'; 
        end

        % Value changed function: MeasurementHeightEditField
        function MeasurementHeightEditFieldValueChanged(app, event)
            app.MeasurementHeight = str2num(app.MeasurementHeightEditField.Value);
            app.Lamp_MeasurementHeight.Color = 'g';
        end

        % Value changed function: MeasurementPurposeDropDown
        function MeasurementPurposeDropDownValueChanged(app, event)
            MeasurementPurpose = app.MeasurementPurposeDropDown.Value;
            if isequal(MeasurementPurpose, 'Select ...') 
                app.Lamp_MeasurementPurpose.Color = 'r';
            else
            fileID = fopen('.\libs\MeasurementPurpose.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=MeasurementPurpose;
            [~,idx]=intersect(C{1,3},matchstr);
%             ix=strfind(C{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one ICES - code were found for this measurement purpose. Please report incostency in Recorder type vocabulary to ICES (accessions@ices.dk).')
            else
                app.MeasurementPurpose =  C{1,2}(idx);
                app.Lamp_MeasurementPurpose.Color = 'g';
            end   
            end
        end

        % Value changed function: MeasurementSetupDropDown
        function MeasurementSetupDropDownValueChanged(app, event)
            MeasurementSetup = app.MeasurementSetupDropDown.Value;
            if isequal(MeasurementSetup, 'Select ...') 
                app.Lamp_MeasurementSetup.Color = 'r';
            else
            fileID = fopen('.\libs\MeasurementSetup.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=MeasurementSetup;
            [~,idx]=intersect(C{1,3},matchstr);
%             ix=strfind(C{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one ICES - code were found for this measurement setup. Please report incostency in Recorder type vocabulary to ICES (accessions@ices.dk).')
            else
                app.MeasurementSetup =  C{1,2}(idx);
                app.Lamp_MeasurementSetup.Color = 'g';
            end   
            end
        end

        % Value changed function: RigDesignDropDown
        function RigDesignDropDownValueChanged(app, event)
            RigDesign = app.RigDesignDropDown.Value;
            if isequal(RigDesign, 'Select ...') 
                app.Lamp_RigDesign.Color = 'r';
            else
            fileID = fopen('.\libs\RigDesign.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=RigDesign;
            [~,idx]=intersect(C{1,3},matchstr);
%             ix=strfind(C{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one ICES - code were found for this rig design. Please report incostency in Recorder type vocabulary to ICES (accessions@ices.dk).')
            else
                app.RigDesign =  C{1,2}(idx);
                app.Lamp_RigDesign.Color = 'g';
%                 disp(app.RigDesign)
            end   
            end
        end

        % Value changed function: FrequencyCountSpinner
        function FrequencyCountSpinnerValueChanged(app, event)
            app.FrequencyCount = cast(app.FrequencyCountSpinner.Value,'uint64');
            app.Lamp_FrequencyCount.Color = 'g';
        end

        % Callback function
        function FrequencyIndexEditFieldValueChanged(app, event)
            value = app.FrequencyIndexEditField.Value;
            app.Lamp_FrequencyIndex.Color = 'g';
        end

        % Value changed function: 
        % consecutiveThirdOctaveBandsCheckBox
        function consecutiveThirdOctaveBandsCheckBoxValueChanged(app, event)
            value = app.consecutiveThirdOctaveBandsCheckBox.Value;
            if value == 1
                set(app.LowestTOBDropDown, 'Enable', 'on')
                set(app.HighestTOBDropDown, 'Enable', 'on')
                set(app.FrequencyIndexEditField, 'Enable', 'off')
                set(app.FrequencyIndexEditField, 'Editable', 'off')
                set(app.fileButton, 'Enable', 'off')               
                app.individualFrequencyBandsCheckBox.Value = 0;
                app.LoadFrequencyBandsfromCheckBox.Value = 0;
            else
                set(app.LowestTOBDropDown, 'Enable', 'off')
                set(app.HighestTOBDropDown, 'Enable', 'off')
            end
        end

        % Value changed function: individualFrequencyBandsCheckBox
        function individualFrequencyBandsCheckBoxValueChanged(app, event)
            value = app.individualFrequencyBandsCheckBox.Value;
            if value == 0
                set(app.FrequencyIndexEditField, 'Enable', 'off')
            else
                set(app.FrequencyIndexEditField, 'Enable', 'on')
                set(app.FrequencyIndexEditField, 'Editable', 'on')
                set(app.LowestTOBDropDown, 'Enable', 'off')
                set(app.HighestTOBDropDown, 'Enable', 'off')
                set(app.fileButton, 'Enable', 'off')
                app.consecutiveThirdOctaveBandsCheckBox.Value = 0;
                app.LoadFrequencyBandsfromCheckBox.Value = 0;
            end
        end

        % Value changed function: LoadFrequencyBandsfromCheckBox
        function LoadFrequencyBandsfromCheckBoxValueChanged(app, event)
            value = app.LoadFrequencyBandsfromCheckBox.Value;
            if value == 0
                set(app.fileButton, 'Enable', 'off')
            else
                set(app.fileButton, 'Enable', 'on')
                set(app.LowestTOBDropDown, 'Enable', 'off')
                set(app.HighestTOBDropDown, 'Enable', 'off')
                set(app.FrequencyIndexEditField, 'Enable', 'off')
                app.consecutiveThirdOctaveBandsCheckBox.Value = 0;
                app.individualFrequencyBandsCheckBox.Value = 0;
            end
        end

        % Value changed function: LowestTOBDropDown
        function LowestTOBDropDownValueChanged(app, event)
            value = str2num(app.LowestTOBDropDown.Value);
            freqs=load('./libs/freqs.mat');
            freqs=freqs.freqs;
            [~,x] = min(abs(freqs-value));
            if ~isempty(app.fi_u)
                [~,y] = min(abs(app.fi_u-freqs));
                app.fi = double(freqs(x:y));
                app.Lamp_FrequencyIndex.Color = 'g';
            end
            app.fi_l = freqs(x);
            clear freqs
        end

        % Value changed function: HighestTOBDropDown
        function HighestTOBDropDownValueChanged(app, event)
            value = str2num(app.HighestTOBDropDown.Value);
            freqs=load('./libs/freqs.mat');
            freqs=freqs.freqs;
            [~,y] = min(abs(value-freqs));
            if ~isempty(app.fi_l)
                [~,x] = min(abs(app.fi_l-freqs));
                app.fi = double(freqs(x:y));
                app.Lamp_FrequencyIndex.Color = 'g';
            end
            app.fi_u = freqs(y);  
            clear freqs
        end

        % Value changed function: FrequencyIndexEditField
        function FrequencyIndexEditFieldValueChanged2(app, event)
            value = app.FrequencyIndexEditField.Value;
            value = str2num(value);
            app.fi = double(value);
            app.Lamp_FrequencyIndex.Color = 'g';
        end

        % Button pushed function: fileButton
        function fileButtonPushed(app, event)
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5;*.mat;*.csv','Data Files (*.h5,*.mat,*.csv)';'*.*','All Files (*.*)'}, ...
            'Select File',lastdir);   
            drawnow;
            figure(app.UIFigure)          
            p = max(strfind(file,'.'));
            type = file(p+1:end);
            if isequal(type,'mat')
                F = load([path file]);
                F = struct2cell(F);
                F = cell2mat(F);
                app.fi = double(F);
                app.Lamp_FrequencyIndex.Color = 'g';
            elseif isequal(type,'csv')
                F = importdata([path file]);
                app.fi = double(F);
                app.Lamp_FrequencyIndex.Color = 'g';
            elseif isequal(type,'h5')
%                 I=h5info([path file]);
%                 IG = I.Groups;
%                 for ii =1:length(IG)
%                     for jj=1:length(IG(ii).Datasets)
%                         name{ii,jj}=IG(ii).Datasets(jj).Name;
%                     end
%                 end
                 I=h5info([path file]);
                 %% datasets, die in der ersten Ebene liegen
                 idx=1;
                 for ii =1:length(I.Datasets)
                        name{idx}=I.Datasets(ii).Name;
                        group{idx}=I.Name;
                        idx=idx+1;
                 end
                 %% check wie viele Gruppen gibt es
                 if length(I.Groups)>=1
                    for ii=1:length(I.Groups)
                        for jj=1:length(I.Groups(ii).Datasets)
                            name{idx}= I.Groups(ii).Datasets(jj).Name;
                            group{idx}= I.Groups(ii).Name;
                            idx=idx+1;
                        end
                        if length(I.Groups(ii).Groups)>=1
                            for kk=1:length(I.Groups(ii).Groups)
                                for ll=1:length(I.Groups(ii).Groups(kk).Datasets)
                                    name{idx}= I.Groups(ii).Groups(kk).Datasets(ll).Name;
                                    group{idx}= I.Groups(ii).Groups(kk).Name;
                                    idx=idx+1;
                                end
                            end
                        end
                    end
                 end
%                 emptyCells = cellfun(@isempty,name);
%                 datasets=name(emptyCells==0);
                [indx,~] = listdlg('SelectionMode','single','ListString',name);
                drawnow;
                figure(app.UIFigure)
%                 for ii =1:length(IG)
%                     for jj=1:length(IG(ii).Datasets)
%                         name=char(IG(ii).Datasets(jj).Name);
%                             if isequal(name,char(name(indx)))
%                                 Group = IG(ii).Name;
%                                 Dataset = IG(ii).Datasets(jj).Name;
%                             end
%                     end
%                 end
                Group = group{indx};
                Dataset = name{indx};
                F = h5read([path file],['/' Group '/' Dataset]);
                app.fi=double(F);
                drawnow;
                figure(app.UIFigure)
                app.Lamp_FrequencyIndex.Color = 'g';
                app.loadpath = path;
            end
        end

        % Value changed function: FrequencyUnitDropDown
        function FrequencyUnitDropDownValueChanged(app, event)
            value = app.FrequencyUnitDropDown.Value;
            app.fu = 'Hz';
            app.Lamp_FrequencyUnit.Color = 'g';
        end

        % Value changed function: ChannelCountSpinner
        function ChannelCountSpinnerValueChanged(app, event)
            value = app.ChannelCountSpinner.Value;
            if ~isempty(app.New)
                if length(app.New.button)> value
                    for ii=value+1:length(app.New.button)
                        delete(app.New.button{1,ii});
                        delete(app.New.lamp{1,ii});      
                    end
                end
            end
            app.ChannelCount = cast(value,'uint64');
            app.Lamp_ChannelCount.Color = 'g';
%             C{1} = 'Select ...';
%             for ii = 1:value
%                 name=num2str(ii);
%                 C{ii+1} = name;
%             end
% %             app.SelectChannelDropDown.Items=C;
% %             set(app.SelectChannelDropDown, 'Enable', 'on')
if value==1
    start =1;
else
    start = length(app.New.button)+1;
end
            for ii=start:value
            app.New.button{1,ii} = uibutton(app.LeqMeasurementsPanel,'push','Text',['Leq Measurements of Channel ' num2str(ii)],'Position',[50,380-23*ii, 200, 22]);
            app.New.lamp{1,ii} = uilamp(app.LeqMeasurementsPanel,"Color",'r',"Position",[10,380-23*ii, 20, 20]);
            app.New.button{1,ii}.ButtonPushedFcn = @app.leqbuttondown;
            end
        end

        % Value changed function: MeasurementTotalNoEditField
        function MeasurementTotalNoEditFieldValueChanged(app, event)
            value = app.MeasurementTotalNoEditField.Value;
            app.MeasurementTotalNo = cast(value,'uint64');
            app.Lamp_MeasurementTotalNo.Color = 'g';
        end

        % Value changed function: MeasurementUnitDropDown
        function MeasurementUnitDropDownValueChanged(app, event)
            value = app.MeasurementUnitDropDown.Value;
            app.MeasurementUnit = 'SPL';
            app.Lamp_MeasurementUnit.Color = 'g';
        end

        % Value changed function: AveragingTimeSpinner
        function AveragingTimeSpinnerValueChanged(app, event)
            value = app.AveragingTimeSpinner.Value;
            app.AveragingTime = cast(value,'uint64')
            app.Lamp_AveragingTime.Color = 'g';
        end

        % Value changed function: ProcessingAlgorithmDropDown
        function ProcessingAlgorithmDropDownValueChanged(app, event)
            ProcessingAlgorithm = app.ProcessingAlgorithmDropDown.Value;  
            if isequal(ProcessingAlgorithm, 'Select ...') 
                app.Lamp_ProcessingAlgorithm.Color = 'r';
            else
            fileID = fopen('.\libs\ProcessingAlgorithm.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=ProcessingAlgorithm;
            [~,idx]=intersect(C{1,3},matchstr);
%             ix=strfind(C{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one code were found for this processing algorithm. Please report incostency in Processing Algorithm vocabulary to ICES (accessions@ices.dk).')
            else
                app.ProcessingAlgorithm =  C{1,2}(idx);
                app.Lamp_ProcessingAlgorithm.Color = 'g';
            end   
            end
            
        end

        % Button pushed function: CreateUUIDButton
        function CreateUUIDButtonPushed(app, event)
            UUID = char(java.util.UUID.randomUUID);
            app.DataUUIDEditField.Value = UUID;
            app.UUID = UUID;
            app.Lamp_DataUUID.Color = 'g';
        end

        % Value changed function: DatasetVersionSpinner
        function DatasetVersionSpinnerValueChanged(app, event)
            value = app.DatasetVersionSpinner.Value;
            app.DatasetVersion = num2str(value);
            app.Lamp_DatasetVersion.Color = 'g';
        end

        % Value changed function: CalibrationProcedureDropDown
        function CalibrationProcedureDropDownValueChanged(app, event)
            CalibrationProcedure = app.CalibrationProcedureDropDown.Value;
            if isequal(CalibrationProcedure, 'Select ...') 
                app.Lamp_CalibrationProcedure.Color = 'r';
            else
            fileID = fopen('.\libs\CalibrationProcedure.csv');
            C = textscan(fileID,'%s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=CalibrationProcedure;
            [~,idx]=intersect(C{1,3},matchstr);
%             ix=strfind(C{1,3},matchstr);
%             idx = find(~cellfun(@isempty,ix));
            if length(idx)>1
                errordlg('More than one code were found for this calibration procedure. Please report incostency in Calibration Procedure vocabulary to ICES (accessions@ices.dk).')
            else
                app.CalibrationProcedure =  C{1,2}(idx);
                app.Lamp_CalibrationProcedure.Color = 'g';
            end   
            end
        end

        % Value changed function: CalibrationDatetimeDatePicker
        function CalibrationDatetimeDatePickerValueChanged(app, event)
            app.CalibrationDate = app.CalibrationDatetimeDatePicker.Value;
            app.CalibrationDate = char(datetime(app.CalibrationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            if ~isempty(app.calibrationtime)
                calibrationtime = datetime(app.TimeEditField_4,"Format","HH:mm");
                caliHH =hour(calibrationtime);
                calimm =minute(calibrationtime);
                app.CalibrationDate = datetime(app.CalibrationDate)+hours(caliHH)+minutes(calimm);
                app.CalibrationDate = char(datetime(app.CreationDate,'Format','yyyy-MM-dd HH:mm:ss'))
            else
                app.CalibrationDate = char(datetime(app.CalibrationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            end
            app.Lamp_CalibrationDatetime.Color = 'g';
        end

        % Value changed function: TimeEditField_4
        function TimeEditField_4ValueChanged(app, event)
            calibrationtime = datetime(app.TimeEditField_4.Value,'InputFormat','HH:mm');
            caliHH = hour(calibrationtime);
            calimm = minute(calibrationtime);
            if ~isempty('app.CalibrationDate')
            app.CalibrationDate = datetime(app.CalibrationDate) + hours(caliHH) + minutes(calimm);
            app.CalibrationDate = char(datetime(app.CalibrationDate,'Format','yyyy-MM-dd HH:mm:ss'));
            else
                errordlg('Please enter date.')
            end

        end

        % Value changed function: CommentsEditField
        function CommentsEditFieldValueChanged(app, event)
            value = app.CommentsEditField.Value;
            app.comments = value;
            app.Lamp_Comments.Color = 'g';
        end

        % Callback function
        function SelectChannelDropDownValueChanged(app, event)
            value = app.SelectChannelDropDown.Value;
            app.ActCH = value;
            app.LeqMeasurementsofChannel1Label.Text = ['Leq Measurements of Channel ', value];
            app.SelectLeqMeasurementsofChannel1Button.Text = ['Select LeqMeasurements of Channel ', value];
            set(app.SelectLeqMeasurementsofChannel1Button, 'Enable', 'on')
        end

        % Button pushed function: SelectDatetimeVectorButton
        function SelectDatetimeVectorButtonPushed(app, event)
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5;*.mat;*.csv','Data Files (*.h5,*.mat,*.csv)';'*.*','All Files (*.*)'}, ...
            'Select File',lastdir); 
            drawnow;
            figure(app.UIFigure)          
            p = max(strfind(file,'.'));
            type = file(p+1:end);
            if isequal(type,'mat')
                F = load([path file]);
%                 F = struct2cell(F);
                app.datetimeindex = F.F;
                app.Lamp_DateTime.Color = 'g';
            elseif isequal(type,'csv')
                F = importdata([path file]);
                app.datetimeindex = F;
                app.Lamp_DateTime.Color = 'g';
            elseif isequal(type,'h5')
                I=h5info([path file]);
%                 IG = I.Groups;
%                 for ii =1:length(IG)
%                     for jj=1:length(IG(ii).Datasets)
%                         name{ii,jj}=IG(ii).Datasets(jj).Name;
%                     end
%                 end
%                 emptyCells = cellfun(@isempty,name);
%                 datasets=name(emptyCells==0);
 I=h5info([path file]);
 
 %% datasets, die in der ersten Ebene liegen
                 idx=1;
                 for ii =1:length(I.Datasets)
                        name{idx}=I.Datasets(ii).Name;
                        group{idx}=I.Name;
                        idx=idx+1;
                 end
                 %% check wie viele Gruppen gibt es
                 if length(I.Groups)>=1
                    for ii=1:length(I.Groups)
                        for jj=1:length(I.Groups(ii).Datasets)
                            name{idx}= I.Groups(ii).Datasets(jj).Name;
                            group{idx}= I.Groups(ii).Name;
                            idx=idx+1;
                        end
                        if length(I.Groups(ii).Groups)>=1
                            for kk=1:length(I.Groups(ii).Groups)
                                for ll=1:length(I.Groups(ii).Groups(kk).Datasets)
                                    name{idx}= I.Groups(ii).Groups(kk).Datasets(ll).Name;
                                    group{idx}= I.Groups(ii).Groups(kk).Name;
                                    idx=idx+1;
                                end
                            end
                        end
                    end
                 end
                [indx,~] = listdlg('SelectionMode','single','ListString',name);
                drawnow;
                figure(app.UIFigure)
%                 for ii =1:length(IG)
%                     for jj=1:length(IG(ii).Datasets)
%                         name=char(IG(ii).Datasets(jj).Name);
%                             if isequal(name,char(datasets(indx)))
%                                 Group = IG(ii).Name;
%                                 Dataset = IG(ii).Datasets(jj).Name;
%                             end
%                     end
%                 end
                Group = group{indx};
                Dataset = name{indx};
                F = h5read([path file],['/' Group '/' Dataset]);
                if datetime(F(1),'ConvertFrom','datenum') > datetime(2010,1,1) && datetime(F(1),'ConvertFrom','datenum') < datetime(2100,1,1)
                    tp = 'datenum';
                    F=cellstr(datetime(F,'ConvertFrom',tp,'Format','yyyy-MM-dd HH:mm:ss'));
                    app.datetimeindex=F;    
                elseif datetime(F(1),'ConvertFrom','juliandate') > datetime(2010,1,1) && datetime(F(1),'ConvertFrom','juliandate') < datetime(2100,1,1)
                    tp = 'juliandate';
                    F=cellstr(datetime(F,'ConvertFrom',tp,'Format','yyyy-MM-dd HH:mm:ss'));
                    app.datetimeindex=F;    
                elseif datetime(F(1),'ConvertFrom','excel') > datetime(2010,1,1) && datetime(F(1),'ConvertFrom','excel') < datetime(2100,1,1)
                    tp = 'excel';
                    F=cellstr(datetime(F,'ConvertFrom',tp,'Format','yyyy-MM-dd HH:mm:ss'));
                    app.datetimeindex=F;    
                elseif datetime(F(1),'ConvertFrom','posixtime') > datetime(2010,1,1) && datetime(F(1),'ConvertFrom','posixtime') < datetime(2100,1,1)
                    tp = 'posixtime';
                    F=cellstr(datetime(F,'ConvertFrom',tp,'Format','yyyy-MM-dd HH:mm:ss'));
                    app.datetimeindex=F;    
                elseif datetime(num2str(F(1)),'InputFormat','yyyyMMddHHmmss') > datetime(2010,1,1) && datetime(num2str(F(1)),'InputFormat','yyyyMMddHHmmss') < datetime(2100,1,1)
                    F=cellstr(datetime(num2str(F),'InputFormat','yyyyMMddHHmmss','Format','yyyy-MM-dd HH:mm:ss'));
                    app.datetimeindex=F; 
                else
                    errordlg('Datetime type not recognized')
                end         
                drawnow;
                figure(app.UIFigure)
                app.Lamp_DateTime.Color = 'g';
            end
            
            
            
            
            app.loadpath = path;
        end

        % Callback function
        function SelectLeqMeasurementsofChannel1ButtonPushed(app, event)
            %% get channel
            channel = str2num(app.ActCH);
            %% get Leqs from file
            [file,path] = uigetfile({'*.mat';'*.csv';'*.h5'},...
                          'File Selector'); 
            drawnow;
            figure(app.UIFigure)
            p = max(strfind(file,'.'));
            type = file(p+1:end);
            if isequal(type,'mat')
                F = load([path file]);
                F = struct2cell(F);
                F = cell2mat(F);
                app.leq{1,channel} = double(F);
                app.Lamp_leq.Color = 'g';
            elseif isequal(type,'csv')
                F = importdata([path file]);
                app.leq{1,channel} = double(F);
                app.Lamp_leq.Color = 'g';
            elseif isequal(type,'h5')
                I=h5info([path file]);
                IG = I.Groups;
                for ii =1:length(IG)
                    for jj=1:length(IG(ii).Datasets)
                        name{ii,jj}=IG(ii).Datasets(jj).Name;
                    end
                end
                emptyCells = cellfun(@isempty,name);
                datasets=name(emptyCells==0);
                [indx,tf] = listdlg('SelectionMode','single','ListString',datasets);
                drawnow;
                figure(app.UIFigure)
                for ii =1:length(IG)
                    for jj=1:length(IG(ii).Datasets)
                        name=char(IG(ii).Datasets(jj).Name);
                            if isequal(name,char(datasets(indx)))
                                Group = IG(ii).Name;
                                Dataset = IG(ii).Datasets(jj).Name;
                            end
                    end
                end
                F = h5read([path file],['/' Group '/' Dataset]);
                app.leq{1,channel}=double(F);
                drawnow;
                figure(app.UIFigure)
                app.Lamp_leq.Color = 'g';
            end
            
            
        end

        % Button pushed function: WritetoICESh5fileButton
        function WritetoICESh5fileButtonPushed(app, event)
            %% where
            [file,path] = uiputfile('*.h5', 'Save as:');
            drawnow;
            figure(app.UIFigure);
            %% Create the dataset:
            
dset = struct(...
    'FileInformation', struct( ...
    'Email', app.Email, ...
    'CreationDate', app.CreationDate, ...
    'StartDate', app.StartDate, ...
    'EndDate',app.EndDate, ...
    'Institution',app.Institution, ...
    'Contact', app.Contact, ...
    'CountryCode', app.CountryCode, ...
    'StationCode', app.StationCode), ...
    'Metadata', struct( ...
    'HydrophoneType', app.HydrophoneType, ...
    'HydrophoneSerialNumber', app.HydrophoneSerialNumber, ...
    'RecorderType', app.RecorderType, ...
    'RecorderSerialNumber', app.RecorderSerialNumber, ...
    'MeasurementHeight', app.MeasurementHeight, ...
    'MeasurementPurpose', app.MeasurementPurpose, ...
    'MeasurementSetup',app.MeasurementSetup, ...
    'RigDesign', app.RigDesign, ...
    'FrequencyCount', app.FrequencyCount, ...
    'FrequencyIndex', app.fi, ...
    'FrequencyUnit', app.fu, ...
    'ChannelCount', app.ChannelCount, ...
    'MeasurementTotalNo', app.MeasurementTotalNo, ...
    'MeasurementUnit', app.MeasurementUnit, ...
    'AveragingTime', app.AveragingTime, ...
    'ProcessingAlgorithm', app.ProcessingAlgorithm, ...
    'DataUUID', app.UUID, ...
    'DatasetVersion', app.DatasetVersion, ...
    'CalibrationProcedure', app.CalibrationProcedure, ...
    'CalibrationDateTime', app.CalibrationDate, ...
    'Comments', app.comments), ...
    'Data', struct( ...
    'LeqMeasurementsOfChannel1', app.leq{1,1}))
    
%% creates and writes data to hdf5 file (file must not exits at time of function call)
name = [path file];
matlab_write_recursive_hdf5(name, '', dset);
hdf5write(name,'/Data/DateTime',app.datetimeindex,'WriteMode', 'append');

if length(app.leq)>1
    for ii=2:length(app.leq)
        hdf5write(name,['/Data/LeqMeasurementsOfChannel' num2str(ii)],app.leq{1,ii},'WriteMode', 'append');
    end
end
app.saveh5name = name;


% % end
% end
% for ii =1:length(app.leq)
%     hdf5write(name,['/Data/LeqMeasurementsOfChannel' num2str(ii)],app.leq{1,ii},'WriteMode', 'append')
% end
% app.saveh5name = name;

        end

        % Button pushed function: MovealldatatoMATLABworkspaceButton
        function MovealldatatoMATLABworkspaceButtonPushed(app, event)
dset = struct(...
    'FileInformation', struct( ...
    'Email', app.Email, ...
    'CreationDate', app.CreationDate, ...
    'StartDate', app.StartDate, ...
    'EndDate',app.EndDate, ...
    'Institution',app.Institution, ...
    'Contact', app.Contact, ...
    'CountryCode', app.CountryCode, ...
    'StationCode', app.StationCode), ...
    'Metadata', struct( ...
    'HydrophoneType', app.HydrophoneType, ...
    'HydrophoneSerialNumber', app.HydrophoneSerialNumber, ...
    'RecorderType', app.RecorderType, ...
    'RecorderSerialNumber', app.RecorderSerialNumber, ...
    'MeasurementHeight', app.MeasurementHeight, ...
    'MeasurementPurpose', app.MeasurementPurpose, ...
    'MeasurementSetup',app.MeasurementSetup, ...
    'RigDesign', app.RigDesign, ...
    'FrequencyCount', app.FrequencyCount, ...
    'FrequencyIndex', app.fi, ...
    'FrequencyUnit', app.fu, ...
    'ChannelCount', app.ChannelCount, ...
    'MeasurementTotalNo', app.MeasurementTotalNo, ...
    'MeasurementUnit', app.MeasurementUnit, ...
    'AveragingTime', app.AveragingTime, ...
    'ProcessingAlgorithm', app.ProcessingAlgorithm, ...
    'DataUUID', app.UUID, ...
    'DatasetVersion', app.DatasetVersion, ...
    'CalibrationProcedure', app.CalibrationProcedure, ...
    'CalibrationDateTime', app.CalibrationDate, ...
    'Comments', app.comments), ...
    'Data', struct( ...
    'DateTime', cell2mat(app.datetimeindex), ...
    'LeqMeasurementsOfChannel1', app.leq{1,1}));

if length(app.leq)>1
    for ii =2:length(app.leq)
        newstruct = ['LeqMeasurementsOfChannel' num2str(ii)];
        dset.Data.(newstruct) = app.leq{1,ii};
    end
end

%     'DateTime', app.datetimeindex, ...
assignin('base','h5File',dset);
        end

        % Button pushed function: 
        % GotoICEScontinuousnoiseregistryButton
        function GotoICEScontinuousnoiseregistryButtonPushed(app, event)
            dos('explorer https://underwaternoise.ices.dk/continuous/manage/'); %Explorer
        end

        % Button pushed function: Viewh5filewithhdfviewButton
        function Viewh5filewithhdfviewButtonPushed(app, event)
            if ~isempty(app.saveh5name)
            winopen(app.saveh5name);
            else
                warndlg('No h5 file was exported.')
            end
        end

        % Menu selected function: 
        % SeeICEScontinuousnoisedataformatMenu
        function SeeICEScontinuousnoisedataformatMenuSelected(app, event)
            winopen('libs\ICES_format.pdf');
        end

        % Button pushed function: fromfileButton_2
        function fromfileButton_2Pushed(app, event)
%             [file,path] = uigetfile({'*.h5';'*.mat';'*.csv'},...
%                           'File Selector');   
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5;*.mat;*.csv','Data Files (*.h5,*.mat,*.csv)';'*.*','All Files (*.*)'}, ...
            'Select File',lastdir); 
            drawnow;
            figure(app.UIFigure)          
            p = max(strfind(file,'.'));
            type = file(p+1:end);
            if isequal(type,'mat')
                F = load([path file]);
                F = struct2cell(F);
                F = cell2mat(F);
                app.MeasurementTotalNo = cast(F,'uint64');
                app.MeasurementTotalNoEditField.Value = cast(F,'uint64');
                app.Lamp_MeasurementTotalNo.Color = 'g';
            elseif isequal(type,'csv')
                F = importdata([path file]);
                app.MeasurementTotalNo = cast(F,'uint64');
                app.MeasurementTotalNoEditField.Value = cast(F,'uint64');
                app.Lamp_MeasurementTotalNo.Color = 'g';
            elseif isequal(type,'h5')
                 I=h5info([path file]);
                 %% datasets, die in der ersten Ebene liegen
                 idx=1;
                 for ii =1:length(I.Datasets)
                        name{idx}=I.Datasets(ii).Name;
                        group{idx}=I.Name;
                        idx=idx+1;
                 end
                 %% check wie viele Gruppen gibt es
                 if length(I.Groups)>=1
                    for ii=1:length(I.Groups)
                        for jj=1:length(I.Groups(ii).Datasets)
                            name{idx}= I.Groups(ii).Datasets(jj).Name;
                            group{idx}= I.Groups(ii).Name;
                            idx=idx+1;
                        end
                        if length(I.Groups(ii).Groups)>=1
                            for kk=1:length(I.Groups(ii).Groups)
                                for ll=1:length(I.Groups(ii).Groups(kk).Datasets)
                                    name{idx}= I.Groups(ii).Groups(kk).Datasets(ll).Name;
                                    group{idx}= I.Groups(ii).Groups(kk).Name;
                                    idx=idx+1;
                                end
                            end
                        end
                    end
                 end
                [indx,~] = listdlg('SelectionMode','single','ListString',name);
                drawnow;
                figure(app.UIFigure)
                Group = group{indx};
                Dataset = name{indx};
                F = h5read([path file],['/' Group '/' Dataset]);
                app.MeasurementTotalNo = cast(F,'uint64');
                app.MeasurementTotalNoEditField.Value = double(F);
                app.Lamp_MeasurementTotalNo.Color = 'g';
                drawnow;
                figure(app.UIFigure)
            end
        end

        % Button pushed function: fromfileButton
        function fromfileButtonPushed(app, event)
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5;*.mat;*.csv','Data Files (*.h5,*.mat,*.csv)';'*.*','All Files (*.*)'}, ...
            'Select File',lastdir);   
            drawnow;
            figure(app.UIFigure)          
            p = max(strfind(file,'.'));
            type = file(p+1:end);
            if isequal(type,'mat')
                F = load([path file]);
                F = struct2cell(F);
                F = cell2mat(F);
            app.FrequencyCount = cast(F,'uint64');
            app.FrequencyCountSpinner.Value = cast(F,'uint64');
            app.Lamp_FrequencyCount.Color = 'g';
            elseif isequal(type,'csv')
                F = importdata([path file]);
            app.FrequencyCount = cast(F,'uint64');
            app.FrequencyCountSpinner.Value = cast(F,'uint64');
            app.Lamp_FrequencyCount.Color = 'g';
            elseif isequal(type,'h5')
                 I=h5info([path file]);
                 %% datasets, die in der ersten Ebene liegen
                 idx=1;
                 for ii =1:length(I.Datasets)
                        name{idx}=I.Datasets(ii).Name;
                        group{idx}=I.Name;
                        idx=idx+1;
                 end
                 %% check wie viele Gruppen gibt es
                 if length(I.Groups)>=1
                    for ii=1:length(I.Groups)
                        for jj=1:length(I.Groups(ii).Datasets)
                            name{idx}= I.Groups(ii).Datasets(jj).Name;
                            group{idx}= I.Groups(ii).Name;
                            idx=idx+1;
                        end
                        if length(I.Groups(ii).Groups)>=1
                            for kk=1:length(I.Groups(ii).Groups)
                                for ll=1:length(I.Groups(ii).Groups(kk).Datasets)
                                    name{idx}= I.Groups(ii).Groups(kk).Datasets(ll).Name;
                                    group{idx}= I.Groups(ii).Groups(kk).Name;
                                    idx=idx+1;
                                end
                            end
                        end
                    end
                 end
                [indx,~] = listdlg('SelectionMode','single','ListString',name);
                drawnow;
                figure(app.UIFigure)
                Group = group{indx};
                Dataset = name{indx};
                F = h5read([path file],['/' Group '/' Dataset]);
                app.FrequencyCount = cast(F,'uint64');
                app.FrequencyCountSpinner.Value = double(F);
                app.Lamp_FrequencyCount.Color = 'g';
                drawnow;
                figure(app.UIFigure)
                app.loadpath = path;
            end
            app.loadpath = path;
        end

        % Menu selected function: LoadPAMGuidecsvfileMenu
        function LoadPAMGuidecsvfileMenuSelected(app, event)
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.csv','PAMGuide .csv files (*.csv)';'*.*','All Files (*.*)'}, ...
            'Select PAMGuide Output File',lastdir);   
            drawnow;
            figure(app.UIFigure)
            filename = [path file];
            try
                F = load(filename);
            catch ME
                if isequal(ME.identifier,'MATLAB:nomem')
                    errordlg("Size of PAMGuide's .output .csv exceeds your machine's RAM. Please type 'help memory' for your options or reduce time period of .csv file.")
                end
                return
            end
            %% datetime
            t=cellstr(datetime(F(2:end,1),'ConvertFrom','datenum','Format','yyyy-MM-dd HH:mm:ss'));
            app.Lamp_DateTime.Color = 'g';
            app.datetimeindex = t;
            %% frequency index
            f=double(F(1,2:end));
            app.Lamp_FrequencyIndex.Color = 'g';
            app.fi = f;
            f_count = cast(length(f),'uint64');
            app.FrequencyCount = f_count;
            app.FrequencyCountSpinner.Value = double(f_count);
            app.Lamp_FrequencyCount.Color = 'g';
            %% channel
            ch_count = cast(1,'uint64');
            app.ChannelCountSpinner.Value = double(1);
            app.ChannelCount = cast(1,'uint64');
            app.Lamp_ChannelCount.Color = 'g';
            %% LeqMeasurements
            app.New.button{1,1} = uibutton(app.LeqMeasurementsPanel,'push','Text',['Leq Measurements of Channel 1'],'Position',[50,380-23, 200, 22]);
            app.New.lamp{1,1} = uilamp(app.LeqMeasurementsPanel,"Color",'g',"Position",[10,380-23, 20, 20]);
            app.New.button{1,1}.ButtonPushedFcn = @app.leqbuttondown;
            app.leq{1,1} = double(F(2:end,2:end));
            %% Frequency Unit
            app.fu = 'Hz';
            app.Lamp_FrequencyUnit.Color = 'g';
            app.FrequencyUnitDropDown.Value = 'Hertz';
            %% Measurements Total Number
            app.MeasurementTotalNoEditField.Value = double(size(app.leq{1,1},1));
            app.MeasurementTotalNo = cast(size(app.leq{1,1},1),'uint64');
            app.Lamp_MeasurementTotalNo.Color = 'g';
            %% Measurement Unit
            app.MeasurementUnitDropDown.Value = 'Sound pressure level - dB re 1µPa';
            app.MeasurementUnit = 'SPL';
            app.Lamp_MeasurementUnit.Color = 'g';
            %% Processing Algorithm
            app.ProcessingAlgorithm =  'MER';
            app.Lamp_ProcessingAlgorithm.Color = 'g';
            app.ProcessingAlgorithmDropDown.Value = 'Merchant et al (2015)';
            %% Start Time
            sd = datetime(cell2mat(t(1)),'InputFormat','yyyy-MM-dd HH:mm:ss');
            app.StartDate = char(sd);
            ed = datetime(cell2mat(t(end)),'InputFormat','yyyy-MM-dd HH:mm:ss');
            app.EndDate = char(ed);
            app.Lamp_StartDate.Color = 'g';
            app.Lamp_EndDate.Color = 'g';
            app.StartDateDatePicker.Value = sd;
            app.EndDateDatePicker.Value = ed;
            app.TimeEditField_2.Value = char(datetime(sd,'Format','HH:mm'));
            app.TimeEditField_3.Value = char(datetime(ed,'Format','HH:mm'));
            cd = datetime("now",'Format','yyyy-MM-dd HH:mm:ss');
            app.CreationDate = char(cd);
            app.Lamp_CreationDate.Color = 'g';
            app.CreationDateDatePicker.Value = cd;
            app.TimeEditField.Value = char(datetime(cd,'Format','HH:mm'));
            %% remember path
            app.loadpath = path;        
        end

        % Menu selected function: LoadBSHh5fileMenu
        function LoadBSHh5fileMenuSelected(app, event)
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5','BSH-format .h5 files (*.h5)';'*.*','All Files (*.*)'}, ...
            'Select .h5 file in BSH- format',lastdir);   
            drawnow;
            figure(app.UIFigure)
            filename = [path file];
            
            %% File Information
            %Email
            app.Email = cell2mat(h5read(filename,'/author'));
            app.Lamp_Email.Color = 'g';
            app.EmailEditField.Value = app.Email;
            %Creation Date
            cd = datetime("now",'Format','yyyy-MM-dd HH:mm:ss');
            app.CreationDate = char(cd);
            app.Lamp_CreationDate.Color = 'g';
            app.CreationDateDatePicker.Value = cd;
            app.TimeEditField.Value = char(datetime(cd,'Format','HH:mm'));
            %Start Date & End Date
            t = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_datetime_index');
            sd = datetime(t(1),'ConvertFrom','posixtime','Format','yyyy-MM-dd HH:mm:ss');
            app.StartDate = char(sd);
            ed = datetime(t(end),'ConvertFrom','posixtime','Format','yyyy-MM-dd HH:mm:ss');
            app.EndDate = char(ed);
            app.Lamp_StartDate.Color = 'g';
            app.Lamp_EndDate.Color = 'g';
            app.StartDateDatePicker.Value = sd;
            app.EndDateDatePicker.Value = ed;
            app.TimeEditField_2.Value = char(datetime(sd,'Format','HH:mm'));
            app.TimeEditField_3.Value = char(datetime(ed,'Format','HH:mm'));
            % Institution
            institution = cell2mat(h5read(filename,'/measuring_institution'));
            app.InstitutionEditField.Value = deblank(institution);
            clear C
            fileID = fopen('.\libs\RECO_Export_07-14-2021-01-14-31.csv');
            Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=deblank(institution);
            ix=strfind(Q{1,3},matchstr);
            idx = find(~cellfun(@isempty,ix));
            C{1}='Select ...';
            for ii=1:length(idx)
                name=char(Q{1,3}(idx(ii)));
                C{ii+1} = name;
            end
            app.SelectDropDown.Items = C;
%             app.SelectDropDown.Value = 'Federal Maritime and Hydrographic Agency (BSH)';
%             fileID = fopen('.\libs\RECO_Export_07-14-2021-01-14-31.csv');
%             Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
%             fclose(fileID);
%             matchstr=app.SelectDropDown.Value;
%             [~,idx]=intersect(Q{1,3},matchstr);
% %             ix=strfind(Q{1,3},matchstr);
% %             idx = find(~cellfun(@isempty,ix));
%             if length(idx)>1
%                 errordlg('More than one Institution with this name were found. Please try again or enter Institution code from: https://vocab.ices.dk/?ref=1398')
%             else
%                 app.Institution = char(Q{1,2}(idx));
%                 app.Lamp_Institution.Color = 'g';
%             end  
            %Contact
            app.Contact = cell2mat(h5read(filename,'/point_of_contact'));
            app.ContactEditField.Value = app.Contact;
            app.Lamp_Contact.Color = 'g';
            %Country Code
            app.CountryCode = 'DE';
            app.CountryCodeDropDown.Value = 'DE';
            app.Lamp_CountryCode.Color = 'g';
            
            %%Metadata
            %Frequency Count
            f = h5read(filename,'/dataset_ambient_noise/measurement_data/frequency_index');
            app.FrequencyCount = cast(length(f),'uint64');
            app.FrequencyCountSpinner.Value = length(f);
            app.Lamp_FrequencyCount.Color = 'g';            
            %Frequency Index
            app.fi = double(f);
            app.Lamp_FrequencyIndex.Color = 'g';
            %% Frequency Unit
            app.fu = 'Hz';
            app.Lamp_FrequencyUnit.Color = 'g';
            app.FrequencyUnitDropDown.Value = 'Hertz';
            %% channel
            ch_count = cast(1,'uint64');
            app.ChannelCountSpinner.Value = double(1);
            app.ChannelCount = cast(1,'uint64');
            app.Lamp_ChannelCount.Color = 'g';
            %% Measurements Total Number
            app.leq{1,1} = h5read(filename,'/dataset_ambient_noise/measurement_data/leq_spectro_temporal_values');
%             if ~isequal(size(app.leq{1,1},2),app.FrequencyCount)
%                 app.leq{1,1}=app.leq{1,1}';
%             end
            app.MeasurementTotalNoEditField.Value = double(size(app.leq{1,1},2));
            app.MeasurementTotalNo = cast(size(app.leq{1,1},2),'uint64');
            app.Lamp_MeasurementTotalNo.Color = 'g';
            %% Measurement Unit
            app.MeasurementUnitDropDown.Value = 'Sound pressure level - dB re 1µPa';
            app.MeasurementUnit = 'SPL';
            app.Lamp_MeasurementUnit.Color = 'g';
            %% Averaging Time
            app.AveragingTime = cast(h5read(filename,'/dataset_ambient_noise/measurement_data/leq_averaging_time'),'uint64');
            app.AveragingTimeSpinner.Value = double(app.AveragingTime);
            if app.AveragingTime < 20
                warndlg('Please confirm, that you really want to create .h5 files, with averaging times < 20 sec !')
            end
            app.Lamp_AveragingTime.Color = 'g';
            %% Datetime Index
            t=cellstr(datetime(t,'ConvertFrom','posixtime','Format','yyyy-MM-dd HH:mm:ss'));
            app.Lamp_DateTime.Color = 'g';
            app.datetimeindex = t;
            %% LeqMeasurements
            app.New.button{1,1} = uibutton(app.LeqMeasurementsPanel,'push','Text',['Leq Measurements of Channel 1'],'Position',[50,380-23, 200, 22]);
            app.New.lamp{1,1} = uilamp(app.LeqMeasurementsPanel,"Color",'g',"Position",[10,380-23, 20, 20]);
            app.New.button{1,1}.ButtonPushedFcn = @app.leqbuttondown;
            app.leq{1,1} = double(app.leq{1,1});
            
        end

        % Button pushed function: ResetButton
        function ResetButtonPushed(app, event)
    % Make current instance of app invisible
    app.UIFigure.Visible = 'off';
    % Open 2nd instance of app
    format3000();  % <--------------The name of your app
    % Delete old instance
    close(app.UIFigure) %Thanks to Guillaume for suggesting to use close() rather than delete()

        end

        % Menu selected function: LoadJOMOPANSh5fileMenu
        function LoadJOMOPANSh5fileMenuSelected(app, event)
            if ~isempty(app.loadpath)
                lastdir = app.loadpath;
            else
                lastdir = fileparts(mfilename('fullpath'));
            end
            [file,path] = uigetfile({'*.h5','BSH-format .h5 files (*.h5)';'*.*','All Files (*.*)'}, ...
            'Select .h5 file in BSH- format',lastdir);   
            drawnow;
            figure(app.UIFigure)
            filename = [path file];
            
            %% File Information
            %Email
            app.Email = cell2mat(h5read(filename,'/author'));
            app.Lamp_Email.Color = 'g';
            app.EmailEditField.Value = app.Email;
            %Creation Date
            cd = datetime("now",'Format','yyyy-MM-dd HH:mm:ss');
            app.CreationDate = char(cd);
            app.Lamp_CreationDate.Color = 'g';
            app.CreationDateDatePicker.Value = cd;
            app.TimeEditField.Value = char(datetime(cd,'Format','HH:mm'));
            %Start Date & End Date
            t = h5read(filename,'/dataset_ambient_noise/datetime_index');
            sd = datetime(num2str(t(1)),'InputFormat','yyyyMMddHHmmss','Format','yyyy-MM-dd HH:mm:ss');
            app.StartDate = char(sd);
            ed = datetime(num2str(t(end)),'InputFormat','yyyyMMddHHmmss','Format','yyyy-MM-dd HH:mm:ss');
            app.EndDate = char(ed);
            app.Lamp_StartDate.Color = 'g';
            app.Lamp_EndDate.Color = 'g';
            app.StartDateDatePicker.Value = sd;
            app.EndDateDatePicker.Value = ed;
            app.TimeEditField_2.Value = char(datetime(sd,'Format','HH:mm'));
            app.TimeEditField_3.Value = char(datetime(ed,'Format','HH:mm'));
            % Institution
            institution = cell2mat(h5read(filename,'/measuring_institution'));
            app.InstitutionEditField.Value = deblank(institution);
            clear C
            fileID = fopen('.\libs\RECO_Export_07-14-2021-01-14-31.csv');
            Q = textscan(fileID,'%s %s %s %s %s %s %s %s %s %s','delimiter',',');
            fclose(fileID);
            matchstr=deblank(institution);
            ix=strfind(Q{1,3},matchstr);
            idx = find(~cellfun(@isempty,ix));
            C{1}='Select ...';
            for ii=1:length(idx)
                name=char(Q{1,3}(idx(ii)));
                C{ii+1} = name;
            end
            app.SelectDropDown.Items = C;
            %Contact
            app.Contact = cell2mat(h5read(filename,'/point_of_contact'));
            app.ContactEditField.Value = app.Contact;
            app.Lamp_Contact.Color = 'g';
            %Country Code
            lit = {'BE','DE','DK','EE','FI','LT','LV','NL','NO','PL','RU','SCO','SE','UKE'};
            CC = cell2mat(h5read(filename,'/dataset_ambient_noise/name_measurement_position'));
            idx = strfind(CC,'-');
            if isempty(idx)
                idx = strfind(CC,'_');
            end
            CC=CC(idx(1)+1:idx(2)-1);
            app.CountryCode = cell2mat(intersect(CC,lit));
            app.CountryCodeDropDown.Value = app.CountryCode;
            app.Lamp_CountryCode.Color = 'g';
            
            %% Metadata
            %MeasurementHeight
            app.MeasurementHeight = h5read(filename,'/dataset_ambient_noise/measurement_height');
            app.MeasurementHeightEditField.Value = num2str(app.MeasurementHeight);
            app.Lamp_MeasurementHeight.Color = 'g';
            
            
            
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [0 0.2314 0.4118];
            app.UIFigure.Position = [100 100 1078 611];
            app.UIFigure.Name = 'UI Figure';

            % Create Menu
            app.Menu = uimenu(app.UIFigure);
            app.Menu.Text = 'Menu';

            % Create LoadBSHh5fileMenu
            app.LoadBSHh5fileMenu = uimenu(app.Menu);
            app.LoadBSHh5fileMenu.MenuSelectedFcn = createCallbackFcn(app, @LoadBSHh5fileMenuSelected, true);
            app.LoadBSHh5fileMenu.Text = 'Load BSH .h5 file';

            % Create LoadPAMGuidecsvfileMenu
            app.LoadPAMGuidecsvfileMenu = uimenu(app.Menu);
            app.LoadPAMGuidecsvfileMenu.MenuSelectedFcn = createCallbackFcn(app, @LoadPAMGuidecsvfileMenuSelected, true);
            app.LoadPAMGuidecsvfileMenu.Text = 'Load PAMGuide .csv file';

            % Create LoadJOMOPANSh5fileMenu
            app.LoadJOMOPANSh5fileMenu = uimenu(app.Menu);
            app.LoadJOMOPANSh5fileMenu.MenuSelectedFcn = createCallbackFcn(app, @LoadJOMOPANSh5fileMenuSelected, true);
            app.LoadJOMOPANSh5fileMenu.Text = 'Load JOMOPANS .h5 file';

            % Create HelpMenu
            app.HelpMenu = uimenu(app.UIFigure);
            app.HelpMenu.Text = 'Help';

            % Create SeeICEScontinuousnoisedataformatMenu
            app.SeeICEScontinuousnoisedataformatMenu = uimenu(app.HelpMenu);
            app.SeeICEScontinuousnoisedataformatMenu.MenuSelectedFcn = createCallbackFcn(app, @SeeICEScontinuousnoisedataformatMenuSelected, true);
            app.SeeICEScontinuousnoisedataformatMenu.Text = 'See ICES continuous noise data format';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [10 74 1060 529];

            % Create FileInformationTab
            app.FileInformationTab = uitab(app.TabGroup);
            app.FileInformationTab.Title = 'File Information';
            app.FileInformationTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create EmailEditFieldLabel
            app.EmailEditFieldLabel = uilabel(app.FileInformationTab);
            app.EmailEditFieldLabel.HorizontalAlignment = 'right';
            app.EmailEditFieldLabel.Position = [70 472 56 22];
            app.EmailEditFieldLabel.Text = 'Email';

            % Create EmailEditField
            app.EmailEditField = uieditfield(app.FileInformationTab, 'text');
            app.EmailEditField.ValueChangedFcn = createCallbackFcn(app, @EmailEditFieldValueChanged, true);
            app.EmailEditField.Position = [136 472 100 22];
            app.EmailEditField.Value = 'test@test.com';

            % Create CreationDateDatePickerLabel
            app.CreationDateDatePickerLabel = uilabel(app.FileInformationTab);
            app.CreationDateDatePickerLabel.HorizontalAlignment = 'right';
            app.CreationDateDatePickerLabel.Position = [34 442 92 22];
            app.CreationDateDatePickerLabel.Text = 'Creation Date';

            % Create CreationDateDatePicker
            app.CreationDateDatePicker = uidatepicker(app.FileInformationTab);
            app.CreationDateDatePicker.ValueChangedFcn = createCallbackFcn(app, @CreationDateDatePickerValueChanged, true);
            app.CreationDateDatePicker.Position = [136 442 160 22];

            % Create StartDateDatePickerLabel
            app.StartDateDatePickerLabel = uilabel(app.FileInformationTab);
            app.StartDateDatePickerLabel.HorizontalAlignment = 'right';
            app.StartDateDatePickerLabel.Position = [34 411 92 22];
            app.StartDateDatePickerLabel.Text = 'Start Date';

            % Create StartDateDatePicker
            app.StartDateDatePicker = uidatepicker(app.FileInformationTab);
            app.StartDateDatePicker.ValueChangedFcn = createCallbackFcn(app, @StartDateDatePickerValueChanged, true);
            app.StartDateDatePicker.Position = [136 411 160 22];

            % Create EndDateDatePickerLabel
            app.EndDateDatePickerLabel = uilabel(app.FileInformationTab);
            app.EndDateDatePickerLabel.HorizontalAlignment = 'right';
            app.EndDateDatePickerLabel.Position = [70 383 56 22];
            app.EndDateDatePickerLabel.Text = 'End Date';

            % Create EndDateDatePicker
            app.EndDateDatePicker = uidatepicker(app.FileInformationTab);
            app.EndDateDatePicker.ValueChangedFcn = createCallbackFcn(app, @EndDateDatePickerValueChanged, true);
            app.EndDateDatePicker.Position = [136 383 160 22];

            % Create ContactEditFieldLabel
            app.ContactEditFieldLabel = uilabel(app.FileInformationTab);
            app.ContactEditFieldLabel.HorizontalAlignment = 'right';
            app.ContactEditFieldLabel.Position = [69 324 56 22];
            app.ContactEditFieldLabel.Text = 'Contact';

            % Create ContactEditField
            app.ContactEditField = uieditfield(app.FileInformationTab, 'text');
            app.ContactEditField.ValueChangedFcn = createCallbackFcn(app, @ContactEditFieldValueChanged, true);
            app.ContactEditField.Position = [135 324 100 22];
            app.ContactEditField.Value = 'test@test.com';

            % Create CountryCodeDropDownLabel
            app.CountryCodeDropDownLabel = uilabel(app.FileInformationTab);
            app.CountryCodeDropDownLabel.HorizontalAlignment = 'right';
            app.CountryCodeDropDownLabel.Position = [31 294 92 22];
            app.CountryCodeDropDownLabel.Text = 'Country Code';

            % Create CountryCodeDropDown
            app.CountryCodeDropDown = uidropdown(app.FileInformationTab);
            app.CountryCodeDropDown.Items = {'Select ...', 'BE', 'DE', 'DK', 'EE', 'FI', 'GB', 'GB-ENG', 'GB-SCT', 'LT', 'LV', 'NL', 'NO', 'PL', 'RU', 'SE'};
            app.CountryCodeDropDown.ValueChangedFcn = createCallbackFcn(app, @CountryCodeDropDownValueChanged, true);
            app.CountryCodeDropDown.Position = [133 294 100 22];
            app.CountryCodeDropDown.Value = 'Select ...';

            % Create TimeEditFieldLabel
            app.TimeEditFieldLabel = uilabel(app.FileInformationTab);
            app.TimeEditFieldLabel.HorizontalAlignment = 'right';
            app.TimeEditFieldLabel.Position = [315 442 32 22];
            app.TimeEditFieldLabel.Text = 'Time';

            % Create TimeEditField
            app.TimeEditField = uieditfield(app.FileInformationTab, 'text');
            app.TimeEditField.ValueChangedFcn = createCallbackFcn(app, @TimeEditFieldValueChanged, true);
            app.TimeEditField.Position = [362 442 100 22];
            app.TimeEditField.Value = 'HH:mm';

            % Create TimeEditField_2Label
            app.TimeEditField_2Label = uilabel(app.FileInformationTab);
            app.TimeEditField_2Label.HorizontalAlignment = 'right';
            app.TimeEditField_2Label.Position = [314 411 32 22];
            app.TimeEditField_2Label.Text = 'Time';

            % Create TimeEditField_2
            app.TimeEditField_2 = uieditfield(app.FileInformationTab, 'text');
            app.TimeEditField_2.ValueChangedFcn = createCallbackFcn(app, @TimeEditField_2ValueChanged, true);
            app.TimeEditField_2.Position = [361 411 100 22];
            app.TimeEditField_2.Value = 'HH:mm';

            % Create TimeEditField_3Label
            app.TimeEditField_3Label = uilabel(app.FileInformationTab);
            app.TimeEditField_3Label.HorizontalAlignment = 'right';
            app.TimeEditField_3Label.Position = [314 383 32 22];
            app.TimeEditField_3Label.Text = 'Time';

            % Create TimeEditField_3
            app.TimeEditField_3 = uieditfield(app.FileInformationTab, 'text');
            app.TimeEditField_3.ValueChangedFcn = createCallbackFcn(app, @TimeEditField_3ValueChanged, true);
            app.TimeEditField_3.Position = [361 383 100 22];
            app.TimeEditField_3.Value = 'HH:mm';

            % Create InstitutionEditFieldLabel
            app.InstitutionEditFieldLabel = uilabel(app.FileInformationTab);
            app.InstitutionEditFieldLabel.HorizontalAlignment = 'right';
            app.InstitutionEditFieldLabel.Position = [63 353 57 22];
            app.InstitutionEditFieldLabel.Text = 'Institution';

            % Create InstitutionEditField
            app.InstitutionEditField = uieditfield(app.FileInformationTab, 'text');
            app.InstitutionEditField.ValueChangedFcn = createCallbackFcn(app, @InstitutionEditFieldValueChanged, true);
            app.InstitutionEditField.Position = [135 353 100 22];
            app.InstitutionEditField.Value = 'Search';

            % Create Lamp_Email
            app.Lamp_Email = uilamp(app.FileInformationTab);
            app.Lamp_Email.Position = [22 473 20 20];
            app.Lamp_Email.Color = [1 0 0];

            % Create Lamp_CreationDate
            app.Lamp_CreationDate = uilamp(app.FileInformationTab);
            app.Lamp_CreationDate.Position = [21 443 20 20];
            app.Lamp_CreationDate.Color = [1 0 0];

            % Create Lamp_StartDate
            app.Lamp_StartDate = uilamp(app.FileInformationTab);
            app.Lamp_StartDate.Position = [21 412 20 20];
            app.Lamp_StartDate.Color = [1 0 0];

            % Create Lamp_EndDate
            app.Lamp_EndDate = uilamp(app.FileInformationTab);
            app.Lamp_EndDate.Position = [21 384 20 20];
            app.Lamp_EndDate.Color = [1 0 0];

            % Create Lamp_Institution
            app.Lamp_Institution = uilamp(app.FileInformationTab);
            app.Lamp_Institution.Position = [21 354 20 20];
            app.Lamp_Institution.Color = [1 0 0];

            % Create Lamp_Contact
            app.Lamp_Contact = uilamp(app.FileInformationTab);
            app.Lamp_Contact.Position = [22 325 20 20];
            app.Lamp_Contact.Color = [1 0 0];

            % Create Lamp_CountryCode
            app.Lamp_CountryCode = uilamp(app.FileInformationTab);
            app.Lamp_CountryCode.Position = [22 297 20 20];
            app.Lamp_CountryCode.Color = [1 0 0];

            % Create Lamp_StationCode
            app.Lamp_StationCode = uilamp(app.FileInformationTab);
            app.Lamp_StationCode.Position = [22 266 20 20];
            app.Lamp_StationCode.Color = [1 0 0];

            % Create SelectDropDownLabel
            app.SelectDropDownLabel = uilabel(app.FileInformationTab);
            app.SelectDropDownLabel.HorizontalAlignment = 'right';
            app.SelectDropDownLabel.Position = [245 353 39 22];
            app.SelectDropDownLabel.Text = 'Select';

            % Create SelectDropDown
            app.SelectDropDown = uidropdown(app.FileInformationTab);
            app.SelectDropDown.Items = {'Search first ...', ''};
            app.SelectDropDown.ValueChangedFcn = createCallbackFcn(app, @SelectDropDownValueChanged, true);
            app.SelectDropDown.Position = [299 353 121 22];
            app.SelectDropDown.Value = 'Search first ...';

            % Create StationCodeEditFieldLabel
            app.StationCodeEditFieldLabel = uilabel(app.FileInformationTab);
            app.StationCodeEditFieldLabel.HorizontalAlignment = 'right';
            app.StationCodeEditFieldLabel.Position = [45 265 75 22];
            app.StationCodeEditFieldLabel.Text = 'Station Code';

            % Create StationCodeEditField
            app.StationCodeEditField = uieditfield(app.FileInformationTab, 'text');
            app.StationCodeEditField.ValueChangedFcn = createCallbackFcn(app, @StationCodeEditFieldValueChanged, true);
            app.StationCodeEditField.Position = [135 265 100 22];
            app.StationCodeEditField.Value = 'Search';

            % Create SelectDropDown_2Label
            app.SelectDropDown_2Label = uilabel(app.FileInformationTab);
            app.SelectDropDown_2Label.HorizontalAlignment = 'right';
            app.SelectDropDown_2Label.Position = [245 265 39 22];
            app.SelectDropDown_2Label.Text = 'Select';

            % Create SelectDropDown_StationCode
            app.SelectDropDown_StationCode = uidropdown(app.FileInformationTab);
            app.SelectDropDown_StationCode.Items = {'Search first ...', ''};
            app.SelectDropDown_StationCode.ValueChangedFcn = createCallbackFcn(app, @SelectDropDown_StationCodeValueChanged, true);
            app.SelectDropDown_StationCode.Position = [299 265 121 22];
            app.SelectDropDown_StationCode.Value = 'Search first ...';

            % Create MetadataTab
            app.MetadataTab = uitab(app.TabGroup);
            app.MetadataTab.Title = 'Metadata';
            app.MetadataTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create CreateUUIDButton
            app.CreateUUIDButton = uibutton(app.MetadataTab, 'push');
            app.CreateUUIDButton.ButtonPushedFcn = createCallbackFcn(app, @CreateUUIDButtonPushed, true);
            app.CreateUUIDButton.Position = [697 298 154 22];
            app.CreateUUIDButton.Text = 'Create UUID';

            % Create HydrophoneTypeDropDownLabel
            app.HydrophoneTypeDropDownLabel = uilabel(app.MetadataTab);
            app.HydrophoneTypeDropDownLabel.HorizontalAlignment = 'right';
            app.HydrophoneTypeDropDownLabel.Position = [70 473 152 22];
            app.HydrophoneTypeDropDownLabel.Text = 'Hydrophone Type';

            % Create HydrophoneTypeDropDown
            app.HydrophoneTypeDropDown = uidropdown(app.MetadataTab);
            app.HydrophoneTypeDropDown.Items = {'Select ...', 'Brüel & Kjaer 8103', 'Brüel & Kjaer 8104 ', 'Brüel & Kjaer 8105', 'Brüel & Kjaer 8106', 'COLMAR GP1516', 'DE-200', 'DE-600', 'DE-PRO', 'GeoSpectrum M14-360 ', 'GeoSpectrum M14-900', 'GeoSpectrum M15-360', 'GeoSpectrum M15-900', 'GeoSpectrum M36-100', 'GeoSpectrum M36-900', 'GeoSpectrum M5-360', 'GeoSpectrum M5-900', 'HTI-15-Min', 'HTI-90-UReftek 17', 'HTI-94-SSQ', 'HTI-96-Min', 'HTI-97-DA', 'HTI-99-HF', 'HTI-99-UHF', 'Integrated in recorder', 'Soundtrap external hydrophone', 'Sparton'};
            app.HydrophoneTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @HydrophoneTypeDropDownValueChanged, true);
            app.HydrophoneTypeDropDown.Position = [239 473 109 22];
            app.HydrophoneTypeDropDown.Value = 'Select ...';

            % Create HydrophoneSerialNumberEditFieldLabel
            app.HydrophoneSerialNumberEditFieldLabel = uilabel(app.MetadataTab);
            app.HydrophoneSerialNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.HydrophoneSerialNumberEditFieldLabel.Position = [23 448 199 22];
            app.HydrophoneSerialNumberEditFieldLabel.Text = 'Hydrophone Serial Number';

            % Create HydrophoneSerialNumberEditField
            app.HydrophoneSerialNumberEditField = uieditfield(app.MetadataTab, 'text');
            app.HydrophoneSerialNumberEditField.ValueChangedFcn = createCallbackFcn(app, @HydrophoneSerialNumberEditFieldValueChanged, true);
            app.HydrophoneSerialNumberEditField.Position = [239 448 109 22];

            % Create RecorderTypeDropDownLabel
            app.RecorderTypeDropDownLabel = uilabel(app.MetadataTab);
            app.RecorderTypeDropDownLabel.HorizontalAlignment = 'right';
            app.RecorderTypeDropDownLabel.Position = [70 423 152 22];
            app.RecorderTypeDropDownLabel.Text = 'Recorder Type';

            % Create RecorderTypeDropDown
            app.RecorderTypeDropDown = uidropdown(app.MetadataTab);
            app.RecorderTypeDropDown.Items = {'Select ...', 'Computer', 'JASCO Amar', 'Loggerhead DSG', 'Loggerhead DSG-ST', 'Loggerhead LS1/LS2', 'Loggerhead Medusa Acoustic Drifter', 'Loggerhead SNAP', 'Multi Electronique - Aural-M2', 'Multi Electronique - µAURAL', 'OceanInstruments SOUNDTRAP 300 HF', 'OceanInstruments SOUNDTRAP 300 STD', 'OceanInstruments SOUNDTRAP 500 HF', 'OceanInstruments SOUNDTRAP 500 STD', 'OceanSonics icListen 200kHz', 'RTSys EASDA14 320', 'RTSys Sylence-LP recorder', 'Wildlife SM2M', 'Wildlife SM2M+', 'Wildlife SM3M', 'Wildlife SM3M+', 'Wildlife SM4M'};
            app.RecorderTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @RecorderTypeDropDownValueChanged, true);
            app.RecorderTypeDropDown.Position = [239 423 109 22];
            app.RecorderTypeDropDown.Value = 'Select ...';

            % Create RecorderSerialNumberEditFieldLabel
            app.RecorderSerialNumberEditFieldLabel = uilabel(app.MetadataTab);
            app.RecorderSerialNumberEditFieldLabel.HorizontalAlignment = 'right';
            app.RecorderSerialNumberEditFieldLabel.Position = [70 398 152 22];
            app.RecorderSerialNumberEditFieldLabel.Text = 'Recorder Serial Number';

            % Create RecorderSerialNumberEditField
            app.RecorderSerialNumberEditField = uieditfield(app.MetadataTab, 'text');
            app.RecorderSerialNumberEditField.ValueChangedFcn = createCallbackFcn(app, @RecorderSerialNumberEditFieldValueChanged, true);
            app.RecorderSerialNumberEditField.Position = [239 398 109 22];

            % Create MeasurementHeightEditFieldLabel
            app.MeasurementHeightEditFieldLabel = uilabel(app.MetadataTab);
            app.MeasurementHeightEditFieldLabel.HorizontalAlignment = 'right';
            app.MeasurementHeightEditFieldLabel.Position = [67 371 155 22];
            app.MeasurementHeightEditFieldLabel.Text = 'Measurement Height';

            % Create MeasurementHeightEditField
            app.MeasurementHeightEditField = uieditfield(app.MetadataTab, 'text');
            app.MeasurementHeightEditField.ValueChangedFcn = createCallbackFcn(app, @MeasurementHeightEditFieldValueChanged, true);
            app.MeasurementHeightEditField.Position = [239 371 109 22];

            % Create MeasurementPurposeDropDownLabel
            app.MeasurementPurposeDropDownLabel = uilabel(app.MetadataTab);
            app.MeasurementPurposeDropDownLabel.HorizontalAlignment = 'right';
            app.MeasurementPurposeDropDownLabel.Position = [70 346 152 22];
            app.MeasurementPurposeDropDownLabel.Text = 'Measurement Purpose';

            % Create MeasurementPurposeDropDown
            app.MeasurementPurposeDropDown = uidropdown(app.MetadataTab);
            app.MeasurementPurposeDropDown.Items = {'Select ...', 'Commissioned measurements', 'HELCOM monitoring', 'National monitoring', 'OSPAR monitoring', 'Other', 'Project', 'Research'};
            app.MeasurementPurposeDropDown.ValueChangedFcn = createCallbackFcn(app, @MeasurementPurposeDropDownValueChanged, true);
            app.MeasurementPurposeDropDown.Position = [239 346 109 22];
            app.MeasurementPurposeDropDown.Value = 'Select ...';

            % Create MeasurementSetupDropDownLabel
            app.MeasurementSetupDropDownLabel = uilabel(app.MetadataTab);
            app.MeasurementSetupDropDownLabel.HorizontalAlignment = 'right';
            app.MeasurementSetupDropDownLabel.Position = [70 321 152 22];
            app.MeasurementSetupDropDownLabel.Text = 'Measurement Setup';

            % Create MeasurementSetupDropDown
            app.MeasurementSetupDropDown = uidropdown(app.MetadataTab);
            app.MeasurementSetupDropDown.Items = {'Select ...', 'Autonomous', 'Cable mounted', 'Combined'};
            app.MeasurementSetupDropDown.ValueChangedFcn = createCallbackFcn(app, @MeasurementSetupDropDownValueChanged, true);
            app.MeasurementSetupDropDown.Position = [239 321 109 22];
            app.MeasurementSetupDropDown.Value = 'Select ...';

            % Create RigDesignDropDownLabel
            app.RigDesignDropDownLabel = uilabel(app.MetadataTab);
            app.RigDesignDropDownLabel.HorizontalAlignment = 'right';
            app.RigDesignDropDownLabel.Position = [158 296 64 22];
            app.RigDesignDropDownLabel.Text = 'Rig Design';

            % Create RigDesignDropDown
            app.RigDesignDropDown = uidropdown(app.MetadataTab);
            app.RigDesignDropDown.Items = {'Select ...', 'Bottom frame', 'From vessel', 'Glider', 'Mooring with floating buoy', 'Other', 'Supended from surface', 'Vertical measurement chain'};
            app.RigDesignDropDown.ValueChangedFcn = createCallbackFcn(app, @RigDesignDropDownValueChanged, true);
            app.RigDesignDropDown.Position = [239 296 109 22];
            app.RigDesignDropDown.Value = 'Select ...';

            % Create FrequencyCountSpinnerLabel
            app.FrequencyCountSpinnerLabel = uilabel(app.MetadataTab);
            app.FrequencyCountSpinnerLabel.HorizontalAlignment = 'right';
            app.FrequencyCountSpinnerLabel.Position = [70 271 152 22];
            app.FrequencyCountSpinnerLabel.Text = 'Frequency Count';

            % Create FrequencyCountSpinner
            app.FrequencyCountSpinner = uispinner(app.MetadataTab);
            app.FrequencyCountSpinner.Limits = [1 48];
            app.FrequencyCountSpinner.ValueChangedFcn = createCallbackFcn(app, @FrequencyCountSpinnerValueChanged, true);
            app.FrequencyCountSpinner.Position = [239 271 54 22];
            app.FrequencyCountSpinner.Value = 1;

            % Create FrequencyUnitDropDownLabel
            app.FrequencyUnitDropDownLabel = uilabel(app.MetadataTab);
            app.FrequencyUnitDropDownLabel.HorizontalAlignment = 'right';
            app.FrequencyUnitDropDownLabel.Position = [571 471 109 22];
            app.FrequencyUnitDropDownLabel.Text = 'Frequency Unit';

            % Create FrequencyUnitDropDown
            app.FrequencyUnitDropDown = uidropdown(app.MetadataTab);
            app.FrequencyUnitDropDown.Items = {'Select ...', 'Hertz'};
            app.FrequencyUnitDropDown.ValueChangedFcn = createCallbackFcn(app, @FrequencyUnitDropDownValueChanged, true);
            app.FrequencyUnitDropDown.Position = [697 471 154 22];
            app.FrequencyUnitDropDown.Value = 'Select ...';

            % Create ChannelCountSpinnerLabel
            app.ChannelCountSpinnerLabel = uilabel(app.MetadataTab);
            app.ChannelCountSpinnerLabel.HorizontalAlignment = 'right';
            app.ChannelCountSpinnerLabel.Position = [528 445 152 22];
            app.ChannelCountSpinnerLabel.Text = 'Channel Count';

            % Create ChannelCountSpinner
            app.ChannelCountSpinner = uispinner(app.MetadataTab);
            app.ChannelCountSpinner.Limits = [0 20];
            app.ChannelCountSpinner.ValueChangedFcn = createCallbackFcn(app, @ChannelCountSpinnerValueChanged, true);
            app.ChannelCountSpinner.Position = [697 445 154 22];

            % Create MeasurementUnitDropDownLabel
            app.MeasurementUnitDropDownLabel = uilabel(app.MetadataTab);
            app.MeasurementUnitDropDownLabel.HorizontalAlignment = 'right';
            app.MeasurementUnitDropDownLabel.Position = [529 394 151 22];
            app.MeasurementUnitDropDownLabel.Text = 'Measurement Unit';

            % Create MeasurementUnitDropDown
            app.MeasurementUnitDropDown = uidropdown(app.MetadataTab);
            app.MeasurementUnitDropDown.Items = {'Select ...', 'Sound pressure level - dB re 1µPa'};
            app.MeasurementUnitDropDown.ValueChangedFcn = createCallbackFcn(app, @MeasurementUnitDropDownValueChanged, true);
            app.MeasurementUnitDropDown.Position = [697 394 154 22];
            app.MeasurementUnitDropDown.Value = 'Select ...';

            % Create AveragingTimeSpinnerLabel
            app.AveragingTimeSpinnerLabel = uilabel(app.MetadataTab);
            app.AveragingTimeSpinnerLabel.HorizontalAlignment = 'right';
            app.AveragingTimeSpinnerLabel.Position = [526 369 154 22];
            app.AveragingTimeSpinnerLabel.Text = 'Averaging Time';

            % Create AveragingTimeSpinner
            app.AveragingTimeSpinner = uispinner(app.MetadataTab);
            app.AveragingTimeSpinner.Limits = [0 1200];
            app.AveragingTimeSpinner.ValueChangedFcn = createCallbackFcn(app, @AveragingTimeSpinnerValueChanged, true);
            app.AveragingTimeSpinner.Position = [697 369 154 22];

            % Create ProcessingAlgorithmDropDownLabel
            app.ProcessingAlgorithmDropDownLabel = uilabel(app.MetadataTab);
            app.ProcessingAlgorithmDropDownLabel.HorizontalAlignment = 'right';
            app.ProcessingAlgorithmDropDownLabel.Position = [530 344 151 22];
            app.ProcessingAlgorithmDropDownLabel.Text = 'Processing Algorithm';

            % Create ProcessingAlgorithmDropDown
            app.ProcessingAlgorithmDropDown = uidropdown(app.MetadataTab);
            app.ProcessingAlgorithmDropDown.Items = {'Select ...', 'AU-BIAS (Tougaard 2019)', 'BIAS (Betke et al 2015)', 'Jomopans signal processing standard (L. Wang', 'Merchant et al (2015)'};
            app.ProcessingAlgorithmDropDown.ValueChangedFcn = createCallbackFcn(app, @ProcessingAlgorithmDropDownValueChanged, true);
            app.ProcessingAlgorithmDropDown.Position = [697 344 154 22];
            app.ProcessingAlgorithmDropDown.Value = 'Select ...';

            % Create DataUUIDEditFieldLabel
            app.DataUUIDEditFieldLabel = uilabel(app.MetadataTab);
            app.DataUUIDEditFieldLabel.HorizontalAlignment = 'right';
            app.DataUUIDEditFieldLabel.Position = [518 321 64 22];
            app.DataUUIDEditFieldLabel.Text = 'Data UUID';

            % Create DataUUIDEditField
            app.DataUUIDEditField = uieditfield(app.MetadataTab, 'text');
            app.DataUUIDEditField.Editable = 'off';
            app.DataUUIDEditField.Position = [592 321 259 22];

            % Create DatasetVersionSpinnerLabel
            app.DatasetVersionSpinnerLabel = uilabel(app.MetadataTab);
            app.DatasetVersionSpinnerLabel.HorizontalAlignment = 'right';
            app.DatasetVersionSpinnerLabel.Position = [579 270 102 22];
            app.DatasetVersionSpinnerLabel.Text = 'Dataset Version';

            % Create DatasetVersionSpinner
            app.DatasetVersionSpinner = uispinner(app.MetadataTab);
            app.DatasetVersionSpinner.Limits = [0 Inf];
            app.DatasetVersionSpinner.ValueChangedFcn = createCallbackFcn(app, @DatasetVersionSpinnerValueChanged, true);
            app.DatasetVersionSpinner.Position = [697 270 154 22];

            % Create CalibrationProcedureDropDownLabel
            app.CalibrationProcedureDropDownLabel = uilabel(app.MetadataTab);
            app.CalibrationProcedureDropDownLabel.HorizontalAlignment = 'right';
            app.CalibrationProcedureDropDownLabel.Position = [544 245 137 22];
            app.CalibrationProcedureDropDownLabel.Text = 'Calibration Procedure';

            % Create CalibrationProcedureDropDown
            app.CalibrationProcedureDropDown = uidropdown(app.MetadataTab);
            app.CalibrationProcedureDropDown.Items = {'Select ...', 'Closed pressure chamber/pistonphone (250 Hz)', 'Closed pressure chamber/pistonphone (multiple frequencies)', 'Electric', 'Free field in air', 'Hydrostatic pressure', 'Other', 'Open water calibration', 'Standing wave tank', 'Tank calibration'};
            app.CalibrationProcedureDropDown.ValueChangedFcn = createCallbackFcn(app, @CalibrationProcedureDropDownValueChanged, true);
            app.CalibrationProcedureDropDown.Position = [697 245 154 22];
            app.CalibrationProcedureDropDown.Value = 'Select ...';

            % Create Lamp_HydrophoneType
            app.Lamp_HydrophoneType = uilamp(app.MetadataTab);
            app.Lamp_HydrophoneType.Position = [24 474 20 20];
            app.Lamp_HydrophoneType.Color = [1 0 0];

            % Create Lamp_HydrophoneSerialNumber
            app.Lamp_HydrophoneSerialNumber = uilamp(app.MetadataTab);
            app.Lamp_HydrophoneSerialNumber.Position = [24 449 20 20];
            app.Lamp_HydrophoneSerialNumber.Color = [1 0 0];

            % Create Lamp_RecorderType
            app.Lamp_RecorderType = uilamp(app.MetadataTab);
            app.Lamp_RecorderType.Position = [24 424 20 20];
            app.Lamp_RecorderType.Color = [1 0 0];

            % Create Lamp_RecorderSerialNumber
            app.Lamp_RecorderSerialNumber = uilamp(app.MetadataTab);
            app.Lamp_RecorderSerialNumber.Position = [24 399 20 20];
            app.Lamp_RecorderSerialNumber.Color = [1 0 0];

            % Create Lamp_MeasurementHeight
            app.Lamp_MeasurementHeight = uilamp(app.MetadataTab);
            app.Lamp_MeasurementHeight.Position = [24 372 20 20];
            app.Lamp_MeasurementHeight.Color = [1 0 0];

            % Create Lamp_MeasurementPurpose
            app.Lamp_MeasurementPurpose = uilamp(app.MetadataTab);
            app.Lamp_MeasurementPurpose.Position = [24 347 20 20];
            app.Lamp_MeasurementPurpose.Color = [1 0 0];

            % Create Lamp_MeasurementSetup
            app.Lamp_MeasurementSetup = uilamp(app.MetadataTab);
            app.Lamp_MeasurementSetup.Position = [24 322 20 20];
            app.Lamp_MeasurementSetup.Color = [1 0 0];

            % Create Lamp_RigDesign
            app.Lamp_RigDesign = uilamp(app.MetadataTab);
            app.Lamp_RigDesign.Position = [24 297 20 20];
            app.Lamp_RigDesign.Color = [1 0 0];

            % Create Lamp_FrequencyCount
            app.Lamp_FrequencyCount = uilamp(app.MetadataTab);
            app.Lamp_FrequencyCount.Position = [24 272 20 20];
            app.Lamp_FrequencyCount.Color = [1 0 0];

            % Create Lamp_FrequencyIndex
            app.Lamp_FrequencyIndex = uilamp(app.MetadataTab);
            app.Lamp_FrequencyIndex.Position = [24 247 20 20];
            app.Lamp_FrequencyIndex.Color = [1 0 0];

            % Create FrequencyIndexPanel
            app.FrequencyIndexPanel = uipanel(app.MetadataTab);
            app.FrequencyIndexPanel.Title = '             Frequency Index';
            app.FrequencyIndexPanel.Position = [88 75 260 191];

            % Create individualFrequencyBandsCheckBox
            app.individualFrequencyBandsCheckBox = uicheckbox(app.FrequencyIndexPanel);
            app.individualFrequencyBandsCheckBox.ValueChangedFcn = createCallbackFcn(app, @individualFrequencyBandsCheckBoxValueChanged, true);
            app.individualFrequencyBandsCheckBox.Text = 'individual Frequency- Bands';
            app.individualFrequencyBandsCheckBox.Position = [1 61 173 22];

            % Create consecutiveThirdOctaveBandsCheckBox
            app.consecutiveThirdOctaveBandsCheckBox = uicheckbox(app.FrequencyIndexPanel);
            app.consecutiveThirdOctaveBandsCheckBox.ValueChangedFcn = createCallbackFcn(app, @consecutiveThirdOctaveBandsCheckBoxValueChanged, true);
            app.consecutiveThirdOctaveBandsCheckBox.Text = 'consecutive Third-Octave Bands';
            app.consecutiveThirdOctaveBandsCheckBox.Position = [1 144 196 22];
            app.consecutiveThirdOctaveBandsCheckBox.Value = true;

            % Create LowestTOBDropDownLabel
            app.LowestTOBDropDownLabel = uilabel(app.FrequencyIndexPanel);
            app.LowestTOBDropDownLabel.HorizontalAlignment = 'right';
            app.LowestTOBDropDownLabel.Position = [2 119 71 22];
            app.LowestTOBDropDownLabel.Text = 'Lowest TOB';

            % Create LowestTOBDropDown
            app.LowestTOBDropDown = uidropdown(app.FrequencyIndexPanel);
            app.LowestTOBDropDown.Items = {'Select ...', '10', '12.5', '16', '20', '25', '31.5', '40', '50', '63', '80', '100', '125', '160', '200', '250', '315', '400', '500', '630', '800', '1000', '1250', '1600', '2000', '2500', '3150', '4000', '5000', '6300', '8000', '10000', '12500', '16000', '20000', '40000', '80000', '160000', ''};
            app.LowestTOBDropDown.ValueChangedFcn = createCallbackFcn(app, @LowestTOBDropDownValueChanged, true);
            app.LowestTOBDropDown.Position = [88 119 100 22];
            app.LowestTOBDropDown.Value = 'Select ...';

            % Create HighestTOBDropDownLabel
            app.HighestTOBDropDownLabel = uilabel(app.FrequencyIndexPanel);
            app.HighestTOBDropDownLabel.HorizontalAlignment = 'right';
            app.HighestTOBDropDownLabel.Position = [-1 92 74 22];
            app.HighestTOBDropDownLabel.Text = 'Highest TOB';

            % Create HighestTOBDropDown
            app.HighestTOBDropDown = uidropdown(app.FrequencyIndexPanel);
            app.HighestTOBDropDown.Items = {'Select ...', '10', '12.5', '16', '20', '25', '31.5', '40', '50', '63', '80', '100', '125', '160', '200', '250', '315', '400', '500', '630', '800', '1000', '1250', '1600', '2000', '2500', '3150', '4000', '5000', '6300', '8000', '10000', '12500', '16000', '20000', '40000', '80000', '160000'};
            app.HighestTOBDropDown.ValueChangedFcn = createCallbackFcn(app, @HighestTOBDropDownValueChanged, true);
            app.HighestTOBDropDown.Position = [88 92 100 22];
            app.HighestTOBDropDown.Value = 'Select ...';

            % Create FrequencyIndexEditField
            app.FrequencyIndexEditField = uieditfield(app.FrequencyIndexPanel, 'text');
            app.FrequencyIndexEditField.ValueChangedFcn = createCallbackFcn(app, @FrequencyIndexEditFieldValueChanged2, true);
            app.FrequencyIndexEditField.Editable = 'off';
            app.FrequencyIndexEditField.Enable = 'off';
            app.FrequencyIndexEditField.Position = [12 38 237 22];
            app.FrequencyIndexEditField.Value = '[63,125,2000]';

            % Create LoadFrequencyBandsfromCheckBox
            app.LoadFrequencyBandsfromCheckBox = uicheckbox(app.FrequencyIndexPanel);
            app.LoadFrequencyBandsfromCheckBox.ValueChangedFcn = createCallbackFcn(app, @LoadFrequencyBandsfromCheckBoxValueChanged, true);
            app.LoadFrequencyBandsfromCheckBox.Text = 'Load Frequency Bands from';
            app.LoadFrequencyBandsfromCheckBox.Position = [3 13 173 22];

            % Create fileButton
            app.fileButton = uibutton(app.FrequencyIndexPanel, 'push');
            app.fileButton.ButtonPushedFcn = createCallbackFcn(app, @fileButtonPushed, true);
            app.fileButton.Enable = 'off';
            app.fileButton.Position = [187 12 35 22];
            app.fileButton.Text = 'file';

            % Create Lamp_FrequencyUnit
            app.Lamp_FrequencyUnit = uilamp(app.MetadataTab);
            app.Lamp_FrequencyUnit.Position = [482 472 20 20];
            app.Lamp_FrequencyUnit.Color = [1 0 0];

            % Create Lamp_ChannelCount
            app.Lamp_ChannelCount = uilamp(app.MetadataTab);
            app.Lamp_ChannelCount.Position = [482 446 20 20];
            app.Lamp_ChannelCount.Color = [1 0 0];

            % Create MeasurementTotalNoEditFieldLabel
            app.MeasurementTotalNoEditFieldLabel = uilabel(app.MetadataTab);
            app.MeasurementTotalNoEditFieldLabel.HorizontalAlignment = 'right';
            app.MeasurementTotalNoEditFieldLabel.Position = [557 419 123 22];
            app.MeasurementTotalNoEditFieldLabel.Text = 'Measurement Total No';

            % Create MeasurementTotalNoEditField
            app.MeasurementTotalNoEditField = uieditfield(app.MetadataTab, 'numeric');
            app.MeasurementTotalNoEditField.RoundFractionalValues = 'on';
            app.MeasurementTotalNoEditField.ValueChangedFcn = createCallbackFcn(app, @MeasurementTotalNoEditFieldValueChanged, true);
            app.MeasurementTotalNoEditField.Position = [697 419 85 22];

            % Create Lamp_MeasurementTotalNo
            app.Lamp_MeasurementTotalNo = uilamp(app.MetadataTab);
            app.Lamp_MeasurementTotalNo.Position = [482 420 20 20];
            app.Lamp_MeasurementTotalNo.Color = [1 0 0];

            % Create Lamp_MeasurementUnit
            app.Lamp_MeasurementUnit = uilamp(app.MetadataTab);
            app.Lamp_MeasurementUnit.Position = [482 395 20 20];
            app.Lamp_MeasurementUnit.Color = [1 0 0];

            % Create Lamp_AveragingTime
            app.Lamp_AveragingTime = uilamp(app.MetadataTab);
            app.Lamp_AveragingTime.Position = [482 370 20 20];
            app.Lamp_AveragingTime.Color = [1 0 0];

            % Create Lamp_ProcessingAlgorithm
            app.Lamp_ProcessingAlgorithm = uilamp(app.MetadataTab);
            app.Lamp_ProcessingAlgorithm.Position = [482 345 20 20];
            app.Lamp_ProcessingAlgorithm.Color = [1 0 0];

            % Create Lamp_DataUUID
            app.Lamp_DataUUID = uilamp(app.MetadataTab);
            app.Lamp_DataUUID.Position = [482 322 20 20];
            app.Lamp_DataUUID.Color = [1 0 0];

            % Create Lamp_DatasetVersion
            app.Lamp_DatasetVersion = uilamp(app.MetadataTab);
            app.Lamp_DatasetVersion.Position = [482 271 20 20];
            app.Lamp_DatasetVersion.Color = [1 0 0];

            % Create Lamp_CalibrationProcedure
            app.Lamp_CalibrationProcedure = uilamp(app.MetadataTab);
            app.Lamp_CalibrationProcedure.Position = [482 246 20 20];
            app.Lamp_CalibrationProcedure.Color = [1 0 0];

            % Create Lamp_CalibrationDatetime
            app.Lamp_CalibrationDatetime = uilamp(app.MetadataTab);
            app.Lamp_CalibrationDatetime.Position = [482 221 20 20];
            app.Lamp_CalibrationDatetime.Color = [1 0 0];

            % Create CalibrationDatetimeDatePickerLabel
            app.CalibrationDatetimeDatePickerLabel = uilabel(app.MetadataTab);
            app.CalibrationDatetimeDatePickerLabel.HorizontalAlignment = 'right';
            app.CalibrationDatetimeDatePickerLabel.Position = [556 220 125 22];
            app.CalibrationDatetimeDatePickerLabel.Text = 'Calibration Datetime';

            % Create CalibrationDatetimeDatePicker
            app.CalibrationDatetimeDatePicker = uidatepicker(app.MetadataTab);
            app.CalibrationDatetimeDatePicker.ValueChangedFcn = createCallbackFcn(app, @CalibrationDatetimeDatePickerValueChanged, true);
            app.CalibrationDatetimeDatePicker.Position = [697 220 109 22];

            % Create TimeEditField_4Label
            app.TimeEditField_4Label = uilabel(app.MetadataTab);
            app.TimeEditField_4Label.HorizontalAlignment = 'right';
            app.TimeEditField_4Label.Position = [816 220 32 22];
            app.TimeEditField_4Label.Text = 'Time';

            % Create TimeEditField_4
            app.TimeEditField_4 = uieditfield(app.MetadataTab, 'text');
            app.TimeEditField_4.ValueChangedFcn = createCallbackFcn(app, @TimeEditField_4ValueChanged, true);
            app.TimeEditField_4.Position = [863 220 100 22];
            app.TimeEditField_4.Value = 'HH:mm';

            % Create Lamp_Comments
            app.Lamp_Comments = uilamp(app.MetadataTab);
            app.Lamp_Comments.Position = [482 187 20 20];
            app.Lamp_Comments.Color = [1 0 0];

            % Create CommentsTextAreaLabel
            app.CommentsTextAreaLabel = uilabel(app.MetadataTab);
            app.CommentsTextAreaLabel.HorizontalAlignment = 'right';
            app.CommentsTextAreaLabel.Position = [568 186 113 22];
            app.CommentsTextAreaLabel.Text = 'Comments';

            % Create CommentsEditField
            app.CommentsEditField = uitextarea(app.MetadataTab);
            app.CommentsEditField.ValueChangedFcn = createCallbackFcn(app, @CommentsEditFieldValueChanged, true);
            app.CommentsEditField.Position = [697 12 266 197];

            % Create fromfileButton_2
            app.fromfileButton_2 = uibutton(app.MetadataTab, 'push');
            app.fromfileButton_2.ButtonPushedFcn = createCallbackFcn(app, @fromfileButton_2Pushed, true);
            app.fromfileButton_2.Position = [790 419 61 22];
            app.fromfileButton_2.Text = 'from file';

            % Create fromfileButton
            app.fromfileButton = uibutton(app.MetadataTab, 'push');
            app.fromfileButton.ButtonPushedFcn = createCallbackFcn(app, @fromfileButtonPushed, true);
            app.fromfileButton.Position = [291.5 271 56 22];
            app.fromfileButton.Text = 'from file';

            % Create DataTab
            app.DataTab = uitab(app.TabGroup);
            app.DataTab.Title = 'Data';
            app.DataTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create SelectDatetimeVectorButton
            app.SelectDatetimeVectorButton = uibutton(app.DataTab, 'push');
            app.SelectDatetimeVectorButton.ButtonPushedFcn = createCallbackFcn(app, @SelectDatetimeVectorButtonPushed, true);
            app.SelectDatetimeVectorButton.Position = [136 446 140 22];
            app.SelectDatetimeVectorButton.Text = 'Select Datetime Vector';

            % Create DateTimeLabel
            app.DateTimeLabel = uilabel(app.DataTab);
            app.DateTimeLabel.Position = [60 446 57 22];
            app.DateTimeLabel.Text = 'DateTime';

            % Create Lamp_DateTime
            app.Lamp_DateTime = uilamp(app.DataTab);
            app.Lamp_DateTime.Position = [23 447 20 20];
            app.Lamp_DateTime.Color = [1 0 0];

            % Create LeqMeasurementsPanel
            app.LeqMeasurementsPanel = uipanel(app.DataTab);
            app.LeqMeasurementsPanel.Title = 'Leq Measurements ';
            app.LeqMeasurementsPanel.Position = [23 35 253 401];

            % Create WritetoICESh5fileButton
            app.WritetoICESh5fileButton = uibutton(app.UIFigure, 'push');
            app.WritetoICESh5fileButton.ButtonPushedFcn = createCallbackFcn(app, @WritetoICESh5fileButtonPushed, true);
            app.WritetoICESh5fileButton.BackgroundColor = [1 1 1];
            app.WritetoICESh5fileButton.Position = [204 31 127 22];
            app.WritetoICESh5fileButton.Text = 'Write to ICES .h5 file';

            % Create MovealldatatoMATLABworkspaceButton
            app.MovealldatatoMATLABworkspaceButton = uibutton(app.UIFigure, 'push');
            app.MovealldatatoMATLABworkspaceButton.ButtonPushedFcn = createCallbackFcn(app, @MovealldatatoMATLABworkspaceButtonPushed, true);
            app.MovealldatatoMATLABworkspaceButton.Position = [533 31 212 22];
            app.MovealldatatoMATLABworkspaceButton.Text = 'Move all data to MATLAB workspace';

            % Create Viewh5filewithhdfviewButton
            app.Viewh5filewithhdfviewButton = uibutton(app.UIFigure, 'push');
            app.Viewh5filewithhdfviewButton.ButtonPushedFcn = createCallbackFcn(app, @Viewh5filewithhdfviewButtonPushed, true);
            app.Viewh5filewithhdfviewButton.Position = [358 31 149 22];
            app.Viewh5filewithhdfviewButton.Text = 'View .h5 file with hdfview';

            % Create GotoICEScontinuousnoiseregistryButton
            app.GotoICEScontinuousnoiseregistryButton = uibutton(app.UIFigure, 'push');
            app.GotoICEScontinuousnoiseregistryButton.ButtonPushedFcn = createCallbackFcn(app, @GotoICEScontinuousnoiseregistryButtonPushed, true);
            app.GotoICEScontinuousnoiseregistryButton.Position = [771 31 213 22];
            app.GotoICEScontinuousnoiseregistryButton.Text = 'Go to ICES continuous noise registry';

            % Create BSH2021Label
            app.BSH2021Label = uilabel(app.UIFigure);
            app.BSH2021Label.FontName = 'Comic Sans MS';
            app.BSH2021Label.FontSize = 8;
            app.BSH2021Label.FontColor = [1 1 1];
            app.BSH2021Label.Position = [1020 2 45 22];
            app.BSH2021Label.Text = 'BSH, 2021';

            % Create ResetButton
            app.ResetButton = uibutton(app.UIFigure, 'push');
            app.ResetButton.ButtonPushedFcn = createCallbackFcn(app, @ResetButtonPushed, true);
            app.ResetButton.BackgroundColor = [0.949 0.6471 0.6471];
            app.ResetButton.Position = [79 31 100 22];
            app.ResetButton.Text = 'Reset';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = format3000_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end