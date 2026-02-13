function s = localIsoZ(x)
% Normalisiert diverse Eingaben (datetime, datenum, char/string)
% auf UTC-ISO-8601 "YYYY-MM-DDTHH:MM:SSZ", ohne Leerzeichen/Padding.

    if isdatetime(x)
        dt = x;
    elseif isnumeric(x)
        % interpretiere als MATLAB datenum
        dt = datetime(x, 'ConvertFrom','datenum');
    else
        sx = strtrim(string(x));
        % Schon ISO mit T/Z?
        m = regexp(sx,'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$','once');
        if ~isempty(m)
            s = sx;          % bereits korrekt
            return
        end
        % Typische Formate robust parsen:
        try
            dt = datetime(sx,'InputFormat','yyyy-MM-dd HH:mm:ss');
        catch
            try
                dt = datetime(sx,'InputFormat','yyyy/MM/dd HH:mm:ss');
            catch
                dt = datetime(sx); % letzter Versuch (ISO ohne Z o.ä.)
            end
        end
    end

    % Zeitzone auf UTC setzen/konvertieren
    % if isempty(dt.TimeZone)
        % dt.TimeZone = 'UTC';
    % else
        dt.TimeZone = 'UTC';
    % end

    dt.Format = "yyyy-MM-dd'T'HH:mm:ss'Z'";
    s = string(dt);
end
