# 1. Setup Environment
## Install Modelsim on Ubuntu
[Download the newest version on official website of Altera](https://fpgasoftware.intel.com/?edition=pro&platform=linux&product=modelsim_ae#tabs-2)
# 2. Color Conversion
## Color Conversion Algorithms: We choose to converse RGB to Gray
[Color Conversion Algorithms](https://docs.opencv.org/3.4/de/d25/imgproc_color_conversions.html)
## Schematic for Verilog HDL
![ex1](https://user-images.githubusercontent.com/79905379/111014620-2cef0000-83d7-11eb-86ab-132a63acaafc.png)
## Python code for color conversion
import numpy as np
from PIL import Image

img = np.asarray(Image.open(("avengers.jpg")))

def grayscale(image):
    weight = np.array([0.3,0.59,0.11])
    m,n,c = image.shape
    temp = np.round(np.dot(image,weight)).reshape(m*n)
    return temp

temp = grayscale(img)
print(grayscale(img))
