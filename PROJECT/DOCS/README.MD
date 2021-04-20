# Sơ lược về CNN
Kiến trúc truyền thống của một mạng CNN: Mạng neural tích chập (Convolutional neural networks), còn được biết đến với tên CNNs, là một dạng mạng neural được cấu thành bởi các tầng sau:
![image](https://user-images.githubusercontent.com/79899590/115427990-26507580-a22c-11eb-9595-98e51d414c3b.png)
Tầng tích chập và tầng pooling có thể được hiệu chỉnh theo các siêu tham số (hyperparameters) được mô tả ở những phần tiếp theo.
## Các kiểu tầng

### Tầng tích chập (CONV)
Tầng tích chập (CONV) sử dụng các bộ lọc để thực hiện phép tích chập khi đưa chúng đi qua đầu vào II theo các chiều của nó. Các siêu tham số của các bộ lọc này bao gồm kích thước bộ lọc FF và độ trượt (stride) S.
![image](https://user-images.githubusercontent.com/79899590/115428768-f0f85780-a22c-11eb-8653-a91578ca0947.png)
![image](https://user-images.githubusercontent.com/79899590/115431203-3d449700-a22f-11eb-8fac-e99d89f808b1.png)


#### Padding
Mỗi một lần áp dụng phép nhân chập, kích thước của ảnh bị giảm xuống, và vì thế chúng ta chỉ có thể thực hiện nó một vài lần trước khi ảnh trở nên quá nhỏ.
![image](https://user-images.githubusercontent.com/79899590/115430145-4ed96f00-a22e-11eb-9e74-35b8cd592d1b.png)
Để khắc phục hai nhược điểm trên, một đường viền phụ (padding) được thêm vào xung quanh ma trận đầu. Việc thêm đường viền phụ làm tăng kích thước của ma trận đầu vào, dẫn tới tăng kích thước ma trận đầu ra. Từ đó độ chênh lệch giữa ma trận đầu ra với ma trận đầu vào gốc giảm. Những ô nằm trên cạnh/ góc của ma trận đầu vào gốc cũng lùi sâu vào bên trong hơn, dẫn tới được sử dụng nhiều hơn trong việc tính toán ma trận đầu ra, tránh được việc mất mát thông tin.

#### Stride
Stride được hiểu như là bước đi của filter. Với stride = 1, filter sẽ được dịch qua một pixel và tương tự với các giá trị stride khác.
![image](https://user-images.githubusercontent.com/79899590/115432175-4a15ba80-a230-11eb-8776-7e2c223369bd.png)

Với stride = 1:
![image](https://user-images.githubusercontent.com/79899590/115432234-5732a980-a230-11eb-8c51-655d7b91a54d.png)

Với stride = 2:
![image](https://user-images.githubusercontent.com/79899590/115432258-60237b00-a230-11eb-83ef-b31395b15c09.png)
v.v

# Inception Resnet V2
![image](https://user-images.githubusercontent.com/79899590/115391542-c8129b00-a209-11eb-8b73-d2677df27a9b.png)
![image](https://user-images.githubusercontent.com/79899590/115391558-ce087c00-a209-11eb-968d-4ef222ed8fca.png)
