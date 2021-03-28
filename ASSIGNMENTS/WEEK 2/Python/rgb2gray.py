import cv2
from PIL import Image
import numpy as np

im = cv2.imread("ironman.jpg")

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
        gray_valuee =[0.0]*(240*360)
        for i in range(76800):
            gray_valuee[i] = 0.299*temp_r[i] + 0.578*temp_g[i] + 0.114*temp_b[i]
        gray_value.write("\n".join(map(str,gray_valuee)))
        gray_value.close()

gray_bin = open("gray_bin.txt","r")
gray_dec = open("gray_deci.txt","w")
convert =[0]*(240*360)
for i in range(76800):
    convert[i] = int((gray_bin.readline()),2)
gray_dec.write("\n".join(map(str,convert)))
gray_dec.close()

gray_fl=open("gray_float.txt","r")
gray_de=open("gray_deci.txt","r")
error =  open("error.txt","w")
errorr =[0.0]*(240*360)
for i in range(76800):
    gray_fl_value = float((gray_fl.readline()))
    gray_de_value = int((gray_de.readline()))
    errorr[i] = gray_fl_value - gray_de_value
error.write("\n".join(map(str,errorr)))
error.close()


img = np.zeros((360,240),dtype=np.uint8)
y_value = open ("gray_deci.txt","r")
for i in range(360):
    for j in range(240):
        picture = y_value.readline()
        img[i][j] = int(picture)
ima  = Image.fromarray(img,"L")
ima.save("gray_hdl.jpg")


gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
while True:
    cv2.imshow("ironman_gray.jpg",gray)
    cv2.imshow("gray_hdl.jpg",img)
    k = cv2.waitKey(10)
    if k == 27:
        break


cv2.destroyAllWindows()
