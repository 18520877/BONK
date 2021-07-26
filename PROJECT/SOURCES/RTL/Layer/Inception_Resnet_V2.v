module Inception_Resnet_V2
#(
  parameter DATA_WIDTH = 32
)
(  
  input clk, reset, valid_in,
  input [DATA_WIDTH-1:0] pxl_in,
  
  //x
   kernel_00_x0_x, kernel_01_x0_x, kernel_02_x0_x,
	 kernel_03_x0_x, kernel_04_x0_x, kernel_05_x0_x,
	 kernel_06_x0_x, kernel_07_x0_x, kernel_08_x0_x,
	
	 kernel_00_x1_x, kernel_01_x1_x, kernel_02_x1_x,
	 kernel_03_x1_x, kernel_04_x1_x, kernel_05_x1_x,
	 kernel_06_x1_x, kernel_07_x1_x, kernel_08_x1_x, 
	
	 kernel_00_x2_x, kernel_01_x2_x, kernel_02_x2_x,
	 kernel_03_x2_x, kernel_04_x2_x, kernel_05_x2_x,
	 kernel_06_x2_x, kernel_07_x2_x, kernel_08_x2_x,
	 
	 kernel_00_x4_x,
		
	 kernel_00_x5_x, kernel_01_x5_x, kernel_02_x5_x,
	 kernel_03_x5_x, kernel_04_x5_x, kernel_05_x5_x,
	 kernel_06_x5_x, kernel_07_x5_x, kernel_08_x5_x,
	 
	//x0
                  kernel_00_x0_x0,
	
                  kernel_00_x1_x0, kernel_01_x1_x0, kernel_02_x1_x0,
	                kernel_03_x1_x0, kernel_04_x1_x0, kernel_05_x1_x0,
	                kernel_06_x1_x0, kernel_07_x1_x0, kernel_08_x1_x0, 
	
	                kernel_00_x2_x0, kernel_01_x2_x0, kernel_02_x2_x0,
	                kernel_03_x2_x0, kernel_04_x2_x0, kernel_05_x2_x0,
	                kernel_06_x2_x0, kernel_07_x2_x0, kernel_08_x2_x0,
	 
                	 kernel_00_x3_x0,
	
	                kernel_00_x4_x0, kernel_01_x4_x0, kernel_02_x4_x0, kernel_03_x4_x0, kernel_04_x4_x0, 
	                kernel_05_x4_x0, kernel_06_x4_x0, kernel_07_x4_x0, kernel_08_x4_x0, kernel_09_x4_x0,
	                kernel_10_x4_x0, kernel_11_x4_x0, kernel_12_x4_x0, kernel_13_x4_x0, kernel_14_x4_x0, 
	                kernel_15_x4_x0, kernel_16_x4_x0, kernel_17_x4_x0, kernel_18_x4_x0, kernel_19_x4_x0,	
	                kernel_20_x4_x0, kernel_21_x4_x0, kernel_22_x4_x0, kernel_23_x4_x0, kernel_24_x4_x0,
	
	                kernel_00_x5_x0,
	
	                kernel_00_x7_x0,
	                
	  //x1                              
    kernel_00_x0_x1,
	
	  kernel_00_x1_x1, 
	
	  kernel_00_x2_x1, kernel_01_x2_x1, kernel_02_x2_x1,
	  kernel_03_x2_x1, kernel_04_x2_x1, kernel_05_x2_x1,
	  kernel_06_x2_x1, kernel_07_x2_x1, kernel_08_x2_x1,
	 
	  kernel_00_x3_x1,
		
	  kernel_00_x4_x1, kernel_01_x4_x1, kernel_02_x4_x1,  
	  kernel_03_x4_x1, kernel_04_x4_x1, kernel_05_x4_x1, 
	  kernel_06_x4_x1, kernel_07_x4_x1, kernel_08_x4_x1, 
		
	  kernel_00_x5_x1, kernel_01_x5_x1, kernel_02_x5_x1,
	  kernel_03_x5_x1, kernel_04_x5_x1, kernel_05_x5_x1,
	  kernel_06_x5_x1, kernel_07_x5_x1, kernel_08_x5_x1,
	 
	  kernel_00_x7_x1,
	  
	  //2	                 
    kernel_00_x0_x2,
	
	  kernel_00_x1_x2, 
	
	  kernel_00_x2_x2, kernel_01_x2_x2, kernel_02_x2_x2,
	  kernel_03_x2_x2, kernel_04_x2_x2, kernel_05_x2_x2,
	  kernel_06_x2_x2, kernel_07_x2_x2, kernel_08_x2_x2,
	 
	  kernel_00_x3_x2,
		
	  kernel_00_x4_x2, kernel_01_x4_x2, kernel_02_x4_x2,  
	  kernel_03_x4_x2, kernel_04_x4_x2, kernel_05_x4_x2, 
	  kernel_06_x4_x2, kernel_07_x4_x2, kernel_08_x4_x2, 
		
	  kernel_00_x5_x2, kernel_01_x5_x2, kernel_02_x5_x2,
	  kernel_03_x5_x2, kernel_04_x5_x2, kernel_05_x5_x2,
	  kernel_06_x5_x2, kernel_07_x5_x2, kernel_08_x5_x2,
	 
	  kernel_00_x7_x2,
	                             
    kernel_00_x0_x3,
	
	  kernel_00_x1_x3, 
	
	  kernel_00_x2_x3, kernel_01_x2_x3, kernel_02_x2_x3,
	  kernel_03_x2_x3, kernel_04_x2_x3, kernel_05_x2_x3,
	  kernel_06_x2_x3, kernel_07_x2_x3, kernel_08_x2_x3,
	 
	  kernel_00_x3_x3,
		
	  kernel_00_x4_x3, kernel_01_x4_x3, kernel_02_x4_x3,  
	  kernel_03_x4_x3, kernel_04_x4_x3, kernel_05_x4_x3, 
	  kernel_06_x4_x3, kernel_07_x4_x3, kernel_08_x4_x3, 
		
	  kernel_00_x5_x3, kernel_01_x5_x3, kernel_02_x5_x3,
	  kernel_03_x5_x3, kernel_04_x5_x3, kernel_05_x5_x3,
	  kernel_06_x5_x3, kernel_07_x5_x3, kernel_08_x5_x3,
	 
	  kernel_00_x7_x3,
	                             
    kernel_00_x0_x4,
	
	  kernel_00_x1_x4, 
	
	  kernel_00_x2_x4, kernel_01_x2_x4, kernel_02_x2_x4,
	  kernel_03_x2_x4, kernel_04_x2_x4, kernel_05_x2_x4,
	  kernel_06_x2_x4, kernel_07_x2_x4, kernel_08_x2_x4,
	 
	  kernel_00_x3_x4,
		
	  kernel_00_x4_x4, kernel_01_x4_x4, kernel_02_x4_x4,  
	  kernel_03_x4_x4, kernel_04_x4_x4, kernel_05_x4_x4, 
	  kernel_06_x4_x4, kernel_07_x4_x4, kernel_08_x4_x4, 
		
	  kernel_00_x5_x4, kernel_01_x5_x4, kernel_02_x5_x4,
	  kernel_03_x5_x4, kernel_04_x5_x4, kernel_05_x5_x4,
	  kernel_06_x5_x4, kernel_07_x5_x4, kernel_08_x5_x4,
	 
	  kernel_00_x7_x4,
	                             
    kernel_00_x0_x5,
	
	  kernel_00_x1_x5, 
	
	  kernel_00_x2_x5, kernel_01_x2_x5, kernel_02_x2_x5,
	  kernel_03_x2_x5, kernel_04_x2_x5, kernel_05_x2_x5,
	  kernel_06_x2_x5, kernel_07_x2_x5, kernel_08_x2_x5,
	 
	  kernel_00_x3_x5,
		
	  kernel_00_x4_x5, kernel_01_x4_x5, kernel_02_x4_x5,  
	  kernel_03_x4_x5, kernel_04_x4_x5, kernel_05_x4_x5, 
	  kernel_06_x4_x5, kernel_07_x4_x5, kernel_08_x4_x5, 
		
	  kernel_00_x5_x5, kernel_01_x5_x5, kernel_02_x5_x5,
	  kernel_03_x5_x5, kernel_04_x5_x5, kernel_05_x5_x5,
	  kernel_06_x5_x5, kernel_07_x5_x5, kernel_08_x5_x5,
	 
	  kernel_00_x7_x5,
	                              
    kernel_00_x0_x6,
	
	  kernel_00_x1_x6, 
	
	  kernel_00_x2_x6, kernel_01_x2_x6, kernel_02_x2_x6,
	  kernel_03_x2_x6, kernel_04_x2_x6, kernel_05_x2_x6,
	  kernel_06_x2_x6, kernel_07_x2_x6, kernel_08_x2_x6,
	 
	  kernel_00_x3_x6,
		
	  kernel_00_x4_x6, kernel_01_x4_x6, kernel_02_x4_x6,  
	  kernel_03_x4_x6, kernel_04_x4_x6, kernel_05_x4_x6, 
	  kernel_06_x4_x6, kernel_07_x4_x6, kernel_08_x4_x6, 
		
	  kernel_00_x5_x6, kernel_01_x5_x6, kernel_02_x5_x6,
	  kernel_03_x5_x6, kernel_04_x5_x6, kernel_05_x5_x6,
	  kernel_06_x5_x6, kernel_07_x5_x6, kernel_08_x5_x6,
	 
	  kernel_00_x7_x6,
	                             
    kernel_00_x0_x7,
	
	  kernel_00_x1_x7, 
	
	  kernel_00_x2_x7, kernel_01_x2_x7, kernel_02_x2_x7,
	  kernel_03_x2_x7, kernel_04_x2_x7, kernel_05_x2_x7,
	  kernel_06_x2_x7, kernel_07_x2_x7, kernel_08_x2_x7,
	 
	  kernel_00_x3_x7,
		
	  kernel_00_x4_x7, kernel_01_x4_x7, kernel_02_x4_x7,  
	  kernel_03_x4_x7, kernel_04_x4_x7, kernel_05_x4_x7, 
	  kernel_06_x4_x7, kernel_07_x4_x7, kernel_08_x4_x7, 
		
	  kernel_00_x5_x7, kernel_01_x5_x7, kernel_02_x5_x7,
	  kernel_03_x5_x7, kernel_04_x5_x7, kernel_05_x5_x7,
	  kernel_06_x5_x7, kernel_07_x5_x7, kernel_08_x5_x7,
	 
	  kernel_00_x7_x7,
	                            
    kernel_00_x0_x8,
	
	  kernel_00_x1_x8, 
	
	  kernel_00_x2_x8, kernel_01_x2_x8, kernel_02_x2_x8,
	  kernel_03_x2_x8, kernel_04_x2_x8, kernel_05_x2_x8,
	  kernel_06_x2_x8, kernel_07_x2_x8, kernel_08_x2_x8,
	 
	  kernel_00_x3_x8,
		
	  kernel_00_x4_x8, kernel_01_x4_x8, kernel_02_x4_x8,  
	  kernel_03_x4_x8, kernel_04_x4_x8, kernel_05_x4_x8, 
	  kernel_06_x4_x8, kernel_07_x4_x8, kernel_08_x4_x8, 
		
	  kernel_00_x5_x8, kernel_01_x5_x8, kernel_02_x5_x8,
	  kernel_03_x5_x8, kernel_04_x5_x8, kernel_05_x5_x8,
	  kernel_06_x5_x8, kernel_07_x5_x8, kernel_08_x5_x8,
	 
	  kernel_00_x7_x8,
	                             
    kernel_00_x0_x9,
	
	  kernel_00_x1_x9, 
	
	  kernel_00_x2_x9, kernel_01_x2_x9, kernel_02_x2_x9,
	  kernel_03_x2_x9, kernel_04_x2_x9, kernel_05_x2_x9,
	  kernel_06_x2_x9, kernel_07_x2_x9, kernel_08_x2_x9,
	 
	  kernel_00_x3_x9,
		
	  kernel_00_x4_x9, kernel_01_x4_x9, kernel_02_x4_x9,  
	  kernel_03_x4_x9, kernel_04_x4_x9, kernel_05_x4_x9, 
	  kernel_06_x4_x9, kernel_07_x4_x9, kernel_08_x4_x9, 
		
	  kernel_00_x5_x9, kernel_01_x5_x9, kernel_02_x5_x9,
	  kernel_03_x5_x9, kernel_04_x5_x9, kernel_05_x5_x9,
	  kernel_06_x5_x9, kernel_07_x5_x9, kernel_08_x5_x9,
	 
	  kernel_00_x7_x9,
	                             
    kernel_00_x0_x10,
	
	  kernel_00_x1_x10, 
	
	  kernel_00_x2_x10, kernel_01_x2_x10, kernel_02_x2_x10,
	  kernel_03_x2_x10, kernel_04_x2_x10, kernel_05_x2_x10,
	  kernel_06_x2_x10, kernel_07_x2_x10, kernel_08_x2_x10,
	 
	  kernel_00_x3_x10,
		
	  kernel_00_x4_x10, kernel_01_x4_x10, kernel_02_x4_x10,  
	  kernel_03_x4_x10, kernel_04_x4_x10, kernel_05_x4_x10, 
	  kernel_06_x4_x10, kernel_07_x4_x10, kernel_08_x4_x10, 
		
	  kernel_00_x5_x10, kernel_01_x5_x10, kernel_02_x5_x10,
	  kernel_03_x5_x10, kernel_04_x5_x10, kernel_05_x5_x10,
	  kernel_06_x5_x10, kernel_07_x5_x10, kernel_08_x5_x10,
	 
	  kernel_00_x7_x10,
	                 
   kernel_00_x1_x11, kernel_01_x1_x11, kernel_02_x1_x11,
	 kernel_03_x1_x11, kernel_04_x1_x11, kernel_05_x1_x11,
	 kernel_06_x1_x11, kernel_07_x1_x11, kernel_08_x1_x11, 
	
	 kernel_00_x2_x11,
	 
	 kernel_00_x3_x11, kernel_01_x3_x11, kernel_02_x3_x11,
	 kernel_03_x3_x11, kernel_04_x3_x11, kernel_05_x3_x11,
	 kernel_06_x3_x11, kernel_07_x3_x11, kernel_08_x3_x11,	
	
	 kernel_00_x4_x11, kernel_01_x4_x11, kernel_02_x4_x11,  
	 kernel_03_x4_x11, kernel_04_x4_x11, kernel_05_x4_x11, 
	 kernel_06_x4_x11, kernel_07_x4_x11, kernel_08_x4_x11,
	               
   kernel_00_x0_y1,
	
	 kernel_00_x1_y1, 
	
	 kernel_00_x2_y1, kernel_01_x2_y1, kernel_02_x2_y1, kernel_03_x2_y1, kernel_04_x2_y1, kernel_05_x2_y1, kernel_06_x2_y1,
	 
	 kernel_00_x3_y1, kernel_03_x3_y1, kernel_06_x3_y1, kernel_09_x3_y1, kernel_12_x3_y1, kernel_15_x3_y1, kernel_18_x3_y1,
		
	 kernel_00_x5_y1,
                        
   kernel_00_x0_y2,
	
	 kernel_00_x1_y2, 
	
	 kernel_00_x2_y2, kernel_01_x2_y2, kernel_02_x2_y2, kernel_03_x2_y2, kernel_04_x2_y2, kernel_05_x2_y2, kernel_06_x2_y2,
	 
	 kernel_00_x3_y2, kernel_03_x3_y2, kernel_06_x3_y2, kernel_09_x3_y2, kernel_12_x3_y2, kernel_15_x3_y2, kernel_18_x3_y2,
		
	 kernel_00_x5_y2,
	                    
   kernel_00_x0_y3,
	
	 kernel_00_x1_y3, 
	
	 kernel_00_x2_y3, kernel_01_x2_y3, kernel_02_x2_y3, kernel_03_x2_y3, kernel_04_x2_y3, kernel_05_x2_y3, kernel_06_x2_y3,
	 
	 kernel_00_x3_y3, kernel_03_x3_y3, kernel_06_x3_y3, kernel_09_x3_y3, kernel_12_x3_y3, kernel_15_x3_y3, kernel_18_x3_y3,
		
	 kernel_00_x5_y3,
	                    
   kernel_00_x0_y4,
	
	 kernel_00_x1_y4, 
	
	 kernel_00_x2_y4, kernel_01_x2_y4, kernel_02_x2_y4, kernel_03_x2_y4, kernel_04_x2_y4, kernel_05_x2_y4, kernel_06_x2_y4,
	 
	 kernel_00_x3_y4, kernel_03_x3_y4, kernel_06_x3_y4, kernel_09_x3_y4, kernel_12_x3_y4, kernel_15_x3_y4, kernel_18_x3_y4,
		
	 kernel_00_x5_y4,
	                    
   kernel_00_x0_y5,
	
	 kernel_00_x1_y5, 
	
	 kernel_00_x2_y5, kernel_01_x2_y5, kernel_02_x2_y5, kernel_03_x2_y5, kernel_04_x2_y5, kernel_05_x2_y5, kernel_06_x2_y5,
	 
	 kernel_00_x3_y5, kernel_03_x3_y5, kernel_06_x3_y5, kernel_09_x3_y5, kernel_12_x3_y5, kernel_15_x3_y5, kernel_18_x3_y5,
		
	 kernel_00_x5_y5,
	                      
   kernel_00_x0_y6,
	
	 kernel_00_x1_y6, 
	
	 kernel_00_x2_y6, kernel_01_x2_y6, kernel_02_x2_y6, kernel_03_x2_y6, kernel_04_x2_y6, kernel_05_x2_y6, kernel_06_x2_y6,
	 
	 kernel_00_x3_y6, kernel_03_x3_y6, kernel_06_x3_y6, kernel_09_x3_y6, kernel_12_x3_y6, kernel_15_x3_y6, kernel_18_x3_y6,
		
	 kernel_00_x5_y6,
	                    
   kernel_00_x0_y7,
	
	 kernel_00_x1_y7, 
	
	 kernel_00_x2_y7, kernel_01_x2_y7, kernel_02_x2_y7, kernel_03_x2_y7, kernel_04_x2_y7, kernel_05_x2_y7, kernel_06_x2_y7,
	 
	 kernel_00_x3_y7, kernel_03_x3_y7, kernel_06_x3_y7, kernel_09_x3_y7, kernel_12_x3_y7, kernel_15_x3_y7, kernel_18_x3_y7,
		
	 kernel_00_x5_y7,
	                    
   kernel_00_x0_y8,
	
	 kernel_00_x1_y8, 
	
	 kernel_00_x2_y8, kernel_01_x2_y8, kernel_02_x2_y8, kernel_03_x2_y8, kernel_04_x2_y8, kernel_05_x2_y8, kernel_06_x2_y8,
	 
	 kernel_00_x3_y8, kernel_03_x3_y8, kernel_06_x3_y8, kernel_09_x3_y8, kernel_12_x3_y8, kernel_15_x3_y8, kernel_18_x3_y8,
		
	 kernel_00_x5_y8,
	                    
   kernel_00_x0_y9,
	
	 kernel_00_x1_y9, 
	
	 kernel_00_x2_y9, kernel_01_x2_y9, kernel_02_x2_y9, kernel_03_x2_y9, kernel_04_x2_y9, kernel_05_x2_y9, kernel_06_x2_y9,
	 
	 kernel_00_x3_y9, kernel_03_x3_y9, kernel_06_x3_y9, kernel_09_x3_y9, kernel_12_x3_y9, kernel_15_x3_y9, kernel_18_x3_y9,
		
	 kernel_00_x5_y9,
	                     
   kernel_00_x0_y10,
	
	 kernel_00_x1_y10, 
	
	 kernel_00_x2_y10, kernel_01_x2_y10, kernel_02_x2_y10, kernel_03_x2_y10, kernel_04_x2_y10, kernel_05_x2_y10, kernel_06_x2_y10,
	 
	 kernel_00_x3_y10, kernel_03_x3_y10, kernel_06_x3_y10, kernel_09_x3_y10, kernel_12_x3_y10, kernel_15_x3_y10, kernel_18_x3_y10,
		
	 kernel_00_x5_y10,
	                  
   kernel_00_x0_y11,
	
	 kernel_00_x1_y11, 
	
	 kernel_00_x2_y11, kernel_01_x2_y11, kernel_02_x2_y11, kernel_03_x2_y11, kernel_04_x2_y11, kernel_05_x2_y11, kernel_06_x2_y11,
	 
	 kernel_00_x3_y11, kernel_03_x3_y11, kernel_06_x3_y11, kernel_09_x3_y11, kernel_12_x3_y11, kernel_15_x3_y11, kernel_18_x3_y11,
		
	 kernel_00_x5_y11,
	                    
   kernel_00_x0_y12,
	
	 kernel_00_x1_y12, 
	
	 kernel_00_x2_y12, kernel_01_x2_y12, kernel_02_x2_y12, kernel_03_x2_y12, kernel_04_x2_y12, kernel_05_x2_y12, kernel_06_x2_y12,
	 
	 kernel_00_x3_y12, kernel_03_x3_y12, kernel_06_x3_y12, kernel_09_x3_y12, kernel_12_x3_y12, kernel_15_x3_y12, kernel_18_x3_y12,
		
	 kernel_00_x5_y12,
	                     
   kernel_00_x0_y13,
	
	 kernel_00_x1_y13, 
	
	 kernel_00_x2_y13, kernel_01_x2, kernel_02_x2, kernel_03_x2, kernel_04_x2, kernel_05_x2, kernel_06_x2,
	 
	 kernel_00_x3_y13, kernel_03_x3, kernel_06_x3, kernel_09_x3, kernel_12_x3, kernel_15_x3, kernel_18_x3,
		
	 kernel_00_x5_y13,
	                     
   kernel_00_x0_y14,
	
	 kernel_00_x1_y14, 
	
	 kernel_00_x2_y14, kernel_01_x2_y14, kernel_02_x2_y14, kernel_03_x2_y14, kernel_04_x2_y14, kernel_05_x2_y14, kernel_06_x2_y14,
	 
	 kernel_00_x3_y14, kernel_03_x3_y14, kernel_06_x3_y14, kernel_09_x3_y14, kernel_12_x3_y14, kernel_15_x3_y14, kernel_18_x3_y14,
		
	 kernel_00_x5_y14,
	                     
   kernel_00_x0_y15,
	
	 kernel_00_x1_y15, 
	
	 kernel_00_x2_y15, kernel_01_x2_y15, kernel_02_x2_y15, kernel_03_x2_y15, kernel_04_x2_y15, kernel_05_x2_y15, kernel_06_x2_y15,
	 
	 kernel_00_x3_y15, kernel_03_x3_y15, kernel_06_x3_y15, kernel_09_x3_y15, kernel_12_x3_y15, kernel_15_x3_y15, kernel_18_x3_y15,
		
	 kernel_00_x5_y15,
	                     
   kernel_00_x0_y16,
	
	 kernel_00_x1_y16, 
	
	 kernel_00_x2_y16, kernel_01_x2_y16, kernel_02_x2_y16, kernel_03_x2_y16, kernel_04_x2_y16, kernel_05_x2_y16, kernel_06_x2_y16,
	 
	 kernel_00_x3_y16, kernel_03_x3_y16, kernel_06_x3_y16, kernel_09_x3_y16, kernel_12_x3_y16, kernel_15_x3_y16, kernel_18_x3_y16,
		
	 kernel_00_x5_y16,
	                     
   kernel_00_x0_y17,
	
	 kernel_00_x1_y17, 
	
	 kernel_00_x2_y17, kernel_01_x2_y17, kernel_02_x2_y17, kernel_03_x2_y17, kernel_04_x2_y17, kernel_05_x2_y17, kernel_06_x2_y17,
	 
	 kernel_00_x3_y17, kernel_03_x3_y17, kernel_06_x3_y17, kernel_09_x3_y17, kernel_12_x3_y17, kernel_15_x3_y17, kernel_18_x3_y17,
		
	 kernel_00_x5_y17,
	                     
   kernel_00_x0_y18,
	
	 kernel_00_x1_y18, 
	
	 kernel_00_x2_y18, kernel_01_x2_y18, kernel_02_x2_y18, kernel_03_x2_y18, kernel_04_x2_y18, kernel_05_x2_y18, kernel_06_x2_y18,
	 
	 kernel_00_x3_y18, kernel_03_x3_y18, kernel_06_x3_y18, kernel_09_x3_y18, kernel_12_x3_y18, kernel_15_x3_y18, kernel_18_x3_y18,
		
	 kernel_00_x5_y18,
	                     
   kernel_00_x0_y19,
	
	 kernel_00_x1_y19, 
	
	 kernel_00_x2_y19, kernel_01_x2_y19, kernel_02_x2_y19, kernel_03_x2_y19, kernel_04_x2_y19, kernel_05_x2_y19, kernel_06_x2_y19,
	 
	 kernel_00_x3_y19, kernel_03_x_y193, kernel_06_x3_y19, kernel_09_x3_y19, kernel_12_x3_y19, kernel_15_x3_y19, kernel_18_x3_y19,
		
	 kernel_00_x5_y19,
	                     
   kernel_00_x0_y20,
	
	 kernel_00_x1_y20, 
	
	 kernel_00_x2_y20, kernel_01_x2_y20, kernel_02_x2_y20, kernel_03_x2_y20, kernel_04_x2_y20, kernel_05_x2_y20, kernel_06_x2_y20,
	 
	 kernel_00_x3_y20, kernel_03_x3_y20, kernel_06_x3_y20, kernel_09_x3_y20, kernel_12_x3_y20, kernel_15_x3_y20, kernel_18_x3_y20,
		
	 kernel_00_x5_y20,
	      	
	 kernel_00_x1_y21,
	
	 kernel_00_x2_y21, kernel_01_x2_y21, kernel_02_x2_y21,
	 kernel_03_x2_y21, kernel_04_x2_y21, kernel_05_x2_y21,
	 kernel_06_x2_y21, kernel_07_x2_y21, kernel_08_x2_y21,
	 
	 kernel_00_x3_y21,	
	
	 kernel_00_x4_y21, kernel_01_x4_y21, kernel_02_x4_y21,  
	 kernel_03_x4_y21, kernel_04_x4_y21, kernel_05_x4_y21, 
	 kernel_06_x4_y21, kernel_07_x4_y21, kernel_08_x4_y21, 
	
	 kernel_00_x5_y21,
		
	 kernel_00_x6_y21, kernel_01_x6_y21, kernel_02_x6_y21,  
	 kernel_03_x6_y21, kernel_04_x6_y21, kernel_05_x6_y21, 
	 kernel_06_x6_y21, kernel_07_x6_y21, kernel_08_x6_y21, 
			
	 kernel_00_x7_y21, kernel_01_x7_y21, kernel_02_x7_y21,  
	 kernel_03_x7_y21, kernel_04_x7_y21, kernel_05_x7_y21, 
	 kernel_06_x7_y21, kernel_07_x7_y21, kernel_08_x7_y21,
	     
   kernel_00_x0_z1,
	
	 kernel_00_x1_z1, 
	
	 kernel_00_x2_z1, kernel_01_x2_z1, kernel_02_x2_z1, 
	 
	 kernel_00_x3_z1, kernel_03_x3_z1, kernel_06_x3_z1,
		
	 kernel_00_x5_z1,
	               
   kernel_00_x0_z2,
	
	 kernel_00_x1_z2, 
	
	 kernel_00_x2_z2, kernel_01_x2_z2, kernel_02_x2_z2, 
	 
	 kernel_00_x3_z2, kernel_03_x3_z2, kernel_06_x3_z2,
		
	 kernel_00_x5_z2,
	              
   kernel_00_x0_z3,
	
	 kernel_00_x1_z3, 
	
	 kernel_00_x2_z3, kernel_01_x2_z3, kernel_02_x2_z3, 
	 
	 kernel_00_x3_z3, kernel_03_x3_z3, kernel_06_x3_z3,
		
	 kernel_00_x5_z3,
	              
   kernel_00_x0_z4,
	
	 kernel_00_x1_z4, 
	
	 kernel_00_x2_z4, kernel_01_x2_z4, kernel_02_x2_z4, 
	 
	 kernel_00_x3_z4, kernel_03_x3_z4, kernel_06_x3_z4,
		
	 kernel_00_x5_z4,
	              
   kernel_00_x0_z5,
	
	 kernel_00_x1_z5, 
	
	 kernel_00_x2_z5, kernel_01_x2_z5, kernel_02_x2_z5, 
	 
	 kernel_00_x3_z5, kernel_03_x3_z5, kernel_06_x3_z5,
		
	 kernel_00_x5_z5,
	               
   kernel_00_x0_z6,
	
	 kernel_00_x1_z6, 
	
	 kernel_00_x2_z6, kernel_01_x2_z6, kernel_02_x2_z6, 
	 
	 kernel_00_x3_z6, kernel_03_x3_z6, kernel_06_x3_z6,
		
	 kernel_00_x5_z6,
	              
   kernel_00_x0_z7,
	
	 kernel_00_x1_z7, 
	
	 kernel_00_x2_z7, kernel_01_x2_z7, kernel_02_x2_z7, 
	 
	 kernel_00_x3_z7, kernel_03_x3_z7, kernel_06_x3_z7,
		
	 kernel_00_x5_z7,
	              
   kernel_00_x0_z8,
	
	 kernel_00_x1_z8, 
	
	 kernel_00_x2_z8, kernel_01_x2_z8, kernel_02_x2_z8, 
	 
	 kernel_00_x3_z8, kernel_03_x3_z8, kernel_06_x3_z8,
		
	 kernel_00_x5_z8,
	              
   kernel_00_x0_z9,
	
	 kernel_00_x1_z9, 
	
	 kernel_00_x2_z9, kernel_01_x2_z9, kernel_02_x2_z9, 
	 
	 kernel_00_x3_z9, kernel_03_x3_z9, kernel_06_x3_z9,
		
	 kernel_00_x5_z9,
	              
   kernel_00_x0_z10,
	
	 kernel_00_x1_z10, 
	
	 kernel_00_x2_z10, kernel_01_x2_z10, kernel_02_x2_z10, 
	 
	 kernel_00_x3_z10, kernel_03_x3_z10, kernel_06_x3_z10,
		
	 kernel_00_x5_z10,

	kernel_00_a3,

  output [DATA_WIDTH-1:0] pxl_out,
  output valid_out
);  
  wire [DATA_WIDTH-1:0] out_stem, 
                        out_inA,
                        out_inA_1,
                        out_inA_2,
                        out_inA_3,
                        out_inA_4, 
                        out_inA_5, 
                        out_inA_6, 
                        out_inA_7, 
                        out_inA_8, 
                        out_inA_9, 
                        out_inA_10,
                        out_reA,  
                        out_inB_1,
                        out_inB_2,
                        out_inB_3,
                        out_inB_4, 
                        out_inB_5, 
                        out_inB_6, 
                        out_inB_7, 
                        out_inB_8, 
                        out_inB_9, 
                        out_inB_10,
                        out_inB_11,
                        out_inB_12,
                        out_inB_13,
                        out_inB_14, 
                        out_inB_15, 
                        out_inB_16, 
                        out_inB_17, 
                        out_inB_18, 
                        out_inB_19, 
                        out_inB_20,
                        out_reB,
                        out_inC_1,
                        out_inC_2,
                        out_inC_3,
                        out_inC_4, 
                        out_inC_5, 
                        out_inC_6, 
                        out_inC_7, 
                        out_inC_8, 
                        out_inC_9, 
                        out_inC_10,
                        out_avg,
                        out_conv_11,
                        out_relu;
                        
                   wire valid_stem, 
                        valid_inA,
                        valid_inA_1,
                        valid_inA_2,
                        valid_inA_3,
                        valid_inA_4, 
                        valid_inA_5, 
                        valid_inA_6, 
                        valid_inA_7, 
                        valid_inA_8, 
                        valid_inA_9, 
                        valid_inA_10,
                        valid_reA,  
                        valid_inB_1,
                        valid_inB_2,
                        valid_inB_3,
                        valid_inB_4, 
                        valid_inB_5, 
                        valid_inB_6, 
                        valid_inB_7, 
                        valid_inB_8, 
                        valid_inB_9, 
                        valid_inB_10,
                        valid_inB_11,
                        valid_inB_12,
                        valid_inB_13,
                        valid_inB_14, 
                        valid_inB_15, 
                        valid_inB_16, 
                        valid_inB_17, 
                        valid_inB_18, 
                        valid_inB_19, 
                        valid_inB_20,
                        valid_reB,
                        valid_inC_1,
                        valid_inC_2,
                        valid_inC_3,
                        valid_inC_4, 
                        valid_inC_5, 
                        valid_inC_6, 
                        valid_inC_7, 
                        valid_inC_8, 
                        valid_inC_9, 
                        valid_inC_10,
                        valid_avg,
                        valid_conv_11,
                        valid_relu;  
                        
//Stem 299x299x3 -> 35x35x192
  Stem x( 
                  .clk(clk),
                  .reset(reset),
                  .valid_in(valid_in),
                  .pxl_in(pxl_in),
                  .kernel_00_x0(kernel_00_x0_x), .kernel_01_x0(kernel_01_x0_x), .kernel_02_x0(kernel_00_x0_x),
	                .kernel_03_x0(kernel_03_x0_x), .kernel_04_x0(kernel_04_x0_x), .kernel_05_x0(kernel_00_x0_x),
	                .kernel_06_x0(kernel_06_x0_x), .kernel_07_x0(kernel_07_x0_x), .kernel_08_x0(kernel_00_x0_x),
	
	                .kernel_00_x1(kernel_00_x1_x), .kernel_01_x1(kernel_01_x1_x), .kernel_02_x1(kernel_00_x0_x),
	                .kernel_03_x1(kernel_03_x1_x), .kernel_04_x1(kernel_04_x1_x), .kernel_05_x1(kernel_00_x0_x),
	                .kernel_06_x1(kernel_06_x1_x), .kernel_07_x1(kernel_07_x1_x), .kernel_08_x1(kernel_00_x0_x), 
	
	                .kernel_00_x2(kernel_00_x2_x), .kernel_01_x2(kernel_01_x2_x), .kernel_02_x2(kernel_00_x0_x),
	                .kernel_03_x2(kernel_03_x2_x), .kernel_04_x2(kernel_04_x2_x), .kernel_05_x2(kernel_00_x0_x),
	                .kernel_06_x2(kernel_06_x2_x), .kernel_07_x2(kernel_07_x2_x), .kernel_08_x2(kernel_00_x0_x),
	 
	                .kernel_00_x4(kernel_00_x4_x),
		
	                .kernel_00_x5(kernel_00_x5_x), .kernel_01_x5(kernel_01_x5_x), .kernel_02_x5(kernel_02_x5_x),
	                .kernel_03_x5(kernel_03_x5_x), .kernel_04_x5(kernel_04_x5_x), .kernel_05_x5(kernel_05_x5_x),
	                .kernel_06_x5(kernel_06_x5_x), .kernel_07_x5(kernel_07_x5_x), .kernel_08_x5(kernel_08_x5_x),
	                
                  .pxl_out(out_stem),
                  .valid_out(valid_stem)
                  );
        
  //Inception_A  35x35x192 -> 35x35x320
  Inception_A x0( 
                  clk,
                  reset,
                  valid_stem,
                  out_stem,
                  
                  kernel_00_x0_x0,
	
	                kernel_00_x1_x0, kernel_01_x1_x0, kernel_02_x1_x0,
	                kernel_03_x1_x0, kernel_04_x1_x0, kernel_05_x1_x0,
	                kernel_06_x1_x0, kernel_07_x1_x0, kernel_08_x1_x0, 
	
	                kernel_00_x2_x0, kernel_01_x2_x0, kernel_02_x2_x0,
	                kernel_03_x2_x0, kernel_04_x2_x0, kernel_05_x2_x0,
	                kernel_06_x2_x0, kernel_07_x2_x0, kernel_08_x2_x0,
	 
                	 kernel_00_x3_x0,
	
	                kernel_00_x4_x0, kernel_01_x4_x0, kernel_02_x4_x0, kernel_03_x4_x0, kernel_04_x4_x0, 
	                kernel_05_x4_x0, kernel_06_x4_x0, kernel_07_x4_x0, kernel_08_x4_x0, kernel_09_x4_x0,
	                kernel_10_x4_x0, kernel_11_x4_x0, kernel_12_x4_x0, kernel_13_x4_x0, kernel_14_x4_x0, 
	                kernel_15_x4_x0, kernel_16_x4_x0, kernel_17_x4_x0, kernel_18_x4_x0, kernel_19_x4_x0,	
	                kernel_20_x4_x0, kernel_21_x4_x0, kernel_22_x4_x0, kernel_23_x4_x0, kernel_24_x4_x0,
	
	                kernel_00_x5_x0,
	
	                kernel_00_x7_x0,
	                
                  out_inA,
                  valid_inA
                  );
                  
    //Inception_Resnet_A 1 35x35x320 -> 35x35x320
  Inception_Resnet_A x1( 
                  clk,
                  reset,
                  valid_inA,
                  out_inA,
                    
    kernel_00_x0_x1,
	
	  kernel_00_x1_x1, 
	
	  kernel_00_x2_x1, kernel_01_x2_x1, kernel_02_x2_x1,
	  kernel_03_x2_x1, kernel_04_x2_x1, kernel_05_x2_x1,
	  kernel_06_x2_x1, kernel_07_x2_x1, kernel_08_x2_x1,
	 
	  kernel_00_x3_x1,
		
	  kernel_00_x4_x1, kernel_01_x4_x1, kernel_02_x4_x1,  
	  kernel_03_x4_x1, kernel_04_x4_x1, kernel_05_x4_x1, 
	  kernel_06_x4_x1, kernel_07_x4_x1, kernel_08_x4_x1, 
		
	  kernel_00_x5_x1, kernel_01_x5_x1, kernel_02_x5_x1,
	  kernel_03_x5_x1, kernel_04_x5_x1, kernel_05_x5_x1,
	  kernel_06_x5_x1, kernel_07_x5_x1, kernel_08_x5_x1,
	 
	  kernel_00_x7_x1,
	
                  out_inA_1,
                  valid_inA_1
                  );  
                               
     //Inception_Resnet_A 2 35x35x320 -> 35x35x320
  Inception_Resnet_A x2( 
                  clk,
                  reset,
                  valid_inA_1,
                  out_inA_1,
                  
    kernel_00_x0_x2,
	
	  kernel_00_x1_x2, 
	
	  kernel_00_x2_x2, kernel_01_x2_x2, kernel_02_x2_x2,
	  kernel_03_x2_x2, kernel_04_x2_x2, kernel_05_x2_x2,
	  kernel_06_x2_x2, kernel_07_x2_x2, kernel_08_x2_x2,
	 
	  kernel_00_x3_x2,
		
	  kernel_00_x4_x2, kernel_01_x4_x2, kernel_02_x4_x2,  
	  kernel_03_x4_x2, kernel_04_x4_x2, kernel_05_x4_x2, 
	  kernel_06_x4_x2, kernel_07_x4_x2, kernel_08_x4_x2, 
		
	  kernel_00_x5_x2, kernel_01_x5_x2, kernel_02_x5_x2,
	  kernel_03_x5_x2, kernel_04_x5_x2, kernel_05_x5_x2,
	  kernel_06_x5_x2, kernel_07_x5_x2, kernel_08_x5_x2,
	 
	  kernel_00_x7_x2,
	  
                  out_inA_2,
                  valid_inA_2
                  );
                                  
      //Inception_Resnet_A 3 35x35x320 -> 35x35x320
  Inception_Resnet_A x3( clk,
                  reset,
                  valid_inA_2,
                  out_inA_2,
                                
    kernel_00_x0_x3,
	
	  kernel_00_x1_x3, 
	
	  kernel_00_x2_x3, kernel_01_x2_x3, kernel_02_x2_x3,
	  kernel_03_x2_x3, kernel_04_x2_x3, kernel_05_x2_x3,
	  kernel_06_x2_x3, kernel_07_x2_x3, kernel_08_x2_x3,
	 
	  kernel_00_x3_x3,
		
	  kernel_00_x4_x3, kernel_01_x4_x3, kernel_02_x4_x3,  
	  kernel_03_x4_x3, kernel_04_x4_x3, kernel_05_x4_x3, 
	  kernel_06_x4_x3, kernel_07_x4_x3, kernel_08_x4_x3, 
		
	  kernel_00_x5_x3, kernel_01_x5_x3, kernel_02_x5_x3,
	  kernel_03_x5_x3, kernel_04_x5_x3, kernel_05_x5_x3,
	  kernel_06_x5_x3, kernel_07_x5_x3, kernel_08_x5_x3,
	 
	  kernel_00_x7_x3,
	  
                  out_inA_3,
                  valid_inA_3
                  );
                  
    //Inception_Resnet_A 4 35x35x320 -> 35x35x320
  Inception_Resnet_A x4( clk,
                  reset,
                  (valid_inA_3),
                  (out_inA_3),
                                
    kernel_00_x0_x4,
	
	  kernel_00_x1_x4, 
	
	  kernel_00_x2_x4, kernel_01_x2_x4, kernel_02_x2_x4,
	  kernel_03_x2_x4, kernel_04_x2_x4, kernel_05_x2_x4,
	  kernel_06_x2_x4, kernel_07_x2_x4, kernel_08_x2_x4,
	 
	  kernel_00_x3_x4,
		
	  kernel_00_x4_x4, kernel_01_x4_x4, kernel_02_x4_x4,  
	  kernel_03_x4_x4, kernel_04_x4_x4, kernel_05_x4_x4, 
	  kernel_06_x4_x4, kernel_07_x4_x4, kernel_08_x4_x4, 
		
	  kernel_00_x5_x4, kernel_01_x5_x4, kernel_02_x5_x4,
	  kernel_03_x5_x4, kernel_04_x5_x4, kernel_05_x5_x4,
	  kernel_06_x5_x4, kernel_07_x5_x4, kernel_08_x5_x4,
	 
	  kernel_00_x7_x4,
	  
                  (out_inA_4),
                  (valid_inA_4)
                  );           
      //Inception_Resnet_A 5 35x35x320 -> 35x35x320
  Inception_Resnet_A x5( clk,
                  reset,
                  (valid_inA_4),
                  (out_inA_4),

                                
    kernel_00_x0_x5,
	
	  kernel_00_x1_x5, 
	
	  kernel_00_x2_x5, kernel_01_x2_x5, kernel_02_x2_x5,
	  kernel_03_x2_x5, kernel_04_x2_x5, kernel_05_x2_x5,
	  kernel_06_x2_x5, kernel_07_x2_x5, kernel_08_x2_x5,
	 
	  kernel_00_x3_x5,
		
	  kernel_00_x4_x5, kernel_01_x4_x5, kernel_02_x4_x5,  
	  kernel_03_x4_x5, kernel_04_x4_x5, kernel_05_x4_x5, 
	  kernel_06_x4_x5, kernel_07_x4_x5, kernel_08_x4_x5, 
		
	  kernel_00_x5_x5, kernel_01_x5_x5, kernel_02_x5_x5,
	  kernel_03_x5_x5, kernel_04_x5_x5, kernel_05_x5_x5,
	  kernel_06_x5_x5, kernel_07_x5_x5, kernel_08_x5_x5,
	 
	  kernel_00_x7_x5,
	  
                  (out_inA_5),
                  (valid_inA_5)
                  );
                   
    
   //Inception_Resnet_A 6 35x35x320 -> 35x35x320
  Inception_Resnet_A x6( clk,
                  reset,
                  (valid_inA_5),
                  (out_inA_5),
                                
    kernel_00_x0_x6,
	
	  kernel_00_x1_x6, 
	
	  kernel_00_x2_x6, kernel_01_x2_x6, kernel_02_x2_x6,
	  kernel_03_x2_x6, kernel_04_x2_x6, kernel_05_x2_x6,
	  kernel_06_x2_x6, kernel_07_x2_x6, kernel_08_x2_x6,
	 
	  kernel_00_x3_x6,
		
	  kernel_00_x4_x6, kernel_01_x4_x6, kernel_02_x4_x6,  
	  kernel_03_x4_x6, kernel_04_x4_x6, kernel_05_x4_x6, 
	  kernel_06_x4_x6, kernel_07_x4_x6, kernel_08_x4_x6, 
		
	  kernel_00_x5_x6, kernel_01_x5_x6, kernel_02_x5_x6,
	  kernel_03_x5_x6, kernel_04_x5_x6, kernel_05_x5_x6,
	  kernel_06_x5_x6, kernel_07_x5_x6, kernel_08_x5_x6,
	 
	  kernel_00_x7_x6,
	  
                  (out_inA_6),
                  (valid_inA_6)
                  );   
                              
   
     //Inception_Resnet_A 7 35x35x320 -> 35x35x320
  Inception_Resnet_A x7( clk,
                  reset,
                  (valid_inA_6),
                  (out_inA_6),
                                
    kernel_00_x0_x7,
	
	  kernel_00_x1_x7, 
	
	  kernel_00_x2_x7, kernel_01_x2_x7, kernel_02_x2_x7,
	  kernel_03_x2_x7, kernel_04_x2_x7, kernel_05_x2_x7,
	  kernel_06_x2_x7, kernel_07_x2_x7, kernel_08_x2_x7,
	 
	  kernel_00_x3_x7,
		
	  kernel_00_x4_x7, kernel_01_x4_x7, kernel_02_x4_x7,  
	  kernel_03_x4_x7, kernel_04_x4_x7, kernel_05_x4_x7, 
	  kernel_06_x4_x7, kernel_07_x4_x7, kernel_08_x4_x7, 
		
	  kernel_00_x5_x7, kernel_01_x5_x7, kernel_02_x5_x7,
	  kernel_03_x5_x7, kernel_04_x5_x7, kernel_05_x5_x7,
	  kernel_06_x5_x7, kernel_07_x5_x7, kernel_08_x5_x7,
	 
	  kernel_00_x7_x7,
	  
                  (out_inA_7),
                  (valid_inA_7)
                  );
  
      //Inception_Resnet_A 8 35x35x320 -> 35x35x320
  Inception_Resnet_A x8( clk,
                  reset,
                  (valid_inA_7),
                  (out_inA_7),
                                
    kernel_00_x0_x8,
	
	  kernel_00_x1_x8, 
	
	  kernel_00_x2_x8, kernel_01_x2_x8, kernel_02_x2_x8,
	  kernel_03_x2_x8, kernel_04_x2_x8, kernel_05_x2_x8,
	  kernel_06_x2_x8, kernel_07_x2_x8, kernel_08_x2_x8,
	 
	  kernel_00_x3_x8,
		
	  kernel_00_x4_x8, kernel_01_x4_x8, kernel_02_x4_x8,  
	  kernel_03_x4_x8, kernel_04_x4_x8, kernel_05_x4_x8, 
	  kernel_06_x4_x8, kernel_07_x4_x8, kernel_08_x4_x8, 
		
	  kernel_00_x5_x8, kernel_01_x5_x8, kernel_02_x5_x8,
	  kernel_03_x5_x8, kernel_04_x5_x8, kernel_05_x5_x8,
	  kernel_06_x5_x8, kernel_07_x5_x8, kernel_08_x5_x8,
	 
	  kernel_00_x7_x8,
	  
                  (out_inA_8),
                  (valid_inA_8)
                  );
                  
     //Inception_Resnet_A 9 35x35x320 -> 35x35x320
  Inception_Resnet_A x9( clk,
                  reset,
                  (valid_inA_8),
                  (out_inA_8),
                                
    kernel_00_x0_x9,
	
	  kernel_00_x1_x9, 
	
	  kernel_00_x2_x9, kernel_01_x2_x9, kernel_02_x2_x9,
	  kernel_03_x2_x9, kernel_04_x2_x9, kernel_05_x2_x9,
	  kernel_06_x2_x9, kernel_07_x2_x9, kernel_08_x2_x9,
	 
	  kernel_00_x3_x9,
		
	  kernel_00_x4_x9, kernel_01_x4_x9, kernel_02_x4_x9,  
	  kernel_03_x4_x9, kernel_04_x4_x9, kernel_05_x4_x9, 
	  kernel_06_x4_x9, kernel_07_x4_x9, kernel_08_x4_x9, 
		
	  kernel_00_x5_x9, kernel_01_x5_x9, kernel_02_x5_x9,
	  kernel_03_x5_x9, kernel_04_x5_x9, kernel_05_x5_x9,
	  kernel_06_x5_x9, kernel_07_x5_x9, kernel_08_x5_x9,
	 
	  kernel_00_x7_x9,
	  
                  (out_inA_9),
                  (valid_inA_9)
                  );
                  
   //Inception_Resnet_A 10 35x35x320 -> 35x35x320
  Inception_Resnet_A x10( clk,
                  reset,
                  (valid_inA_9),
                  (out_inA_9),
                                
    kernel_00_x0_x10,
	
	  kernel_00_x1_x10, 
	
	  kernel_00_x2_x10, kernel_01_x2_x10, kernel_02_x2_x10,
	  kernel_03_x2_x10, kernel_04_x2_x10, kernel_05_x2_x10,
	  kernel_06_x2_x10, kernel_07_x2_x10, kernel_08_x2_x10,
	 
	  kernel_00_x3_x10,
		
	  kernel_00_x4_x10, kernel_01_x4_x10, kernel_02_x4_x10,  
	  kernel_03_x4_x10, kernel_04_x4_x10, kernel_05_x4_x10, 
	  kernel_06_x4_x10, kernel_07_x4_x10, kernel_08_x4_x10, 
		
	  kernel_00_x5_x10, kernel_01_x5_x10, kernel_02_x5_x10,
	  kernel_03_x5_x10, kernel_04_x5_x10, kernel_05_x5_x10,
	  kernel_06_x5_x10, kernel_07_x5_x10, kernel_08_x5_x10,
	 
	  kernel_00_x7_x10,
	  
                  (out_inA_10),
                  (valid_inA_10)
                  ); 
                                
   //Reduction_A 35x35x320 ? 17x17x1088
  Reduction_A x11( clk,
                  reset,
                  (valid_inA_10),
                  (out_inA_10),
                  
   kernel_00_x1_x11, kernel_01_x1_x11, kernel_02_x1_x11,
	 kernel_03_x1_x11, kernel_04_x1_x11, kernel_05_x1_x11,
	 kernel_06_x1_x11, kernel_07_x1_x11, kernel_08_x1_x11, 
	
	 kernel_00_x2_x11,
	 
	 kernel_00_x3_x11, kernel_01_x3_x11, kernel_02_x3_x11,
	 kernel_03_x3_x11, kernel_04_x3_x11, kernel_05_x3_x11,
	 kernel_06_x3_x11, kernel_07_x3_x11, kernel_08_x3_x11,	
	
	 kernel_00_x4_x11, kernel_01_x4_x11, kernel_02_x4_x11,  
	 kernel_03_x4_x11, kernel_04_x4_x11, kernel_05_x4_x11, 
	 kernel_06_x4_x11, kernel_07_x4_x11, kernel_08_x4_x11,
	 
                  (out_reA),
                  (valid_reA)
                  );
                  
    //Inception_Resnet_B 1 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y1( clk,
                  reset,
                  (valid_reA),
                  (out_reA),
                  
   kernel_00_x0_y1,
	
	 kernel_00_x1_y1, 
	
	 kernel_00_x2_y1, kernel_01_x2_y1, kernel_02_x2_y1, kernel_03_x2_y1, kernel_04_x2_y1, kernel_05_x2_y1, kernel_06_x2_y1,
	 
	 kernel_00_x3_y1, kernel_03_x3_y1, kernel_06_x3_y1, kernel_09_x3_y1, kernel_12_x3_y1, kernel_15_x3_y1, kernel_18_x3_y1,
		
	 kernel_00_x5_y1,
	
                  (out_inB_1),
                  (valid_inB_1)
                  );
                  
     //Inception_Resnet_B 2 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y2( clk,
                  reset,
                  (valid_inB_1),
                  (out_inB_1),
                        
   kernel_00_x0_y2,
	
	 kernel_00_x1_y2, 
	
	 kernel_00_x2_y2, kernel_01_x2_y2, kernel_02_x2_y2, kernel_03_x2_y2, kernel_04_x2_y2, kernel_05_x2_y2, kernel_06_x2_y2,
	 
	 kernel_00_x3_y2, kernel_03_x3_y2, kernel_06_x3_y2, kernel_09_x3_y2, kernel_12_x3_y2, kernel_15_x3_y2, kernel_18_x3_y2,
		
	 kernel_00_x5_y2,
	
                  (out_inB_2),
                  (valid_inB_2)
                  );                
      //Inception_Resnet_B 3 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y3( clk,
                  reset,
                  (valid_inB_2),
                  (out_inB_2),
                        
   kernel_00_x0_y3,
	
	 kernel_00_x1_y3, 
	
	 kernel_00_x2_y3, kernel_01_x2_y3, kernel_02_x2_y3, kernel_03_x2_y3, kernel_04_x2_y3, kernel_05_x2_y3, kernel_06_x2_y3,
	 
	 kernel_00_x3_y3, kernel_03_x3_y3, kernel_06_x3_y3, kernel_09_x3_y3, kernel_12_x3_y3, kernel_15_x3_y3, kernel_18_x3_y3,
		
	 kernel_00_x5_y3,
	
                  (out_inB_3),
                  (valid_inB_3)
                  );
                  
    //Inception_Resnet_B 4 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y4( clk,
                  reset,
                  (valid_inB_3),
                  (out_inB_3),
                        
   kernel_00_x0_y4,
	
	 kernel_00_x1_y4, 
	
	 kernel_00_x2_y4, kernel_01_x2_y4, kernel_02_x2_y4, kernel_03_x2_y4, kernel_04_x2_y4, kernel_05_x2_y4, kernel_06_x2_y4,
	 
	 kernel_00_x3_y4, kernel_03_x3_y4, kernel_06_x3_y4, kernel_09_x3_y4, kernel_12_x3_y4, kernel_15_x3_y4, kernel_18_x3_y4,
		
	 kernel_00_x5_y4,
	
                  (out_inB_4),
                  (valid_inB_4)
                  );           
      //Inception_Resnet_B 5 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y5( clk,
                  reset,
                  (valid_inB_4),
                  (out_inB_4),
                        
   kernel_00_x0_y5,
	
	 kernel_00_x1_y5, 
	
	 kernel_00_x2_y5, kernel_01_x2_y5, kernel_02_x2_y5, kernel_03_x2_y5, kernel_04_x2_y5, kernel_05_x2_y5, kernel_06_x2_y5,
	 
	 kernel_00_x3_y5, kernel_03_x3_y5, kernel_06_x3_y5, kernel_09_x3_y5, kernel_12_x3_y5, kernel_15_x3_y5, kernel_18_x3_y5,
		
	 kernel_00_x5_y5,
	
                  (out_inB_5),
                  (valid_inB_5)
                  );
                   
    
   //Inception_Resnet_B 6 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y6( clk,
                  reset,
                  (valid_inB_5),
                  (out_inB_5),
                        
   kernel_00_x0_y6,
	
	 kernel_00_x1_y6, 
	
	 kernel_00_x2_y6, kernel_01_x2_y6, kernel_02_x2_y6, kernel_03_x2_y6, kernel_04_x2_y6, kernel_05_x2_y6, kernel_06_x2_y6,
	 
	 kernel_00_x3_y6, kernel_03_x3_y6, kernel_06_x3_y6, kernel_09_x3_y6, kernel_12_x3_y6, kernel_15_x3_y6, kernel_18_x3_y6,
		
	 kernel_00_x5_y6,
	
                  (out_inB_6),
                  (valid_inB_6)
                  );   
                              
   
     //Inception_Resnet_B 7 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y7( clk,
                  reset,
                  (valid_inB_6),
                  (out_inB_6),
                        
   kernel_00_x0_y7,
	
	 kernel_00_x1_y7, 
	
	 kernel_00_x2_y7, kernel_01_x2_y7, kernel_02_x2_y7, kernel_03_x2_y7, kernel_04_x2_y7, kernel_05_x2_y7, kernel_06_x2_y7,
	 
	 kernel_00_x3_y7, kernel_03_x3_y7, kernel_06_x3_y7, kernel_09_x3_y7, kernel_12_x3_y7, kernel_15_x3_y7, kernel_18_x3_y7,
		
	 kernel_00_x5_y7,
	
                  (out_inB_7),
                  (valid_inB_7)
                  );
  
      //Inception_Resnet_B 8 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y8( clk,
                  reset,
                  (valid_inB_7),
                  (out_inB_7),
                        
   kernel_00_x0_y8,
	
	 kernel_00_x1_y8, 
	
	 kernel_00_x2_y8, kernel_01_x2_y8, kernel_02_x2_y8, kernel_03_x2_y8, kernel_04_x2_y8, kernel_05_x2_y8, kernel_06_x2_y8,
	 
	 kernel_00_x3_y8, kernel_03_x3_y8, kernel_06_x3_y8, kernel_09_x3_y8, kernel_12_x3_y8, kernel_15_x3_y8, kernel_18_x3_y8,
		
	 kernel_00_x5_y8,
	
                  (out_inB_8),
                  (valid_inB_8)
                  );
                  
     //Inception_Resnet_B 9 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y9( clk,
                  reset,
                  (valid_inB_8),
                  (out_inB_8),
                        
   kernel_00_x0_y9,
	
	 kernel_00_x1_y9, 
	
	 kernel_00_x2_y9, kernel_01_x2_y9, kernel_02_x2_y9, kernel_03_x2_y9, kernel_04_x2_y9, kernel_05_x2_y9, kernel_06_x2_y9,
	 
	 kernel_00_x3_y9, kernel_03_x3_y9, kernel_06_x3_y9, kernel_09_x3_y9, kernel_12_x3_y9, kernel_15_x3_y9, kernel_18_x3_y9,
		
	 kernel_00_x5_y9,
	
                  (out_inB_9),
                  (valid_inB_9)
                  );
                  
   //Inception_Resnet_B 10 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y10( clk,
                  reset,
                  (valid_inB_9),
                  (out_inB_9),
                        
   kernel_00_x0_y10,
	
	 kernel_00_x1_y10, 
	
	 kernel_00_x2_y10, kernel_01_x2_y10, kernel_02_x2_y10, kernel_03_x2_y10, kernel_04_x2_y10, kernel_05_x2_y10, kernel_06_x2_y10,
	 
	 kernel_00_x3_y10, kernel_03_x3_y10, kernel_06_x3_y10, kernel_09_x3_y10, kernel_12_x3_y10, kernel_15_x3_y10, kernel_18_x3_y10,
		
	 kernel_00_x5_y10,
	
                  (out_inB_10),
                  (valid_inB_10)
                  );
                  
  //Inception_Resnet_B 11 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y11( clk,
                  reset,
                  (valid_inB_10),
                  (out_inB_10),
                        
   kernel_00_x0_y11,
	
	 kernel_00_x1_y11, 
	
	 kernel_00_x2_y11, kernel_01_x2_y11, kernel_02_x2_y11, kernel_03_x2_y11, kernel_04_x2_y11, kernel_05_x2_y11, kernel_06_x2_y11,
	 
	 kernel_00_x3_y11, kernel_03_x3_y11, kernel_06_x3_y11, kernel_09_x3_y11, kernel_12_x3_y11, kernel_15_x3_y11, kernel_18_x3_y11,
		
	 kernel_00_x5_y11,
	
                  (out_inB_11),
                  (valid_inB_11)
                  );
                  
     //Inception_Resnet_B 12 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y12( clk,
                  reset,
                  (valid_inB_11),
                  (out_inB_11),
                        
   kernel_00_x0_y12,
	
	 kernel_00_x1_y12, 
	
	 kernel_00_x2_y12, kernel_01_x2_y12, kernel_02_x2_y12, kernel_03_x2_y12, kernel_04_x2_y12, kernel_05_x2_y12, kernel_06_x2_y12,
	 
	 kernel_00_x3_y12, kernel_03_x3_y12, kernel_06_x3_y12, kernel_09_x3_y12, kernel_12_x3_y12, kernel_15_x3_y12, kernel_18_x3_y12,
		
	 kernel_00_x5_y12,
	
                  (out_inB_12),
                  (valid_inB_12)
                  ); 
                                 
      //Inception_Resnet_B 13 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y13( clk,
                  reset,
                  (valid_inB_12),
                  (out_inB_12),
                        
   kernel_00_x0_y13,
	
	 kernel_00_x1_y13, 
	
	 kernel_00_x2_y13, kernel_01_x2, kernel_02_x2, kernel_03_x2, kernel_04_x2, kernel_05_x2, kernel_06_x2,
	 
	 kernel_00_x3_y13, kernel_03_x3, kernel_06_x3, kernel_09_x3, kernel_12_x3, kernel_15_x3, kernel_18_x3,
		
	 kernel_00_x5_y13,
	
                  (out_inB_13),
                  (valid_inB_13)
                  );
                  
    //Inception_Resnet_B 14 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y14( clk,
                  reset,
                  (valid_inB_13),
                  (out_inB_13),
                        
   kernel_00_x0_y14,
	
	 kernel_00_x1_y14, 
	
	 kernel_00_x2_y14, kernel_01_x2_y14, kernel_02_x2_y14, kernel_03_x2_y14, kernel_04_x2_y14, kernel_05_x2_y14, kernel_06_x2_y14,
	 
	 kernel_00_x3_y14, kernel_03_x3_y14, kernel_06_x3_y14, kernel_09_x3_y14, kernel_12_x3_y14, kernel_15_x3_y14, kernel_18_x3_y14,
		
	 kernel_00_x5_y14,
	
                  (out_inB_14),
                  (valid_inB_14)
                  );  
                           
      //Inception_Resnet_B 15 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y15( clk,
                  reset,
                  (valid_inB_14),
                  (out_inB_14),
                        
   kernel_00_x0_y15,
	
	 kernel_00_x1_y15, 
	
	 kernel_00_x2_y15, kernel_01_x2_y15, kernel_02_x2_y15, kernel_03_x2_y15, kernel_04_x2_y15, kernel_05_x2_y15, kernel_06_x2_y15,
	 
	 kernel_00_x3_y15, kernel_03_x3_y15, kernel_06_x3_y15, kernel_09_x3_y15, kernel_12_x3_y15, kernel_15_x3_y15, kernel_18_x3_y15,
		
	 kernel_00_x5_y15,
	
                  (out_inB_15),
                  (valid_inB_15)
                  );
                   
    
   //Inception_Resnet_B 16 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y16( clk,
                  reset,
                  (valid_inB_15),
                  (out_inB_15),
                        
   kernel_00_x0_y16,
	
	 kernel_00_x1_y16, 
	
	 kernel_00_x2_y16, kernel_01_x2_y16, kernel_02_x2_y16, kernel_03_x2_y16, kernel_04_x2_y16, kernel_05_x2_y16, kernel_06_x2_y16,
	 
	 kernel_00_x3_y16, kernel_03_x3_y16, kernel_06_x3_y16, kernel_09_x3_y16, kernel_12_x3_y16, kernel_15_x3_y16, kernel_18_x3_y16,
		
	 kernel_00_x5_y16,
	
                  (out_inB_16),
                  (valid_inB_16)
                  );   
                              
   
     //Inception_Resnet_B 17 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y17( clk,
                  reset,
                  (valid_inB_16),
                  (out_inB_16),
                        
   kernel_00_x0_y17,
	
	 kernel_00_x1_y17, 
	
	 kernel_00_x2_y17, kernel_01_x2_y17, kernel_02_x2_y17, kernel_03_x2_y17, kernel_04_x2_y17, kernel_05_x2_y17, kernel_06_x2_y17,
	 
	 kernel_00_x3_y17, kernel_03_x3_y17, kernel_06_x3_y17, kernel_09_x3_y17, kernel_12_x3_y17, kernel_15_x3_y17, kernel_18_x3_y17,
		
	 kernel_00_x5_y17,
	
                  (out_inB_17),
                  (valid_inB_17)
                  );
  
      //Inception_Resnet_B 18 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y18( clk,
                  reset,
                  (valid_inB_17),
                  (out_inB_17),
                        
   kernel_00_x0_y18,
	
	 kernel_00_x1_y18, 
	
	 kernel_00_x2_y18, kernel_01_x2_y18, kernel_02_x2_y18, kernel_03_x2_y18, kernel_04_x2_y18, kernel_05_x2_y18, kernel_06_x2_y18,
	 
	 kernel_00_x3_y18, kernel_03_x3_y18, kernel_06_x3_y18, kernel_09_x3_y18, kernel_12_x3_y18, kernel_15_x3_y18, kernel_18_x3_y18,
		
	 kernel_00_x5_y18,
	
                  (out_inB_18),
                  (valid_inB_18)
                  );
                  
     //Inception_Resnet_B 19 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y19( clk,
                  reset,
                  (valid_inB_18),
                  (out_inB_18),
                        
   kernel_00_x0_y19,
	
	 kernel_00_x1_y19, 
	
	 kernel_00_x2_y19, kernel_01_x2_y19, kernel_02_x2_y19, kernel_03_x2_y19, kernel_04_x2_y19, kernel_05_x2_y19, kernel_06_x2_y19,
	 
	 kernel_00_x3_y19, kernel_03_x_y193, kernel_06_x3_y19, kernel_09_x3_y19, kernel_12_x3_y19, kernel_15_x3_y19, kernel_18_x3_y19,
		
	 kernel_00_x5_y19,
	
                  (out_inB_19),
                  (valid_inB_19)
                  );
                  
   //Inception_Resnet_B 20 17x17x1088 ? 17x17x1088
  Inception_Resnet_B y20( clk,
                  reset,
                  (valid_inB_19),
                  (out_inB_19),
                        
   kernel_00_x0_y20,
	
	 kernel_00_x1_y20, 
	
	 kernel_00_x2_y20, kernel_01_x2_y20, kernel_02_x2_y20, kernel_03_x2_y20, kernel_04_x2_y20, kernel_05_x2_y20, kernel_06_x2_y20,
	 
	 kernel_00_x3_y20, kernel_03_x3_y20, kernel_06_x3_y20, kernel_09_x3_y20, kernel_12_x3_y20, kernel_15_x3_y20, kernel_18_x3_y20,
		
	 kernel_00_x5_y20,
	
                  (out_inB_20),
                  (valid_inB_20)
                  );
                  
  //Reduction_B 17x17x1088 ? 8x8x2080
  Reduction_B y21( clk,
                  reset,
                  (valid_inB_20),
                  (out_inB_20),
          	
	 kernel_00_x1_y21,
	
	 kernel_00_x2_y21, kernel_01_x2_y21, kernel_02_x2_y21,
	 kernel_03_x2_y21, kernel_04_x2_y21, kernel_05_x2_y21,
	 kernel_06_x2_y21, kernel_07_x2_y21, kernel_08_x2_y21,
	 
	 kernel_00_x3_y21,	
	
	 kernel_00_x4_y21, kernel_01_x4_y21, kernel_02_x4_y21,  
	 kernel_03_x4_y21, kernel_04_x4_y21, kernel_05_x4_y21, 
	 kernel_06_x4_y21, kernel_07_x4_y21, kernel_08_x4_y21, 
	
	 kernel_00_x5_y21,
		
	 kernel_00_x6_y21, kernel_01_x6_y21, kernel_02_x6_y21,  
	 kernel_03_x6_y21, kernel_04_x6_y21, kernel_05_x6_y21, 
	 kernel_06_x6_y21, kernel_07_x6_y21, kernel_08_x6_y21, 
			
	 kernel_00_x7_y21, kernel_01_x7_y21, kernel_02_x7_y21,  
	 kernel_03_x7_y21, kernel_04_x7_y21, kernel_05_x7_y21, 
	 kernel_06_x7_y21, kernel_07_x7_y21, kernel_08_x7_y21,
	
                  (out_reB),
                  (valid_reB)
                  );
                  
 //Inception_Resnet_C 1 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z1( clk,
                  reset,
                  (valid_reB),
                  (out_reB),
        
   kernel_00_x0_z1,
	
	 kernel_00_x1_z1, 
	
	 kernel_00_x2_z1, kernel_01_x2_z1, kernel_02_x2_z1, 
	 
	 kernel_00_x3_z1, kernel_03_x3_z1, kernel_06_x3_z1,
		
	 kernel_00_x5_z1,
	
                  (out_inC_1),
                  (valid_inC_1)
                  );
                  
     //Inception_Resnet_C 2 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z2( clk,
                  reset,
                  (valid_inC_1),
                  (out_inC_1),
                  
   kernel_00_x0_z2,
	
	 kernel_00_x1_z2, 
	
	 kernel_00_x2_z2, kernel_01_x2_z2, kernel_02_x2_z2, 
	 
	 kernel_00_x3_z2, kernel_03_x3_z2, kernel_06_x3_z2,
		
	 kernel_00_x5_z2,
	
                  (out_inC_2),
                  (valid_inC_2)
                  );   
                               
      //Inception_Resnet_C 3 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z3( clk,
                  reset,
                  (valid_inC_2),
                  (out_inC_2),
                  
   kernel_00_x0_z3,
	
	 kernel_00_x1_z3, 
	
	 kernel_00_x2_z3, kernel_01_x2_z3, kernel_02_x2_z3, 
	 
	 kernel_00_x3_z3, kernel_03_x3_z3, kernel_06_x3_z3,
		
	 kernel_00_x5_z3,
	
                  (out_inC_3),
                  (valid_inC_3)
                  );
                  
    //Inception_Resnet_C 4 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z4( clk,
                  reset,
                  (valid_inC_3),
                  (out_inC_3),
                  
   kernel_00_x0_z4,
	
	 kernel_00_x1_z4, 
	
	 kernel_00_x2_z4, kernel_01_x2_z4, kernel_02_x2_z4, 
	 
	 kernel_00_x3_z4, kernel_03_x3_z4, kernel_06_x3_z4,
		
	 kernel_00_x5_z4,
	
                  (out_inC_4),
                  (valid_inC_4)
                  );
                             
      //Inception_Resnet_C 5 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z5( clk,
                  reset,
                  (valid_inC_4),
                  (out_inC_4),
                  
   kernel_00_x0_z5,
	
	 kernel_00_x1_z5, 
	
	 kernel_00_x2_z5, kernel_01_x2_z5, kernel_02_x2_z5, 
	 
	 kernel_00_x3_z5, kernel_03_x3_z5, kernel_06_x3_z5,
		
	 kernel_00_x5_z5,
	
                  (out_inC_5),
                  (valid_inC_5)
                  );
                   
    
   //Inception_Resnet_C 6 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z6( clk,
                  reset,
                  (valid_inC_5),
                  (out_inC_5),
                  
   kernel_00_x0_z6,
	
	 kernel_00_x1_z6, 
	
	 kernel_00_x2_z6, kernel_01_x2_z6, kernel_02_x2_z6, 
	 
	 kernel_00_x3_z6, kernel_03_x3_z6, kernel_06_x3_z6,
		
	 kernel_00_x5_z6,
	
                  (out_inC_6),
                  (valid_inC_6)
                  );   
                              
   
     //Inception_Resnet_C 7 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z7( clk,
                  reset,
                  (valid_inC_6),
                  (out_inC_6),
                  
   kernel_00_x0_z7,
	
	 kernel_00_x1_z7, 
	
	 kernel_00_x2_z7, kernel_01_x2_z7, kernel_02_x2_z7, 
	 
	 kernel_00_x3_z7, kernel_03_x3_z7, kernel_06_x3_z7,
		
	 kernel_00_x5_z7,
	
                  (out_inC_7),
                  (valid_inC_7)
                  );
  
      //Inception_Resnet_C 8 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z8( clk,
                  reset,
                  valid_inC_7,
                  out_inC_7,
                  
   kernel_00_x0_z8,
	
	 kernel_00_x1_z8, 
	
	 kernel_00_x2_z8, kernel_01_x2_z8, kernel_02_x2_z8, 
	 
	 kernel_00_x3_z8, kernel_03_x3_z8, kernel_06_x3_z8,
		
	 kernel_00_x5_z8,
	
                  out_inC_8,
                  valid_inC_8
                  );
                  
     //Inception_Resnet_C 9 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z9( clk,
                  reset,
                  valid_inC_8,
                  out_inC_8,
                  
   kernel_00_x0_z9,
	
	 kernel_00_x1_z9, 
	
	 kernel_00_x2_z9, kernel_01_x2_z9, kernel_02_x2_z9, 
	 
	 kernel_00_x3_z9, kernel_03_x3_z9, kernel_06_x3_z9,
		
	 kernel_00_x5_z9,
	
                  (out_inC_9),
                  (valid_inC_9)
                  );
                  
   //Inception_Resnet_C 10 8x8x2080 ? 8x8x2080
  Inception_Resnet_C z10( clk,
                  reset,
                  valid_inC_9,
                  out_inC_9,
                  
   kernel_00_x0_z10,
	
	 kernel_00_x1_z10, 
	
	 kernel_00_x2_z10, kernel_01_x2_z10, kernel_02_x2_z10, 
	 
	 kernel_00_x3_z10, kernel_03_x3_z10, kernel_06_x3_z10,
		
	 kernel_00_x5_z10,
	
                  out_inC_10,
                  valid_inC_10
                  );
                  
   //conv 11 (1536)  input 8x8x2080   output   8x8x1536        
  conv_11 #(8,DATA_WIDTH) a3( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_inC_10),
                  .pxl_in(out_inC_10),
                           	                                      
                		.kernel_00(kernel_00_a3),
                		
                  .pxl_out(out_conv_11),
                  .valid_out(valid_conv_11)
                  );  
                    
   //global_avg_8x8 8x8x1536 ? 1x1x1536 
  global_avg_8x8 #(8,DATA_WIDTH) a0( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_conv_11),
                  .pxl_in(out_conv_11),
                  .pxl_out(out_avg),
                  .valid_out(valid_avg)
                  );
    
    //relu
    relu a1(
      .clk(clk),
      .valid_in(valid_avg),
      .din_relu(out_avg),
      .dout_relu(out_relu),
      .valid_out(valid_relu)
    );
    //*softmax* 
     Softmax #(1536,DATA_WIDTH) a2( .clk(clk),
                  .reset(reset),
                  .valid_in(valid_relu),
                  .pxl_in(out_relu),
                  .pxl_out(pxl_out),
                  .valid_out(valid_out)
                  );                               
endmodule




