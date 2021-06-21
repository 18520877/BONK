import struct

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

#print(float_to_bin(-0.332546))

test = open("weight_fp.txt", "r")
test1 = open("weight_bin.txt", "w")
convert = [0]*(900)
for i in range(900):
    convert[i] = float_to_bin(float(test.readline()))
test1.write("\n".join(map(str,convert)))
test1.close()