%% generate potential function
delete CirclePotential_smooth.h5
xmin = -120;
xmax = 120;
ymin = xmin;
ymax = xmax;
 
Nx = 480;
Ny = 480;
dx = (xmax-xmin)/Nx;
dy = (ymax-ymin)/Ny;
x = xmin:dx:xmax-dx;
y = ymin:dy:ymax-dy;
y = y';
x = x';

[X,Y] = meshgrid(x,y);
% potential radius
R = 100;
% potential edge steepness
w = 0.5;
% potential height
V0 = 20;

V1 = V0/2*(1 + tanh((sqrt(X.^2+Y.^2) - R)/w));
h5create('CirclePotential_smooth.h5','/1/x',Nx,'Datatype','double','ChunkSize',Nx)
h5create('CirclePotential_smooth.h5','/1/y',Ny,'Datatype','double','ChunkSize',Ny)
h5create('CirclePotential_smooth.h5','/1/V1',[Nx Ny],'Datatype','double','ChunkSize',[Nx Ny])

h5write('CirclePotential_smooth.h5', '/1/x', x)
h5write('CirclePotential_smooth.h5', '/1/y', y)
h5write('CirclePotential_smooth.h5', '/1/V1', V1)