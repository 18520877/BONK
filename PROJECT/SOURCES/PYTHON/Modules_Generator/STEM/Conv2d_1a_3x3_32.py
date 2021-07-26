import struct
import numpy as np

def float_to_bin(num):
    return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

count = 0
count1 = 1
count4 = 2
hoho = open("Conv2d_1a_3x3_kernel.txt", "r")
haha = open("Conv2d_1a_3x3_32.txt", "w")
convert = [0]*(864)
string = [""]*(864)
string1 = [""]*(864)
string2 = [""]*(864)

for i in range (864):
        convert[i] = float_to_bin(float(hoho.readline()))
        string1[i] = "//Channel " + str(count1+1) + "\n" +"conv_33_s2 #(D, DATA_WIDTH) x" + str(count1+1) + "(.clk(clk), .reset(reset), .valid_in(valid_in_" + str(count4)+ "), .pxl_in(pxl_in_" + str(count4) + "),"
        string[i] = ".kernel_0" + str(count) + "(32'b" + str(convert[i]) + "),"
        string2[i] = "\n" + ".pxl_out(pxl_out_" + str(count1) + "), .valid_out(valid_out_" + str(count1) +") );" + "\n" + "\n"
        if (count == 8):
            string[i] = string[i] + string2[i] + string1[i]
            count = 0
            count1 += 1
            if (count4 == 3):
                count4 = 1
            else:
                count4 += 1
        else:
            count += 1

haha.write("\n".join(map(str,string)))
haha.close()

# countt = 1
# countt1 = 1
# count4 = 1
# hihi = open("gen_adder.txt", "w")
# string3 = [""]*(864)
# string4 = [""]*(864)
# string5 = [""]*(864)
# for i in range(32):
#     string4[i] = ".valid_in_" + str(count4) + "(valid_in_" + str(countt1) + ")," + "\n" + ".valid_in_" + str(count4+1) + "(valid_in_" + str(countt1+1) + ")," + "\n" + ".valid_in_" + str(count4+2) + "(valid_in_" + str(countt1+2) + ")," + "\n"
#     string5[i] = ".pxl_in_" + str(count4) + "(pxl_in_" + str(countt1) + ")," + "\n" + ".pxl_in_" + str(count4+1) + "(pxl_in_" + str(countt1+1) + ")," + "\n" + ".pxl_in_" + str(count4+2) + "(pxl_in_" + str(countt1+2) + ")," + "\n"
#     string3[i] = string4[i] + string5[i] + ".pxl_out(pxl_out_" + str(countt) + ")," + "\n" + ".valid_out(valid_out_" + str(countt) +") );" + "\n" +"\n" + "add_3layers #(D, data_width) uut1" + str((countt+1)) +"(.clk(clk, .reset(reset)," + "\n"
#     countt += 1
#     countt1 += 3
# hihi.write("".join(map(str,string3)))
# hihi.close()

# string6 = [""] * (96)
# count2 = 1
# gen = open("pxl_in.txt", "w")
# for i in range(96):
#     string6[i] = "pxl_in_" + str(count2) + ","
#     if (count2 % 9 == 0):
#         string6[i] = string6[i] + "\n"
#     else:
#         string6[i] = string6[i]
#     count2 += 1
# gen.write("".join(map(str,string6)))
# gen.close()

# string7 = [""] * (96)
# count3 = 1
# genn = open("valid_in.txt", "w")
# for i in range(96):
#     string7[i] = "valid_in_" + str(count3) + ","
#     if (count3 % 9 == 0):
#         string7[i] = string7[i] + "\n"
#     else:
#         string7[i] = string7[i]
#     count3 += 1
# genn.write("".join(map(str,string7)))
# genn.close()

# string7 = [""] * (96)
# count3 = 1
# genn = open("tmp_valid_out.txt", "w")
# for i in range(96):
#     string7[i] = "tmp_valid_out_" + str(count3) + ","
#     if (count3 % 9 == 0):
#         string7[i] = string7[i] + "\n"
#     else:
#         string7[i] = string7[i]
#     count3 += 1
# genn.write("".join(map(str,string7)))
# genn.close()

# data = np.load('Conv2d_2b_3x3_kernel.npy')
# print(np.shape(data))