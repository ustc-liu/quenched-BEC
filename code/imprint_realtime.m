if (exist('OCTAVE_VERSION', 'builtin')) % Octave
  load "imprint_realtime.h5"
  t_1 = eval('_1.t');
  x_1 = eval('_1.x');
  y_1 = eval('_1.y');
  phitt0real_1 = eval('_1.phitt0real');
  phitt0real_1 = permute(phitt0real_1, ndims(phitt0real_1):-1:1);
  phitt0imag_1 = eval('_1.phitt0imag');
  phitt0imag_1 = permute(phitt0imag_1, ndims(phitt0imag_1):-1:1);
  phitt1real_1 = eval('_1.phitt1real');
  phitt1real_1 = permute(phitt1real_1, ndims(phitt1real_1):-1:1);
  phitt1imag_1 = eval('_1.phitt1imag');
  phitt1imag_1 = permute(phitt1imag_1, ndims(phitt1imag_1):-1:1);
  clear _1;
else % MATLAB
  t_1 = hdf5read('imprint_realtime.h5', '/1/t');
  x_1 = hdf5read('imprint_realtime.h5', '/1/x');
  y_1 = hdf5read('imprint_realtime.h5', '/1/y');
  phitt0real_1 = hdf5read('imprint_realtime.h5', '/1/phitt0real');
  phitt0real_1 = permute(phitt0real_1, ndims(phitt0real_1):-1:1);
  phitt0imag_1 = hdf5read('imprint_realtime.h5', '/1/phitt0imag');
  phitt0imag_1 = permute(phitt0imag_1, ndims(phitt0imag_1):-1:1);
  phitt1real_1 = hdf5read('imprint_realtime.h5', '/1/phitt1real');
  phitt1real_1 = permute(phitt1real_1, ndims(phitt1real_1):-1:1);
  phitt1imag_1 = hdf5read('imprint_realtime.h5', '/1/phitt1imag');
  phitt1imag_1 = permute(phitt1imag_1, ndims(phitt1imag_1):-1:1);
end
if (exist('OCTAVE_VERSION', 'builtin')) % Octave
  load "imprint_realtime.h5"
  t_2 = eval('_2.t');
  norm_2 = eval('_2.norm');
  norm_2 = permute(norm_2, ndims(norm_2):-1:1);
  clear _2;
else % MATLAB
  t_2 = hdf5read('imprint_realtime.h5', '/2/t');
  norm_2 = hdf5read('imprint_realtime.h5', '/2/norm');
  norm_2 = permute(norm_2, ndims(norm_2):-1:1);
end
