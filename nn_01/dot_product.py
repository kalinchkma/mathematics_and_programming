import numpy as np


## Dot product with singale Neuron
inputs = [1, 2, 3, 2.5]
weights = [0.2, 0.8, -0.5, 1.0]

bias = 2

output = np.dot(weights, inputs) + bias
# print(output)

## Dot product with multiple Neuron
inputs = [[1, 2, 3, 2.5], [2.0, 5.0, -1.0, 2.0], [-1.5, 2.7, 3.3, -0.8]]

# Layer 1
weights = [[0.2, 0.8, -0.5, 1.0], [0.5, -0.91, 0.26, -0.5], [-0.26, -0.27, 0.17, 0.87]]

biases = [2, 3, 0.5]

layer1_output = np.dot(inputs, np.array(weights).T) + biases

## Layer 2
weights2 = [[0.1, -0.14, 0.5], [-0.5, 0.12, -0.33], [-0.44, 0.73, -0.13]]
biases = [-1, 2, -0.5]

layer2_output = np.dot(layer1_output, np.array(weights2).T) + biases

print(layer2_output)
