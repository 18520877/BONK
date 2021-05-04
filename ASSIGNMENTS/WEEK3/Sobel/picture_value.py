import cv2
from PIL import Image
import numpy as np

im = cv2.imread("lena.png")

r,g,b = im[:,:,0], im[:,:,1] ,im[:,:,2]


with open("red.txt","w") as red:
        temp_r = r.reshape((r.shape[0]*r.shape[1]))
        result =[]
        for i in temp_r:
                result.append(np.binary_repr(i, width=8))
        red.write("\n".join(result))
        red.close()
with open("green.txt","w") as green:
        temp_g = g.reshape((g.shape[0]*g.shape[1]))
        result =[]
        for i in temp_g:
                result.append(np.binary_repr(i, width=8))
        green.write("\n".join(result))
        green.close()
with open("blue.txt","w") as blue:
        temp_b = b.reshape((b.shape[0]*b.shape[1]))
        result =[]
        for i in temp_b:
                result.append(np.binary_repr(i, width=8))
        blue.write("\n".join(result))
        blue.close()

with open("gray_float.txt","w") as gray_value:
        gray_valuee =[0.0]*(220*220)
        for i in range(48400):
            gray_valuee[i] = 0.299*temp_r[i] + 0.578*temp_g[i] + 0.114*temp_b[i]
        gray_value.write("\n".join(map(str,gray_valuee)))
        gray_value.close()

