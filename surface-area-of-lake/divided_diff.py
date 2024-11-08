# Chad Callender

# This program calculates the coefficients of a polynomial
# passing through a set of any given points in the Euclidean
# plane.
import numpy as np

def divDiff(x, y, x0 = None):
  """
  This function takes a list of x- and y-values representing
  points on the map an returns a polynomial that passes
  through those points. The method here is Newton's Divded Differences.
  """
  n = len(x)
  F = np.zeros((n,n))
  for i in range(n):
    F[i,0] = y[i]         # f[x_i] = y_i

  for i in range(1,n):
    for j in range(1,i+1):
      F[i,j] = (F[i][j-1] - F[i-1][j-1]) / (x[i] - x[i-j])
  print(F)
  return

# the set of points (x,y) chosen on the map
x = [-3.72,2.2]
y = [2.6503,2.5]
divDiff(x, y)