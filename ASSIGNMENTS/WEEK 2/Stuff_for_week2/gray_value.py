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
