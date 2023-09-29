function MB = startmap(AXES)
LONLIMS = [-7   29];
LATLIMS = [50   69];
cla(AXES,'reset')
close
m_proj('Mercator','long',LONLIMS,'lat',LATLIMS);
m_gshhs_l('patch',[.85 .85 .85],'Parent',AXES);
m_gshhs_l('color','k','Parent',AXES);
m_gshhs_l('speckle','color','k','Parent',AXES);
bndry_lat=[50 69 69 50];
bndry_lon=[-7 -7 29 29];
m_grid(AXES,'linewi',2,'tickdir','out');
MB = m_line(bndry_lon,bndry_lat,'Parent',AXES,'Color',[0 0 0],'LineWidth',1)
close
hold(AXES, 'on' )



end