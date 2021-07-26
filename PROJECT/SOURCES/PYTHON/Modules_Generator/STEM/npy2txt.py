import numpy as np

data = np.load("Mixed_5b_Branch_0_Conv2d_1x1_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_0_Conv2d_1x1_kernel.txt", data, delimiter= "\n")

data = np.load("Mixed_5b_Branch_1_Conv2d_0a_1x1_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_1_Conv2d_0a_1x1_kernel.txt", data, delimiter= "\n")

data = np.load("Mixed_5b_Branch_1_Conv2d_0b_5x5_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_1_Conv2d_0b_5x5_kernel.txt", data, delimiter= "\n")

data = np.load("Mixed_5b_Branch_2_Conv2d_0a_1x1_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_2_Conv2d_0a_1x1_kernel.txt", data, delimiter= "\n")

data = np.load("Mixed_5b_Branch_2_Conv2d_0b_3x3_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_2_Conv2d_0b_3x3_kernel.txt", data, delimiter= "\n")

data = np.load("Mixed_5b_Branch_2_Conv2d_0c_3x3_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_2_Conv2d_0c_3x3_kernel.txt", data, delimiter= "\n")

data = np.load("Mixed_5b_Branch_3_Conv2d_0b_1x1_kernel.npy")
data = data.flatten()
np.savetxt("Mixed_5b_Branch_3_Conv2d_0b_1x1_kernel.txt", data, delimiter= "\n")