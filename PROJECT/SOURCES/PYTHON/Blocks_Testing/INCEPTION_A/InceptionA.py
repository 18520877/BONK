import numpy as np
from numpy.lib.stride_tricks import as_strided
import struct

# for converting 32bit fp to float
def bin_2_float(num):
    return format(struct.unpack('f', struct.pack('I', num))[0])

test = open("output_inceptionA_32bit.txt", "r")
test1 = open("output_inceptionA_verilog.txt", "w")
convert = [0]*(1225)
for i in range(1225):
    convert[i] = bin_2_float(int(test.readline(), 2))
test1.write("\n".join(map(str,convert)))
test1.close()

# to form input array
binaryy = open ("output_stem_python.txt","r")
decimal = open ("input_inceptionA.txt","w")

convert =[0] * (1225)
for i in range(1225):
    convert[i] = float(binaryy.readline())
decimal.write(" ".join(map(str,convert)))
decimal.close()

khai = open ("input_inceptionA.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (35,35))

kernel_11_5 = np.array([0.01])
kernel1 = np.array([[0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01]])
kernel2 = np.array([[0.01, 0.01, 0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01, 0.01, 0.01]])

conv11_1a = data * kernel_11_5 [:, np.newaxis]

conv11_2a = data * kernel_11_5 [:, np.newaxis]

conv11_3a = data * kernel_11_5 [:, np.newaxis]

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

avg_pooling4a = pool2d(data, kernel_size=3, stride=1, padding=1, pool_mode='avg')

# for stride = 1, conv 33, padding = 1
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
conv33_1b = stride_conv(conv11_1a,kernel1,1,1)

# for stride = 1, conv 33, padding = 1
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
conv33_1c = stride_conv(conv33_1b,kernel1,1,1)

# for stride = 1, conv 55, padding = 2
def stride_conv(arr1,arr2,s,p):
    A = np.pad(arr1, p, mode='constant')
    beg = 0
    end = arr2.shape[0]
    final = []
    for i in range(0,A.shape[0]-4,s):
        k = []
        for j in range(0,A.shape[0]-4,s):
                k.append(np.sum(A[beg+i:end+i, beg+j:end+j] * (arr2)))
        final.append(k)

    return np.array(final)
conv55_2b = stride_conv(conv11_2a,kernel2,1,2)

conv11_4b = avg_pooling4a * kernel_11_5 [:, np.newaxis]

demo1 = np.concatenate((conv33_1c.flatten(), conv55_2b.flatten()), axis=0)
demo2 = np.concatenate((demo1, conv11_3a.flatten()), axis=0)
demo3 = np.concatenate((demo2, conv11_4b.flatten()), axis=0)

#out_stem = max_pooling_7.flatten()
np.savetxt("output_inceptionA_python.txt", demo3, delimiter = "\n")

pyy = open("output_inceptionA_verilog.txt", "r")
count3 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count3 += 1

py = open("output_inceptionA_python.txt", "r")
ver = open("output_inceptionA_verilog.txt", "r")
err = [0.0] * (count3)
err1 = [0.0] *(count3)
count = 0
sum = 0
average = 0

for i in range(count3):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    sum += err1[1]
    average = sum/count3
    if (err1[i] > 0.000000001):
        count += 1

print("Total errors:", count)
print("Error percentage:", ((count / count3)*100),"%")
print("Average error:", average)