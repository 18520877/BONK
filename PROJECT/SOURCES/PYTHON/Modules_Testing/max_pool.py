import numpy as np
from numpy.lib.stride_tricks import as_strided

# binaryy = open ("lena_float.txt","r")
# decimal = open ("lena_float_input.txt","w")
# convert =[0] * (299*299)
# for i in range(89401):
#     convert[i] = float(binaryy.readline())
# decimal.write(" ".join(map(str,convert)))
# decimal.close()

khai = open ("ironman_float_input.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (299,299))

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

#print(pool2d(data, kernel_size=3, stride=2, padding=0, pool_mode='avg'))
max_pooling = pool2d(data, kernel_size=3, stride=2, padding=0, pool_mode='max')

#avg_pooling = map(float, avg_pooling)
max_pooling1 = max_pooling.flatten()
np.savetxt("max_pool_fp_python.txt", max_pooling1, newline= "\n")

py = open("max_pool_fp_python.txt", "r")
ver = open("output_max33_verilog.txt", "r")
err = [0.0] * (22201)
err1 = [0.0] *(22201)
count = 0

pyy = open("max_pool_fp_python.txt", "r")
count1 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count1 += 1

for i in range(22201):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    if (err1[i] > 0.1):
        count += 1

print("The error 1 is:", count)
print("Error percentage:", ((count / count1)*100),"%")