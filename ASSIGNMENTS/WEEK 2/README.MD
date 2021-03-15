# 1. Setup Environment
## Install Modelsim on Ubuntu
[Download the newest version on official website of Altera](https://fpgasoftware.intel.com/?edition=pro&platform=linux&product=modelsim_ae#tabs-2)
# 2. Color Conversion
## Color Conversion Algorithms: We choose to converse RGB to Gray
[Color Conversion Algorithms](https://docs.opencv.org/3.4/de/d25/imgproc_color_conversions.html)
## Schematic for Verilog HDL
![RGB to GRAY Schematic](https://user-images.githubusercontent.com/79905379/111170254-50cc6480-85d6-11eb-936a-c5eaa095cda9.png)
## Python code for Gray color value of the picture
```python
import numpy as np
from PIL import Image

img = np.asarray(Image.open(("perry.jpg")))

def grayscale(image):
    weight = np.array([0.3,0.59,0.11])
    m,n,c = image.shape
    temp = (np.dot(image,weight)).reshape(m*n)
    return temp

temp = grayscale(img)
print(grayscale(img))
print("So luong pixel cua anh la: ", len(temp))
```
## Python code for color conversion RGB->Gray
```python
from PIL import Image
img = Image.open('perry.jpg')
pixels = img.load()

new_img = Image.new(img.mode, img.size)
pixels_new = new_img.load()
for i in range (new_img.size[0]):
    for j in range(new_img.size[1]):
        r,g,b = pixels[i,j]
        avg = int(round((r + g + b) / 3))
        pixels_new[i,j] = (avg, avg, avg, 0)
new_img.show()
```
