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
