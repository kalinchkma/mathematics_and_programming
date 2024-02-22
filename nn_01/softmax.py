import math
import numpy as np

layer_outputs = [[4.8, 1.21, 2.385], [8.9, -1.81, 0.2], [1.41, 1.051, 0.026]]

E = math.e


# Raw python

# exp_value = []
# for output in layer_outputs:
#     exp_value.append(E**output)  ## y = e^x

# print(exp_value)
# norm_base = sum(exp_value)
# norm_values = []

# for value in exp_value:
#     norm_values.append(value / norm_base)

# with numpy
exp_values = np.exp(layer_outputs)

# print(np.sum(layer_outputs, axis=1, keepdims=True))

norm_values = exp_values / np.sum(exp_values, axis=1, keepdims=True)

print(exp_values)
print(norm_values)
print("sum:", np.sum(norm_values))
