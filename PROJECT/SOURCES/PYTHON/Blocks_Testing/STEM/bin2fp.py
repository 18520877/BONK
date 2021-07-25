import struct

def bin_2_float(num):
    return format(struct.unpack('f', struct.pack('I', num))[0])


pyy = open("output_stem_32bit.txt", "r")
count1 = 0
data = pyy.read()
data1 = data.split("\n")
for j in data1:
    if j:
        count1 += 1

test = open("output_stem_32bit.txt", "r")
test1 = open("output_stem_verilog.txt", "w")
convert = [0]*(count1)
for i in range(count1):
    convert[i] = bin_2_float(int(test.readline(), 2))
test1.write("\n".join(map(str,convert)))
test1.close()