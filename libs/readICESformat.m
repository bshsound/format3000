function  F = readICESformat(file,path)
%% FileInformation    
try
    F.FileInformation.Email = h5read([path file],'/FileInformation/Email');
end
try
    F.FileInformation.CreationDate = h5read([path file],'/FileInformation/CreationDate');
end
try
    F.FileInformation.StartDate = h5read([path file],'/FileInformation/StartDate');
end
try
    F.FileInformation.EndDate = h5read([path file],'/FileInformation/EndDate');
end
try
    F.FileInformation.Institution = h5read([path file],'/FileInformation/Institution');
end
try
    F.FileInformation.Contact = h5read([path file],'/FileInformation/Contact');
end
try
    F.FileInformation.CountryCode = h5read([path file],'/FileInformation/CountryCode');
end
try
    F.FileInformation.StationCode = h5read([path file],'/FileInformation/StationCode');
end
%% Metadata
try
    F.Metadata.HydrophoneType = h5read([path file],'/Metadata/HydrophoneType');
end
try
    F.Metadata.HydrophoneSerialNumber = h5read([path file],'/Metadata/HydrophoneSerialNumber');
end
try
    F.Metadata.RecorderType = h5read([path file],'/Metadata/RecorderType');
end
try
    F.Metadata.RecorderSerialNumber = h5read([path file],'/Metadata/RecorderSerialNumber');
end
try
    F.Metadata.MeasurementHeight = h5read([path file],'/Metadata/MeasurementHeight');
end
try
    F.Metadata.MeasurementPurpose = h5read([path file],'/Metadata/MeasurementPurpose');
end
try
    F.Metadata.MeasurementSetup = h5read([path file],'/Metadata/MeasurementSetup');
end
try
    F.Metadata.RigDesign = h5read([path file],'/Metadata/RigDesign');
end
try
    F.Metadata.FrequencyCount = h5read([path file],'/Metadata/FrequencyCount');
end
try
    F.Metadata.FrequencyIndex = h5read([path file],'/Metadata/FrequencyIndex');
end
try
    F.Metadata.FrequencyUnit = h5read([path file],'/Metadata/FrequencyUnit');
end
try
    F.Metadata.ChannelCount = h5read([path file],'/Metadata/ChannelCount');
end
try
    F.Metadata.MeasurementTotalNo = h5read([path file],'/Metadata/MeasurementTotalNo');
end
try
    F.Metadata.MeasurementUnit = h5read([path file],'/Metadata/MeasurementUnit');
end
try
    F.Metadata.AveragingTime = h5read([path file],'/Metadata/AveragingTime');
end
try
    F.Metadata.ProcessingAlgorithm = h5read([path file],'/Metadata/ProcessingAlgorithm');
end
try
    F.Metadata.DataUUID = h5read([path file],'/Metadata/DataUUID');
end
try
    F.Metadata.DatasetVersion = h5read([path file],'/Metadata/DatasetVersion');
end
try
    F.Metadata.CalibrationProcedure = h5read([path file],'/Metadata/CalibrationProcedure');
end
try
    F.Metadata.CalibrationDateTime = h5read([path file],'/Metadata/CalibrationDateTime');
end
try
    F.Metadata.Comments = h5read([path file],'/Metadata/Comments');
end
%% Data
try
    F.Data.DateTime = h5read([path file],'/Data/DateTime');
end
try
    F.Data.LeqMeasurementsOfChannel1 = h5read([path file],'/Data/LeqMeasurementsOfChannel1');
end
end