Natom = 2e6;
hbar = 1.0545718e-34;
matom = 6*1.6726219e-27;
rB = 0.053e-9;
as = 100*rB;
omega_x = 2*pi*20;
omega_y = 2*pi*20;
omega_z = 2*pi*400;

E0 = hbar*omega_x;
t0 = 1/omega_x;
a0 = sqrt(hbar/(matom*omega_x));

az = sqrt(2*pi*hbar/(matom*omega_z));

g_2d = 4*pi*hbar^2*as/(matom*az);

% dimensionless interaction
g = g_2d/(E0*a0^2);
R = (4*g*Natom/pi)^(1/4);