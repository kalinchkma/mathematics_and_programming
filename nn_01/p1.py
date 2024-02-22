# 4 input 1 Nuron
inputs = [1, 2, 3.5, 4.6]
weights = [3.1, 2.1, 8.3, 2.9]
bias = 4

output = (
    inputs[0] * weights[0]
    + inputs[1] * weights[1]
    + inputs[2] * weights[2]
    + inputs[3] * weights[3]
    + bias
)
# print(output)
# 4 input 3 Nuron
weights1 = [2.1, -8.1, 8.3, 9.9]
weights2 = [1.1, 2.1, 6.3, -2.9]
weights3 = [-4.1, -2.1, 8.3, 4.9]
bias1 = 1.0
bias2 = 2.0
bias3 = 0.5

output = [
    inputs[0] * weights1[0]
    + inputs[1] * weights1[1]
    + inputs[2] * weights1[2]
    + inputs[3] * weights1[3]
    + bias1,
    inputs[0] * weights2[0]
    + inputs[1] * weights2[1]
    + inputs[2] * weights2[2]
    + inputs[3] * weights2[3]
    + bias2,
    inputs[0] * weights3[0]
    + inputs[1] * weights3[1]
    + inputs[2] * weights3[2]
    + inputs[3] * weights3[3]
    + bias3,
]
# print(output)


## ------------------- Make Dynamic ------------------------##
inputs = [1.2, 4.2, 3.9]
weights = [[2.1, -8.1, 8.3, 9.9], [1.1, 2.1, 6.3, -2.9], [-4.1, -2.1, 8.3, 4.9]]
biases = [1.0, 2.0, 0.5]

layer_outputs = []

for neuron_weight, neuron_biases in zip(weights, biases):
    neuron_output = 0
    # Calculate every neuron input * weight
    for n_input, weight in zip(inputs, neuron_weight):
        neuron_output += n_input * weight
    # Add bias to neuron
    neuron_output += neuron_biases
    layer_outputs.append(neuron_output)

print(layer_outputs)
