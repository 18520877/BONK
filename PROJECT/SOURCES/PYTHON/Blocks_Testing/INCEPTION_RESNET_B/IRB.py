import numpy as np
from numpy.lib.stride_tricks import as_strided
import struct

# for converting 32bit fp to float
def bin_2_float(num):
    return format(struct.unpack('f', struct.pack('I', num))[0])

test = open("output_IRB_32bit.txt", "r")
test1 = open("output_IRB_verilog.txt", "w")
convert = [0]*(289)
for i in range(289):
    convert[i] = bin_2_float(int(test.readline(), 2))
test1.write("\n".join(map(str,convert)))
test1.close()

# to form input array
binaryy = open ("output_redA_python.txt","r")
decimal = open ("input_IRB.txt","w")

convert =[0] * (289)
for i in range(289):
    convert[i] = float(binaryy.readline())
decimal.write(" ".join(map(str,convert)))
decimal.close()

khai = open ("input_IRB.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (17,17))

kernel_11_5 = np.array([0.01])
kernel17 = np.array([[0.01, 0.01, 0.01, 0.01, 0.01, 0.01, 0.01]])
kernel71 = np.array([[0.01],
                   [0.01],
                   [0.01],
                   [0.01],
                   [0.01],
                   [0.01],
                   [0.01]])

conv11_1a = data * kernel_11_5 [:, np.newaxis]

# padding for conv 17
pad_arr = np.pad(conv11_1a, (3, 3), 'constant', constant_values=(0, 0))
arr2 = np.delete(pad_arr, 0 , 0)
arr3 = np.delete(arr2, 0 , 0)
arr4 = np.delete(arr3, 0 , 0)
arr5 = np.delete(arr4, 17 , 0)
arr6 = np.delete(arr5, 17 , 0)
arr7 = np.delete(arr6, 17 , 0)

# for conv 17
def my_conv(im2d, ker1d):
    out = np.zeros(im2d.shape, dtype=im2d.dtype)  # allocate output assuming mode='same' 
    if ker1d.shape[0] == 1:
        # horizontal kernel
        for row in range(im2d.shape[0]):
            out[row,:] = np.convolve(im2d[row,:], ker1d.flatten(), mode='same')
    elif ker1d.shape[1] == 1:
        # vertical kernel
        for col in range(im2d.shape[1]):
            out[:,col] = np.convolve(im2d[:,col], ker1d.flatten(), mode='same')
    else:
        raise ValueError('input kernel is not 1D')
    return out

conv = my_conv(arr7, kernel17)
conv1 = np.delete(conv, 0, 1)
conv2 = np.delete(conv1, 0, 1)
conv3 = np.delete(conv2, 0, 1)
conv4 = np.delete(conv3, 17, 1)
conv5 = np.delete(conv4, 17, 1)
conv17_1b = np.delete(conv5, 17, 1)

# padding for conv 71
data1 = conv17_1b.flatten()
pad_arr1 = np.pad(data1, (51, 51), 'constant', constant_values=(0, 0))
data2 = np.reshape(pad_arr1,(23, 17))

#for conv 71
convo = my_conv(data2, kernel71)
convo1 = np.delete(convo, 0, 0)
convo2 = np.delete(convo1, 0, 0)
convo3 = np.delete(convo2, 0, 0)
convo4 = np.delete(convo3, 17, 0)
convo5 = np.delete(convo4, 17, 0)
conv71_1c = np.delete(convo5, 17, 0)

conv11_2 = data * kernel_11_5 [:, np.newaxis]

conv11_3 = conv11_2 * kernel_11_5 [:, np.newaxis]

out = conv11_3 + data

np.savetxt("output_IRB_python.txt", out, delimiter = "\n")

pyy = open("output_IRB_verilog.txt", "r")
count3 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count3 += 1

py = open("output_IRB_python.txt", "r")
ver = open("output_IRB_verilog.txt", "r")
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