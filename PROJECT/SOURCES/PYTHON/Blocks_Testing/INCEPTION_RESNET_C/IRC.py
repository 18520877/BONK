import numpy as np
from numpy.lib.stride_tricks import as_strided
import struct

# for converting 32bit fp to float
def bin_2_float(num):
    return format(struct.unpack('f', struct.pack('I', num))[0])

test = open("output_IRC_32bit.txt", "r")
test1 = open("output_IRC_verilog.txt", "w")
convert = [0]*(64)
for i in range(64):
    convert[i] = bin_2_float(int(test.readline(), 2))
test1.write("\n".join(map(str,convert)))
test1.close()

# to form input array
binaryy = open ("output_redB_python.txt","r")
decimal = open ("input_IRC.txt","w")

convert =[0] * (64)
for i in range(64):
    convert[i] = float(binaryy.readline())
decimal.write(" ".join(map(str,convert)))
decimal.close()

khai = open ("input_IRC.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (8,8))

kernel_11_5 = np.array([0.01])
kernel13 = np.array([[0.01, 0.01, 0.01]])
kernel31 = np.array([[0.01],
                   [0.01],
                   [0.01]])

conv11_1a = data * kernel_11_5 [:, np.newaxis]

conv11_2 = data * kernel_11_5 [:, np.newaxis]

# padding for conv 13
pad_arr = np.pad(conv11_1a, (1, 1), 'constant', constant_values=(0, 0))
arr2 = np.delete(pad_arr, 0 , 0)
arr5 = np.delete(arr2, 8 , 0)

# for conv 13
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

conv = my_conv(arr5, kernel13)
conv1 = np.delete(conv, 0, 1)
conv13_1b = np.delete(conv1, 8, 1)

# padding for conv 31
data1 = conv13_1b.flatten()
pad_arr1 = np.pad(data1, (8, 8), 'constant', constant_values=(0, 0))
data2 = np.reshape(pad_arr1,(10, 8))

#for conv 31
convo = my_conv(data2, kernel31)
convo1 = np.delete(convo, 0, 0)
conv31_1c = np.delete(convo1, 8, 0)

conv11_3 = conv11_2 * kernel_11_5 [:, np.newaxis]
out = conv11_3 + data
out1 = out.flatten()

np.savetxt("output_IRC_python.txt", out1, delimiter = "\n")

pyy = open("output_IRC_verilog.txt", "r")
count3 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count3 += 1

py = open("output_IRC_python.txt", "r")
ver = open("output_IRC_verilog.txt", "r")
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