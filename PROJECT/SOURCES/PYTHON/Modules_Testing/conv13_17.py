import numpy as np

khai = open ("ironman_float_input.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (299,299))
# for conv13
# pad_arr = np.pad(data, (1, 1), 'constant', constant_values=(0, 0))
# arr2 = np.delete(pad_arr, 0 , 0)
# arr3 = np.delete(arr2, 299 , 0)
# print(arr3)

# #for conv17
pad_arr = np.pad(data, (3, 3), 'constant', constant_values=(0, 0))
arr2 = np.delete(pad_arr, 0 , 0)
arr3 = np.delete(arr2, 0 , 0)
arr4 = np.delete(arr3, 0 , 0)
arr5 = np.delete(arr4, 299 , 0)
arr6 = np.delete(arr5, 299 , 0)
arr7 = np.delete(arr6, 299 , 0)
# print(arr7)

arr2_y = np.array([[1, 2, 1, 2, 1, 2, 1]])

# arr2_y = np.array([[1, 2, 1]])

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

#for conv 17
conv = my_conv(arr7, arr2_y)
conv1 = np.delete(conv, 0, 1)
conv2 = np.delete(conv1, 0, 1)
conv3 = np.delete(conv2, 0, 1)
conv4 = np.delete(conv3, 299, 1)
conv5 = np.delete(conv4, 299, 1)
conv6 = np.delete(conv5, 299, 1)
convolution = conv6.flatten()
np.savetxt("output_conv_17_s1_p3_python.txt", convolution, delimiter = "\n")

#for conv 13
# conv = my_conv(arr3, arr2_y)
# conv1 = np.delete(conv, 0, 1)
# conv2 = np.delete(conv1, 299, 1)
#print(conv2)

# convolution = conv2.flatten()
# np.savetxt("output_conv_17_s1_p3_python.txt", convolution, delimiter = "\n")

pyy = open("output_conv_17_s1_p3_verilog.txt", "r")
count1 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count1 += 1

ver = open("output_conv_17_s1_p3_verilog.txt", "r")
py = open("output_conv_17_s1_p3_python.txt", "r")
err = [0.0] * (count1)
err1 = [0.0] *(count1)
count = 0

for i in range(count1):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    if (err1[i] > 0.001):
        count +=1
    else:
        count = count

print("The error is:", count, "/", count1)
print("The error percentage is:", ((count / count1)*100),"%")