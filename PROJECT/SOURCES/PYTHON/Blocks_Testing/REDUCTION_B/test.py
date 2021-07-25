import struct

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

count = 0
haha = open("haha.txt", "r")
convert = [0]*(10)
for i in range(10):
    convert[i] = float_to_bin(float(haha.readline()))
    boom = ".kernel_0" + str(count) + "(32'b" + str(convert[i]) +"),"
    if (count >= 8):
        count = 0
    else:
        count += 1
    print(boom)