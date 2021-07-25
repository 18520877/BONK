import math

import numpy as np
test1 = open("check.txt", "r")
convert = [0]*(1536)
for i in range(1536):
    convert[i] = float(test1.readline())

z_exp = [math.exp(i) for i in convert]
sum_z_exp = sum(z_exp)
softmax = [round(i / sum_z_exp, 25) for i in z_exp]
#soft = [round(i, 5) for i in z_exp]
np.savetxt("output_softmax_python.txt", softmax, newline = "\n")

ver = open("output_softmax_verilog.txt", "r")
py = open("output_softmax_python.txt", "r")
err = [0.0] * (1536)
err1 = [0.0] *(1536)
count = 0
for i in range(1536):
    err[i] = float(py.readline()) - float(ver.readline())
    err1[i] = np.abs(err[i])
    if (err1[i] > 0.000000000000000000001):
        count +=1
    else:
        count = count

print("The error is:", count)

#for random generate
# import random as rd
# haha = open("check.txt", "w")
# data1 = [0.0] * (1536)
# for x in range(1536):
#     data = rd.random()
#     data1[x] = (data * 55)
# haha.write("\n".join(map(str,data1)))
# haha.close()