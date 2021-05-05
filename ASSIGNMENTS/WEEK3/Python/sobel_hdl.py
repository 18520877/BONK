import cv2
from PIL import Image
import numpy as np

output = open ("output_Mx.txt","r")
output_dec = open("output_deci.txt","w")
lines = (output.readlines())
convert =[]
for line in lines:
    convert.append(int(line,2))
output_dec.write("\n".join(map(str,convert)))
output_dec.close()

img = np.zeros((218,218),dtype=np.uint8)
y_value = open ("output_deci.txt","r")
for i in range(218):
    for j in range(218):
        picture = y_value.readline()
        img[i][j] = int(picture)
ima  = Image.fromarray(img,"L")
ima.save("sobel_hdl_Mx.jpg")

while True:
    cv2.imshow("sobel_hdl_Mx.jpg",img)
    k = cv2.waitKey(10)
    if k == 27:
        break

cv2.destroyAllWindows()
