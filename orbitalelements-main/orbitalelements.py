# -*- coding: utf-8 -*-
"""
Created on Sun Nov  1 20:18:48 2020

@author: chand
"""
#import relevant libraries
import numpy as np
from IPython.display import Image

print('\nChandler Timm Doloriel    02-11-2020      \nEE298: Intro to Satellite Development')

#global constants
mu = 3.986*(10**5)
i = np.array([1, 0, 0])
J = np.array([0, 1, 0])
K = np.array([0, 0, 1])

#input position and velocity given as arrays
position = [1670.6319, 1670.6319, 6491.2735]
velocity = [-5.3429, -5.3429, 3.3788]
#position = [8228, 389, 6888]
#velocity = [-0.7, 6.6, -0.6]

#transform arrays into vector for easier manipulation
R = np.array(position)
V = np.array(velocity)

#print the given vector values
print('\nA spacecraft is observed with the following position and velocity vectors: ')
print('\nposition vector, R: ', R, 'km')
print('velocity vector, V: ', V, 'km/s')

#transform vectors into magnitude
magR = np.linalg.norm(R)
magV = np.linalg.norm(V)

#solve for Semimajor axis, a
epsi = ((magV**2)/2) - (mu/magR)
a = (-1*mu)/(2*epsi)
print('\nSemimajor axis, a = ', np.around(a, 3), 'km')

#solve for eccentricity, e
vector_e = (1/mu)*(R*(magV**2-(mu/magR))-V*(R.dot(V)))
e = np.linalg.norm(vector_e)
print('\nEccentricity, e = ', np.around(e, 3))

#solve for inclination, I 
h = np.cross(R, V)
Irad = np.arccos((K.dot(h))/(np.linalg.norm(K)*np.linalg.norm(h)))
#convert to degrees
I = (180/np.pi)*Irad
#determine the right inclination
if (I<=180):
    I=I
elif (I>180):
    I=360-I
print('\nInclination, I = ', np.around(I, 3), 'degrees')

#solve for right ascension of the ascending node, omega
n = np.cross(K, h)
magI = np.linalg.norm(i)
magn = np.linalg.norm(n)
omegarad = np.arccos((i.dot(n))/(magI*magn))
#convert to degrees
omega = (180/np.pi)*omegarad
#determine the nj value
if (n.dot(J)>=0):
    omega = omega
elif (n.dot(J)<0):
    omega = 360-omega
print('\nRA of the ascending node, omega = ', np.around(omega, 3), 'degrees')

#solve for argument of perigee, w
w = np.arccos(n.dot(vector_e)/(magn*e))
#convert to degrees
w = (180/np.pi)*w
#determine the ek value
if (vector_e.dot(K)>=0):
    w=w
elif (vector_e.dot(K)<0):
    w=360-w
print('\nargument of perigee, w = ', np.around(w, 3), 'degrees')

#solve for true anomaly, v
v = np.arccos((vector_e.dot(R))/(e*magR))
#convert to degrees
v = (180/np.pi)*v
#determine the (R dot V) value
if (R.dot(V)>=0):
    v = v
elif (R.dot(V)<0):
    v = 360 - v
print('\ntrue anomaly, v = ', np.around(v, 3), 'degrees')


#plotting the orbit
img = Image(filename='orbitalplot.png')
display(img)







