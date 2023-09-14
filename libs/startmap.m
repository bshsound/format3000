function startmap(AXES)
LONLIMS = [-7   29];
LATLIMS = [50   69];
cla(AXES,'reset')
close
m_proj('Mercator','long',LONLIMS,'lat',LATLIMS);
m_gshhs_l('patch',[.85 .85 .85],'Parent',AXES);
m_gshhs_l('color','k','Parent',AXES);
m_gshhs_l('speckle','color','k','Parent',AXES);
m_grid(AXES,'linewi',2,'tickdir','out');
close
end