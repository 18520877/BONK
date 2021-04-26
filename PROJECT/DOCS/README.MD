# Sơ lược về CNN
Kiến trúc truyền thống của một mạng CNN: Mạng neural tích chập (Convolutional neural networks), còn được biết đến với tên CNNs, là một dạng mạng neural được cấu thành bởi các tầng sau:
![image](https://user-images.githubusercontent.com/79899590/115427990-26507580-a22c-11eb-9595-98e51d414c3b.png)
Tầng tích chập và tầng pooling có thể được hiệu chỉnh theo các siêu tham số (hyperparameters) được mô tả ở những phần tiếp theo.
## Các kiểu tầng

### Tầng tích chập (CONV)
Giống như các lớp ẩn khác, lớp tích chập lấy dữ liệu đầu vào, thực hiện các phép chuyển đổi để tạo ra dữ liệu đầu vào cho lớp kế tiếp (đầu ra của lớp này là đầu vào của lớp sau). Tầng tích chập (CONV) sử dụng các bộ lọc để thực hiện phép tích chập khi đưa chúng đi qua đầu vào I theo các chiều của nó. Các siêu tham số của các bộ lọc này bao gồm kích thước bộ lọc F và độ trượt (stride) S.
![image](https://user-images.githubusercontent.com/79899590/115428768-f0f85780-a22c-11eb-8653-a91578ca0947.png)
![image](https://user-images.githubusercontent.com/79899590/115431203-3d449700-a22f-11eb-8fac-e99d89f808b1.png)


#### Padding
Mỗi một lần áp dụng phép nhân chập, kích thước của ảnh bị giảm xuống, và vì thế chúng ta chỉ có thể thực hiện nó một vài lần trước khi ảnh trở nên quá nhỏ.
![image](https://user-images.githubusercontent.com/79899590/115430145-4ed96f00-a22e-11eb-9e74-35b8cd592d1b.png)
<img src="https://media.giphy.com/media/j1POIsEwkHai01p3o2/giphy.gif" width="800">

Để khắc phục hai nhược điểm trên, một đường viền phụ (padding) được thêm vào xung quanh ma trận đầu. Việc thêm đường viền phụ làm tăng kích thước của ma trận đầu vào, dẫn tới tăng kích thước ma trận đầu ra. Từ đó độ chênh lệch giữa ma trận đầu ra với ma trận đầu vào gốc giảm. Những ô nằm trên cạnh/ góc của ma trận đầu vào gốc cũng lùi sâu vào bên trong hơn, dẫn tới được sử dụng nhiều hơn trong việc tính toán ma trận đầu ra, tránh được việc mất mát thông tin.

#### Stride
Trong phép nhân chập ở trên, bộ lọc trượt trên ma trận đầu vào 1 hàng/ cột trong mỗi bước di chuyển. Tuy nhiên, giá trị này có thể bằng 2, 3 hoặc lớn hơn.

<img src="https://media.giphy.com/media/HBzpOGeZLy1f1mEyGC/giphy.gif" width="800">

#### Pooling
Tầng pooling (POOL) là một phép downsampling, thường được sử dụng sau tầng tích chập, giúp tăng tính bất biến không gian. Cụ thể, max pooling và average pooling là những dạng pooling đặc biệt, mà tương ứng là trong đó giá trị lớn nhất và giá trị trung bình được lấy ra.

![image](https://user-images.githubusercontent.com/79899590/115572514-2c0c9080-a2ea-11eb-8f56-f2d4512785bc.png)

<img src="https://media.giphy.com/media/G5aIoazS8RByGOqdMd/giphy.gif" width="800">

![image](https://user-images.githubusercontent.com/79899590/116044817-8f584300-a69b-11eb-9d94-69fe04436a16.png)


# Inception Resnet V2
Inception Resnet V2 là cấu trúc mạng nơ ron tích chập được xây dựng dựa trên cấu trúc của Inception và có bao gồm liên kết tránh (Residual Connections).
- Được thử nghiệm trên hệ thống cơ sở dữ liệu của Imagenet, với 164 layers và được ứng dụng để phân loại ảnh lên đến 1000 vật thể khác nhau.
- Có đầu vào là một bức ảnh có kích thước 299*299 và đầu ra sẽ là tên các vật thể có độ chính xác cao nhất được nhận dạng từ bức ảnh đầu vào.

![image](https://user-images.githubusercontent.com/79899590/115391542-c8129b00-a209-11eb-8b73-d2677df27a9b.png)
![image](https://user-images.githubusercontent.com/79899590/115574268-ae498480-a2eb-11eb-9387-537de4082128.png)


- Sơ đồ khối Stem (299x299x3 → 35x35x384):
![image](https://user-images.githubusercontent.com/79899590/115576416-abe82a00-a2ed-11eb-8788-6a3b935d2bdf.png)

- Sơ đồ khối Inception-ResNet-A (35x35x384 → 35x35x384):
![image](https://user-images.githubusercontent.com/79899590/115576473-ba364600-a2ed-11eb-8f52-7d146815de63.png)

- Sơ đồ khối Reduction-A (35x35x384 → 17x17x1152):
![image](https://user-images.githubusercontent.com/79899590/115576628-e5b93080-a2ed-11eb-88ac-18d45f934190.png)

- Sơ đồ khối Inception-ResNet-B (17x17x1152 → 17x17x1152):
![image](https://user-images.githubusercontent.com/79899590/115576692-f2d61f80-a2ed-11eb-9578-f533abbd2b52.png)

- Sơ đồ khối Reduction-B (17x17x1152 → 8x8x2144):
![image](https://user-images.githubusercontent.com/79899590/115576795-097c7680-a2ee-11eb-9971-45107b8e59f4.png)

- Sơ đồ khối Inception-ResNet-C (8x8x2144 → 8x8x2144):
![image](https://user-images.githubusercontent.com/79899590/115576866-19945600-a2ee-11eb-82f0-6b776c125347.png)
