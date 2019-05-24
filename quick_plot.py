import numpy as np
import Tkinter, tkFileDialog
import csv
from scipy import signal

# matplotlib inline

import matplotlib.pyplot as plt

# Read in the text file to parse
root = Tkinter.Tk()

# This line may need to be commented out in Windows
root.withdraw()

file_path = tkFileDialog.askopenfilename()

data = np.genfromtxt(file_path, delimiter=',', skip_header=1)

time = data[:, 0]

x = data[:, 1]
y = data[:, 2]
print data

plt.scatter(x, y)
plt.show()
