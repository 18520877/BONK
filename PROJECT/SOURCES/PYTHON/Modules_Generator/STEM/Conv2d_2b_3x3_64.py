# import struct

# def float_to_bin(num):
#     return format(struct.unpack('!I', struct.pack('!f', num))[0], '032b')

# count = 0
# count1 = 1
# count4 = 2
# hoho = open("Conv2d_2b_3x3_kernel.txt", "r")
# haha = open("Conv2d_2b_3x3_64.txt", "w")
# convert = [0]*(18432)
# string = [""]*(18432)
# string1 = [""]*(18432)
# string2 = [""]*(18432)

# for i in range (18432):
#         convert[i] = float_to_bin(float(hoho.readline()))
#         string1[i] = "//Channel " + str(count1+1) + "\n" +"conv_33_p #(D, DATA_WIDTH) x" + str(count1+1) + "(.clk(clk), .reset(reset), .valid_in(valid_in_" + str(count4)+ "), .pxl_in(pxl_in_" + str(count4) + "),"
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