# Notes:
## This implementation has been merged into the keras.applications module!

## Install the latest version Keras on GitHub and import it with: 

``` 
from keras.applications.inception_resnet_v2 import InceptionResNetV2, preprocess_input
```

## If you have trouble with keras.application obtain_input_shape method, try:
Replace ```keras.application``` with ```keras_application```

# Usage:
## Extract layer weights from TF checkpoint:
```
python extract_weights.py
```
### By default, the TF checkpoint file will be downloaded to ./models folder, and the layer weights (.npy files) will be saved to ./weights folder.

## Load NumPy weight files and save to a Keras HDF5 weights file:
```
python load_weights.py
```

### The following weight files:

models/inception_resnet_v2_weights_tf_dim_ordering_tf_kernels.h5

models/inception_resnet_v2_weights_tf_dim_ordering_tf_kernels_notop.h5
### will be generated.
