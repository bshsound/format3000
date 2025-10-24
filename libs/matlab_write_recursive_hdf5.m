function matlab_write_recursive_hdf5(filename, location, data)
% Writes a struct into an HDF5 file with sane handling:
% - strings/chars -> scalar variable-length strings
% - empty strings -> write "" (not [])
% - empty numerics -> skip
% - datetimes -> ISO strings
% - precreate file if missing

    % ensure file exists
    if ~isfile(filename)
        fid = H5F.create(filename); H5F.close(fid);
    end

    if isstruct(data)
        fns = fieldnames(data);
        for i = 1:numel(fns)
            name  = fns{i};
            loc   = [location '/' name];
            field = data.(name);
            matlab_write_recursive_hdf5(filename, loc, field);
        end
        return
    end

    % ==== scalars & arrays by type ====
    if isstring(data) || ischar(data)
        s = string(data);
        if isempty(s)
            s = "";                    % write empty string, not []
        end
        % delete existing dataset (avoids fixed-length leftovers)
        delete_if_exists(filename, location);
        % scalar vlen string
        try, h5create(filename, location, 1, 'Datatype','string'); end
        h5write(filename, location, s);
        return
    end

    if isdatetime(data)
        s = string(datestr(data, 'yyyy-mm-ddTHH:MM:SS'));  % oder data.Format falls gesetzt
        delete_if_exists(filename, location);
        try, h5create(filename, location, 1, 'Datatype','string'); end
        h5write(filename, location, s);
        return
    end

    if iscellstr(data)
        s = string(data);
        if isempty(s)
            return                    % skip empty cellstr
        end
        delete_if_exists(filename, location);
        try, h5create(filename, location, size(s), 'Datatype','string'); end
        h5write(filename, location, s);
        return
    end

    if isnumeric(data) || islogical(data)
        if isempty(data)
            return                    % skip empty numeric datasets
        end
        sz = size(data);
        % if dataset exists with different size, recreate
        recreate = false;
        try
            info = h5info(filename, location);
            if ~isequal(info.Dataspace.Size, sz)
                recreate = true;
            end
        catch
            % does not exist -> create
        end
        if recreate
            delete_if_exists(filename, location);
        end
        try, h5create(filename, location, sz); end
        h5write(filename, location, data);
        return
    end

    % Fallback: stringify unknown types
    s = string(data);
    delete_if_exists(filename, location);
    try, h5create(filename, location, 1, 'Datatype','string'); end
    h5write(filename, location, s);
end

function delete_if_exists(filename, path)
    try
        fid = H5F.open(filename,'H5F_ACC_RDWR','H5P_DEFAULT');
        H5L.delete(fid, path, 'H5P_DEFAULT');
        H5F.close(fid);
    catch
        % ok if not existing
    end
end
