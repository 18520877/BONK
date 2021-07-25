from os import replace
import cv2
from PIL import Image
import numpy as np
import struct

im = Image.open("ironman_org.jpg")
resized_image = im.resize((299,299))
resized_image.save("ironman.jpg")

imm = cv2.imread("ironman.jpg")

r,g,b = imm[:,:,0], imm[:,:,1] ,imm[:,:,2]


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

with open("ironman_float.txt","w") as gray_value:
        gray_valuee =[0.0]*(299*299)
        for i in range(89401):
            #gray_valuee[i] = format(int(0.299*temp_r[i] + 0.578*temp_g[i] + 0.114*temp_b[i]), "b")
            #gray_valuee[i] = int(0.299*temp_r[i] + 0.578*temp_g[i] + 0.114*temp_b[i])
            gray_valuee[i] = 0.299*temp_r[i] + 0.578*temp_g[i] + 0.114*temp_b[i]
        gray_value.write("\n".join(map(str,gray_valuee)))
        gray_value.close()

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

test = open("ironman_float.txt", "r")
test1 = open("ironman_32bit.txt", "w")
convert = [0]*(89401)
for i in range(89401):
    convert[i] = float_to_bin(float(test.readline()))
test1.write("\n".join(map(str,convert)))
test1.close()

# gray_float = open("gray_floatt.txt","r")
# gray_dec = open("gray_deci.txt","w")
# convert =[0]*(124*124)
# for i in range(15376):
#     convert[i] = int((gray_float.readline()),10)
# gray_dec.write("\n".join(map(str,convert)))
# gray_dec.close()

# gray_fl=open("gray_float.txt","r")
# gray_de=open("gray_deci.txt","r")
# error =  open("error.txt","w")
# errorr =[0.0]*(124*124)
# for i in range(15376):
#     gray_fl_value = float((gray_fl.readline()))
#     gray_de_value = int((gray_de.readline()))
#     errorr[i] = gray_fl_value - gray_de_value
# error.write("\n".join(map(str,errorr)))
# error.close()


# img = np.zeros((299,299),dtype=np.uint8)
# y_value = open ("gray_deci_boom.txt","r")
# for i in range(299):
#     for j in range(299):
#         picture = y_value.readline()
#         img[i][j] = int(picture)
# ima  = Image.fromarray(img,"L")
# ima.save("lena_gray.jpg")


# gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
# while True:
#     cv2.imshow("ironman_gray.jpg",gray)
#     cv2.imshow("gray_hdl.jpg",img)
#     k = cv2.waitKey(10)
#     if k == 27:
#         break


cv2.destroyAllWindows()