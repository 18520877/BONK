import numpy as np
import helpers as hp


np_array = np.random.random((30, 30));
h5_name = 'inception_resnet_v2_weights_tf_dim_ordering_tf_kernels.h5';
hp.write_dh5_np(h5_name, np_array);
np_array_from_h5 = hp.read_hd5_np(h5_name);
np.allclose(np_array_from_h5, np_array);
txt_name = 'inception_resnet_v2_weights_tf_dim_ordering_tf_kernels.txt'
txt_name = hp.convert_to_txt(h5_name, txt_name)
np_array_from_txt = np.loadtxt(txt_name)
np.allclose(np_array_from_txt, np_array)