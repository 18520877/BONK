from os import error
import numpy as np
from numpy.lib.stride_tricks import as_strided

# A = np.array([[122, 115, 112, 113, 111, 115, 115, 115],
#                   [111, 106, 105, 100, 98, 96, 90, 88],
#                   [78, 75, 65, 58, 57, 44, 48, 42],
#                   [52, 59, 52, 56, 52, 57, 60, 64],
#                   [63, 62, 61, 63, 69, 58, 67, 73],
#                   [59, 65, 64, 63, 64, 64, 62, 68],
#                   [69, 68, 71, 64, 64, 74, 74, 71],
#                   [81, 83, 74, 78, 83, 78, 82, 79]])

binaryy = open ("lena_float.txt","r")
decimal = open ("lena_float_input.txt","w")
convert =[0] * (299*299)
for i in range(89401):
    convert[i] = float(binaryy.readline())
decimal.write(" ".join(map(str,convert)))
decimal.close()

khai = open ("lena_float_input.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (299,299))
# pad_arr = np.pad(data, (2, 2), 'constant', 
#                  constant_values=(0, 0))
# #print(data)

# nghia = open ("output_avg_float_python.txt", "r")
# str1 = nghia.readline()
# arr2 = str1.split()
# arr3 = list(map(str, arr2))
# data1 = np.reshape(arr3, (149,149))
# #print(data1)

def pool2d(A, kernel_size, stride, padding, pool_mode='avg'):
    '''
    2D Pooling

    Parameters:
        A: input 2D array
        kernel_size: int, the size of the window
        stride: int, the stride of the window
        padding: int, implicit zero paddings on both sides of the input
        pool_mode: string, 'max' or 'avg'
    '''
    # Padding
    A = np.pad(A, padding, mode='constant')

    # Window view of A
    output_shape = ((A.shape[0] - kernel_size)//stride + 1,
                    (A.shape[1] - kernel_size)//stride + 1)
    kernel_size = (kernel_size, kernel_size)
    A_w = as_strided(A, shape = output_shape + kernel_size, 
                        strides = (stride*A.strides[0],
                                   stride*A.strides[1]) + A.strides)
    A_w = A_w.reshape(-1, *kernel_size)

    # Return the result of pooling
    if (pool_mode == 'max'):
        return A_w.max(axis=(1,2)).reshape(output_shape)
    elif (pool_mode == 'avg'):
        return A_w.mean(axis=(1,2)).reshape(output_shape)

#print(pool2d(data, kernel_size=3, stride=2, padding=0, pool_mode='avg'))
avg_pooling = pool2d(data, kernel_size=3, stride=1, padding=1, pool_mode='avg')

# err = np.subtract(avg_pooling, data1)
# err = err.flatten()
# #compare = np.count_nonzero(err > 1)
# # err1 = np.absolute(err)
# nonzeroo = np.count_nonzero(err != 0)
# print("The error between avg pooling in python and in verilog is:" ,nonzeroo)

#avg_pooling = map(float, avg_pooling)
avg_pooling1 = avg_pooling.flatten()
np.savetxt("output_avg_33_s1_p1_python.txt", avg_pooling1, newline= "\n")

pyy = open("output_avg_33_s1_p1_verilog.txt", "r")
count1 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count1 += 1

py = open("output_avg_33_s1_p1_python.txt", "r")
ver = open("output_avg_33_s1_p1_verilog.txt", "r")
err = [0.0] * (count1)
err1 = [0.0] *(count1)
count = 0

for i in range(count1):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    if (err1[i] > 0.000001):
        count += 1

print("Total errors:", count)
print("Error percentage:", ((count / count1)*100),"%")