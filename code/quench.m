if (exist('OCTAVE_VERSION', 'builtin')) % Octave
  load "quench.h5"
  t_1 = eval('_1.t');
  x_1 = eval('_1.x');
  y_1 = eval('_1.y');
  phit0real_1 = eval('_1.phit0real');
  phit0real_1 = permute(phit0real_1, ndims(phit0real_1):-1:1);
  phit0imag_1 = eval('_1.phit0imag');
  phit0imag_1 = permute(phit0imag_1, ndims(phit0imag_1):-1:1);
  phit1real_1 = eval('_1.phit1real');
  phit1real_1 = permute(phit1real_1, ndims(phit1real_1):-1:1);
  phit1imag_1 = eval('_1.phit1imag');
  phit1imag_1 = permute(phit1imag_1, ndims(phit1imag_1):-1:1);
  clear _1;
else % MATLAB
  t_1 = hdf5read('quench.h5', '/1/t');
  x_1 = hdf5read('quench.h5', '/1/x');
  y_1 = hdf5read('quench.h5', '/1/y');
  phit0real_1 = hdf5read('quench.h5', '/1/phit0real');
  phit0real_1 = permute(phit0real_1, ndims(phit0real_1):-1:1);
  phit0imag_1 = hdf5read('quench.h5', '/1/phit0imag');
  phit0imag_1 = permute(phit0imag_1, ndims(phit0imag_1):-1:1);
  phit1real_1 = hdf5read('quench.h5', '/1/phit1real');
  phit1real_1 = permute(phit1real_1, ndims(phit1real_1):-1:1);
  phit1imag_1 = hdf5read('quench.h5', '/1/phit1imag');
  phit1imag_1 = permute(phit1imag_1, ndims(phit1imag_1):-1:1);
end
if (exist('OCTAVE_VERSION', 'builtin')) % Octave
  load "quench.h5"
  t_2 = eval('_2.t');
  norm_2 = eval('_2.norm');
  norm_2 = permute(norm_2, ndims(norm_2):-1:1);
  clear _2;
else % MATLAB
  t_2 = hdf5read('quench.h5', '/2/t');
  norm_2 = hdf5read('quench.h5', '/2/norm');
  norm_2 = permute(norm_2, ndims(norm_2):-1:1);
end
