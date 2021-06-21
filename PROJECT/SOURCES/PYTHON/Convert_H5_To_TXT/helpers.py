import os
import sys
import doctest
import h5py
import numpy as np
def write_dh5_np(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels, np_array):
    """
    :param h5_name: Name of a h5 file
    :type h5_name: str
    :param np_array: Array of floats
    :type np_array: np.array
    """
    # assert not os.path.isfile(h5_name), "Won't overwrite {}".format(h5_name)

    with h5py.File(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels, 'w') as h5_file:
        h5_file.create_dataset('inception_resnet_v2_weights_tf_dim_ordering_tf_kernels', data=np_array)

def read_hd5_np(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels):
    """
    :param h5_name: Name of a h5 file
    :type h5_name: str

    :returns: Data in h5 file
    :rtype: np.array
    """
    with h5py.File(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels, 'r') as h5_file:
        np_array = h5_file['inception_resnet_v2_weights_tf_dim_ordering_tf_kernels'][()]

    return np_array

def convert_to_txt(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels, txt_name=None):
    """
    :param h5_name: Name of a h5 file
    :type h5_name: str
    :param txt_name: Name of a txt file to be created
    :type txt_name: str

    :returns: Name of a txt file that was created
    :rtype: str
    """
    if txt_name is None:
        strip_name = os.path.splitext(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels)[0]
        txt_name = '{inception_resnet_v2_weights_tf_dim_ordering_tf_kernels}.txt'.format(strip_name)

    # assert not os.path.isfile(txt_name), "Won't overwrite {}".format(txt_name)

    np_array = read_hd5_np(inception_resnet_v2_weights_tf_dim_ordering_tf_kernels)
    np.savetxt(txt_name, np_array)

    return txt_name