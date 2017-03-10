# import two modules and make alias.
import numpy as np
import matplotlib.pyplot as plt

# read data matrix from file
data = np.loadtxt("example.out")

# plot data
plt.figure()

# data[:, 0] means the first column of data matrix
plt.plot(data[:, 1], data[:, 0] * 100)

# show plot
plt.show()