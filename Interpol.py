# This is a function to calculate the interpolation between two points


def arduino_map(x, in_min, in_max, out_min, out_max):
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min

x = input('What is X? ')

in_min = input('What is in min? ')

in_max = input('What is in max? ')

out_min = input('What is out min? ')

out_max = input('What is out max? ')

var = arduino_map(x, in_min, in_max, out_min, out_max)

print var

# this is a test for git in atom
