# 1. Setup Environment
## Install Modelsim on Ubuntu
[Download the newest version on official website of Altera](https://fpgasoftware.intel.com/?edition=pro&platform=linux&product=modelsim_ae#tabs-2)
# 2. Color Conversion
## Color Conversion Algorithms: We choose to converse RGB to Gray
[Color Conversion Algorithms](https://docs.opencv.org/3.4/de/d25/imgproc_color_conversions.html)
## Schematic for Verilog HDL
![RGB to GRAY Schematic](https://user-images.githubusercontent.com/79905379/111170254-50cc6480-85d6-11eb-936a-c5eaa095cda9.png)
## Python code
```python
import cv2
from PIL import Image
import numpy as np

im = cv2.imread("ironman.jpg")

r,g,b = im[:,:,0], im[:,:,1] ,im[:,:,2]


with open("red.txt","w") as red:
        temp = r.reshape((r.shape[0]*r.shape[1]))
        result =[]
        for i in temp:
                result.append(np.binary_repr(i, width=8))
        red.write("\n".join(result))
        red.close()
with open("green.txt","w") as green:
        temp = g.reshape((g.shape[0]*g.shape[1]))
        result =[]
        for i in temp:
                result.append(np.binary_repr(i, width=8))
        green.write("\n".join(result))
        green.close()
with open("blue.txt","w") as blue:
        temp = b.reshape((b.shape[0]*b.shape[1]))
        result =[]
        for i in temp:
                result.append(np.binary_repr(i, width=8))
        blue.write("\n".join(result))
        blue.close()



gray = cv2.cvtColor(im, cv2.COLOR_BGR2GRAY)
while True:
        cv2.imshow("",gray)
        k = cv2.waitKey(10)
        if k == 27:  # press ESC to exit 
                break
cv2.destroyAllWindows()
```
