import numpy as np

khai = open ("ironman_float_input.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (299,299))
data1 = data.flatten()

#for conv31
# pad_arr = np.pad(data1, (299, 299), 'constant', constant_values=(0, 0))
# arr2 = np.reshape(pad_arr,(301, 299))

#for conv71
pad_arr = np.pad(data1, (897, 897), 'constant', constant_values=(0, 0))
arr2 = np.reshape(pad_arr,(305, 299))

arr2_y = np.array([[1],
                   [2],
                   [1],
                   [2],
                   [1],
                   [2],
                   [1]])

# arr2_y = np.array([[1],
#                   [2],
#                   [1]])

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

#for conv 71
conv = my_conv(arr2, arr2_y)
conv1 = np.delete(conv, 0, 0)
conv2 = np.delete(conv1, 0, 0)
conv3 = np.delete(conv2, 0, 0)
conv4 = np.delete(conv3, 299, 0)
conv5 = np.delete(conv4, 299, 0)
conv6 = np.delete(conv5, 299, 0)
# # convolution = conv2.flatten()
# # np.savetxt("output_conv_31_s1_p1_python.txt", convolution, delimiter = "\n")

#for conv 31
# conv = my_conv(arr2, arr2_y)
# conv1 = np.delete(conv, 0, 0)
# conv2 = np.delete(conv1, 299, 0)

convolution = conv6.flatten()
np.savetxt("output_conv_71_s1_p3_python.txt", convolution, delimiter = "\n")
pyy = open("output_conv_71_s1_p3_verilog.txt", "r")
count1 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count1 += 1

ver = open("output_conv_71_s1_p3_verilog.txt", "r")
py = open("output_conv_71_s1_p3_python.txt", "r")
err = [0.0] * (count1)
err1 = [0.0] *(count1)
count = 0

for i in range(count1):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    if (err1[i] > 0.0001):
        count +=1
    else:
        count = count

print("The error is:", count, "/", count1)
print("The error percentage is:", ((count / count1)*100),"%")