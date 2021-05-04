import cv2
from PIL import Image
import numpy as np

output_float = open ("gray_float.txt","r")
output_dec = open("output_deci_original.txt","w")
lines = (output_float.readlines())
convert =[]
for line in lines:
    convert.append(int(float(line)))
output_dec.write("\n".join(map(str,convert)))
output_dec.close()

output_deci = open ("output_deci_original.txt","r")
output_bin = open("output_bin.txt","w")
lines = (output_deci.readlines())
convert =[]
for line in lines:
    convert.append(bin(int(line))[2:])
output_bin.write("\n".join(map(str,convert)))
output_bin.close()
