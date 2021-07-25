from PIL import Image 
import numpy as np
from numpy.lib.stride_tricks import as_strided

khai = open ("ironman_float_input.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (299,299))

kernel_11_5 = np.array([0.001])
kernel1 = np.array([[0.001, 0.001, 0.001],
                    [-0.001, -0.001, -0.001],
                    [0.001, 0.001, 0.001]])

# for stride = 2, conv 33, padding = 0
def stride_conv(arr1,arr2,s,p):
    A = np.pad(arr1, p, mode='constant')
    beg = 0
    end = arr2.shape[0]
    final = []
    for i in range(0,A.shape[0]-1,s):
        k = []
        for j in range(0,A.shape[0]-1,s):
                k.append(np.sum(A[beg+i:end+i, beg+j:end+j] * (arr2)))
        final.append(k)

    return np.array(final)

conv33_1 = stride_conv(data,kernel1,2,0)

# for stride = 1, conv 33, padding = 0
def stride_conv(arr1,arr2,s,p):
    A = np.pad(arr1, p, mode='constant')
    beg = 0
    end = arr2.shape[0]
    final = []
    for i in range(0,A.shape[0]-2,s):
        k = []
        for j in range(0,A.shape[0]-2,s):
                k.append(np.sum(A[beg+i:end+i, beg+j:end+j] * (arr2)))
        final.append(k)

    return np.array(final)
conv33_2 = stride_conv(conv33_1,kernel1,1,0)

conv33_3 = stride_conv(conv33_2,kernel1,1,1)

def pool2d(A, kernel_size, stride, padding, pool_mode='max'):
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

max_pooling_4 = pool2d(conv33_3, kernel_size=3, stride=2, padding=0, pool_mode='max')

con11_5 = max_pooling_4 * kernel_11_5[:, np.newaxis]

conv33_6 = stride_conv(con11_5,kernel1,1,0)

max_pooling_7 = pool2d(conv33_6, kernel_size=3, stride=2, padding=0, pool_mode='max')

out_stem = max_pooling_7.flatten()
np.savetxt("output_stem_python.txt", out_stem, delimiter = "\n")

pyy = open("output_stem_verilog.txt", "r")
count1 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count1 += 1

py = open("output_stem_python.txt", "r")
ver = open("output_stem_verilog.txt", "r")
err = [0.0] * (count1)
err1 = [0.0] *(count1)
count = 0
sum = 0
average = 0

for i in range(count1):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    sum += err1[1]
    average = sum/count1
    if (err1[i] > 0.000000001):
        count += 1

print("Total errors:", count)
print("Error percentage:", ((count / count1)*100),"%")
print("Average error:", average)