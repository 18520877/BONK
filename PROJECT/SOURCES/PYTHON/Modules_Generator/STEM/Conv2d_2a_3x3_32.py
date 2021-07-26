# import struct

# def float_to_bin(num):
#     return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

# count = 0
# count1 = 1
# count4 = 2
# hoho = open("Conv2d_2a_3x3_kernel.txt", "r")
# haha = open("Conv2d_2a_3x3_32.txt", "w")
# convert = [0]*(9216)
# string = [""]*(9216)
# string1 = [""]*(9216)
# string2 = [""]*(9216)

# for i in range (9216):
#         convert[i] = float_to_bin(float(hoho.readline()))
#         string1[i] = "//Channel " + str(count1+1) + "\n" +"conv_33 #(D, DATA_WIDTH) x" + str(count1+1) + "(.clk(clk), .reset(reset), .valid_in(valid_in_" + str(count4)+ "), .pxl_in(pxl_in_" + str(count4) + "),"
#         string[i] = ".kernel_0" + str(count) + "(32'b" + str(convert[i]) + "),"
#         string2[i] = "\n" + ".pxl_out(pxl_out_" + str(count1) + "), .valid_out(valid_out_" + str(count1) +") );" + "\n" + "\n"
#         if (count == 8):
#             string[i] = string[i] + string2[i] + string1[i]
#             count = 0
#             count1 += 1
#             if (count4 == 32):
#                 count4 = 1
#             else:
#                 count4 += 1
#         else:
#             count += 1

# haha.write("\n".join(map(str,string)))
# haha.close()

string6 = [""] * (1024)
count2 = 1
gen = open("pxl_tmp.txt", "w")
for i in range(1024):
    string6[i] = "tmp_pxl_out_" + str(count2) + ", "
    if (count2 % 9 == 0):
        string6[i] = string6[i] + "\n"
    else:
        string6[i] = string6[i]
    count2 += 1
gen.write("".join(map(str,string6)))
gen.close()

string7 = [""] * (1024)
count3 = 1
genn = open("valid_tmp.txt", "w")
for i in range(1024):
    string7[i] = "tmp_valid_out_" + str(count3) + ", "
    if (count3 % 9 == 0):
        string7[i] = string7[i] + "\n"
    else:
        string7[i] = string7[i]
    count3 += 1
genn.write("".join(map(str,string7)))
genn.close()

# countt = 1
# count = 1
# count4 = 1
# hihi = open("gen_adder.txt", "w")
# string1 = [""]*(1024)
# string2 = [""]*(1024)
# string3 = [""]*(1024)
# string4 = [""]*(1024)
# string5 = [""]*(1024)
# string6 = [""]*(1024)
# for i in range(1024):
#     string3[i] = ".valid_in_" + str(countt) + "(valid_in_" + str(count4) +"), "
#     string2[i] = ".pxl_out_" + str(count) + "(pxl_out_" + str(count) + "), .valid_out_" + str(count) + "(valid_out_" + str(count) + ") );" + "\n" + "\n"
#     string4[i] = "add_32layers#(D, DATA_WIDTH) x" + str(count+1) + "(.clk(clk), .reset(reset), " + "\n"
#     # if(count4 % 6 == 0):
#     #     string3[i] = string3[i] + "\n"
#     #     count4 += 1
#     for j in range(1024):
#         string1[j] = ".pxl_in_" + str(countt) +"(pxl_in_" + str(count4) +"), "
#     string3[i] = string3[i] + string1[i]
#     if(count4 % 32 == 0):
#         string3[i] = string3[i] + string2[i] + string4[i]
#         count4 += 1
#         count += 1
#         countt = 1
#     else:
#         count4 += 1
#         countt += 1

# hihi.write("".join(map(str,string3)))
# hihi.close()