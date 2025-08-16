if (exist('OCTAVE_VERSION', 'builtin')) % Octave
  load "groundstate_small.h5"
  x_1 = eval('_1.x');
  y_1 = eval('_1.y');
  phi0real_1 = eval('_1.phi0real');
  phi0real_1 = permute(phi0real_1, ndims(phi0real_1):-1:1);
  phi0imag_1 = eval('_1.phi0imag');
  phi0imag_1 = permute(phi0imag_1, ndims(phi0imag_1):-1:1);
  phi1real_1 = eval('_1.phi1real');
  phi1real_1 = permute(phi1real_1, ndims(phi1real_1):-1:1);
  phi1imag_1 = eval('_1.phi1imag');
  phi1imag_1 = permute(phi1imag_1, ndims(phi1imag_1):-1:1);
  clear _1;
else % MATLAB
  x_1 = hdf5read('groundstate_small.h5', '/1/x');
  y_1 = hdf5read('groundstate_small.h5', '/1/y');
  phi0real_1 = hdf5read('groundstate_small.h5', '/1/phi0real');
  phi0real_1 = permute(phi0real_1, ndims(phi0real_1):-1:1);
  phi0imag_1 = hdf5read('groundstate_small.h5', '/1/phi0imag');
  phi0imag_1 = permute(phi0imag_1, ndims(phi0imag_1):-1:1);
  phi1real_1 = hdf5read('groundstate_small.h5', '/1/phi1real');
  phi1real_1 = permute(phi1real_1, ndims(phi1real_1):-1:1);
  phi1imag_1 = hdf5read('groundstate_small.h5', '/1/phi1imag');
  phi1imag_1 = permute(phi1imag_1, ndims(phi1imag_1):-1:1);
end
if (exist('OCTAVE_VERSION', 'builtin')) % Octave
  load "groundstate_small.h5"
  norm_2 = eval('_2.norm');
  norm_2 = permute(norm_2, ndims(norm_2):-1:1);
  clear _2;
else % MATLAB
  norm_2 = hdf5read('groundstate_small.h5', '/2/norm');
  norm_2 = permute(norm_2, ndims(norm_2):-1:1);
end
