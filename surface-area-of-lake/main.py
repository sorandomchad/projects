# Chad Callender
# This program calculates the surface area of a 2D shape
# given a set of curves that approximate the shape

# Source: Numerical Analysis, 10th Ed. by Burden,
# Faires, Burden. 

import math

# roots and coefficients of Legendre Polynomials
# source: p. 232, table 4.12
r = [(0.5773502692, -0.5773502692), (0.7745966692, 0, -0.7745966692), (0.8611363116, 0.3399810436, -0.3399810436, -0.861136311), (0.9061798459,0.5384693101, 0, -0.5384693101, -0.9061798459)]

co = [(1, 1), (0.5555555556, 0.8888888889, 0.5555555556), (0.3478548451, 0.6521451549, 0.6521451549, 0.3478548451), (0.2369268850, 0.4786286705, 0.5688888889, 0.4786286705, 0.2369268850)]

def f(x,y):
  # The function of the surface
  # Will be 1 in this case since we are calculating surface area
  # In theory f can be any function with two independent vars
  return 1

def c(x):
  # the lower boudary function of region R
  # in this context, these are the interpolating polynomials from newton's divided differences
  return -2.222-0.11312804*(x+3.72)

def d(x):
   # the upper boudary function of region R
  return 2.6503-0.02538851*(x+3.72)

def gauss_q(a,b,m,n):
  # source: p. 244, algorithm 4.5
  h1 = (b - a) / 2
  h2 = (b + a) / 2
  J = 0

  for i in range(1,m+1):
    JX = 0
    x = h1*r[m-2][i-1] + h2
    d1 = d(x)
    c1 = c(x)
    k1 = (d1 - c1) / 2
    k2 = (d1 + c1) / 2

    for j in range (1,n+1):
      y = k1*r[n-2][j-1] + k2
      Q = f(x,y)
      JX += co[n-2][j-1] * Q

    J += co[m-2][i-1] * k1 * JX
  
  J = h1 * J
  print(J)

  return J

area1 = gauss_q(-3.72, 2.45, 5, 5) * 16.6543514 * 17.02533784
# 94.82367 is the horizontal scale factor; 88.48235 is the vertical scale factor

print("area:", area1)
