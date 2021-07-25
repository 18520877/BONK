import numpy as np
from numpy.lib.stride_tricks import as_strided
import struct

# for converting 32bit fp to float
def bin_2_float(num):
    return format(struct.unpack('f', struct.pack('I', num))[0])

test = open("output_IRA_32bit.txt", "r")
test1 = open("output_IRA_verilog.txt", "w")
convert = [0]*(1225)
for i in range(1225):
    convert[i] = bin_2_float(int(test.readline(), 2))
test1.write("\n".join(map(str,convert)))
test1.close()

# to form input array
binaryy = open ("output_inceptionA_python.txt","r")
decimal = open ("input_IRA.txt","w")

convert =[0] * (1225)
for i in range(1225):
    convert[i] = float(binaryy.readline())
decimal.write(" ".join(map(str,convert)))
decimal.close()

khai = open ("input_IRA.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (35,35))

kernel1 = np.array([0.01])

kernel3 = np.array([[0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01],
                    [0.01, 0.01, 0.01]])

conv11_1a = data * kernel1 [:, np.newaxis]

conv11_2a = data * kernel1 [:, np.newaxis]

conv11_3a = data * kernel1 [:, np.newaxis]

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

conv33_1c = stride_conv(conv33_1b,kernel1,1,1)

conv33_2b = stride_conv(conv11_2a,kernel1,1,1)

conv11_4 = conv11_3a * kernel1 [:, np.newaxis]

out = conv11_4 + data
out1 = out.flatten()

np.savetxt("output_IRA_python.txt", out1, delimiter = "\n")

pyy = open("output_IRA_verilog.txt", "r")
count3 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count3 += 1

py = open("output_IRA_python.txt", "r")
ver = open("output_IRA_verilog.txt", "r")
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