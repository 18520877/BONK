import numpy as np

khai = open ("ironman_float_input.txt", "r")
strr = khai.readline()
arr = strr.split()
arr1 = list(map(float, arr))
data = np.reshape(arr1, (299,299))
#print(data)

# arr2_x = np.array([[2,2,4,2,2],
#                  [1,1,2,1,1],
#                  [0,0,0,0,0],
#                  [-1,-1,-2,-1,-1],
#                  [-2,-2,-4,-2,-2]])

arr2_y = np.array([[1,2,1]])

# arr2_y = np.array([[1,0,-1],
#                   [2,0,-2],
#                   [1,0,-1]])

# #for stride = 1, conv 33, padding = 0
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

convolution = stride_conv(data,arr2_y,1,0)
print(convolution)
# convolution1 = convolution.flatten()
# np.savetxt("output_conv_55_s1_p2_python.txt", convolution1, delimiter = "\n")

# pyy = open("output_conv_55_s1_p2_verilog.txt", "r")
# count1 = 0
# data = pyy.read()
# data1 = data.split("\n")
# for j in data1:
#     if j:
#         count1 += 1

# ver = open("output_conv_55_s1_p2_verilog.txt", "r")
# py = open("output_conv_55_s1_p2_python.txt", "r")
# err = [0.0] * (count1)
# err1 = [0.0] *(count1)
# count = 0

# for i in range(count1):
#     err[i] = float(py.readline()) - float(ver.readline())
#     err1[i] = np.abs(err[i])
#     if (err1[i] > 0.01):
#         count +=1
#     else:
#         count = count

# print("The error is:", count, "/", count1)
# print("The error percentage is:", ((count / count1)*100),"%")