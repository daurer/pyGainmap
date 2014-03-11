import cython
import numpy as np
cimport numpy as np
from libc.math cimport exp, pow

#cdef extern from "math.h":
#    double exp(double)
#    double pow(double,int)

def gaussian_model(xin, p):
    cdef int sh = xin.shape[0]
    cdef np.ndarray[np.double_t, ndim=1] x = np.asarray(xin, dtype=np.float64)
    cdef np.ndarray[np.double_t, ndim=1] g = np.zeros(sh, dtype=np.float64)
    cdef float A = p[0]
    cdef float mu = p[1]
    cdef float s = p[2]
    for i in range(sh):
        g[i] = A * exp( - (pow(x[i]-mu,2)) / (2*pow(s,2)) ) 
    return g

def errfunc(p, xin, yin):
    cdef int sh = xin.shape[0]
    cdef np.ndarray[np.double_t, ndim=1] x = np.asarray(xin, dtype=np.float64)
    cdef np.ndarray[np.double_t, ndim=1] y = np.asarray(yin, dtype=np.float64)
    cdef np.ndarray[np.double_t, ndim=1] e = np.zeros(sh, dtype=np.float64)
    cdef float A = p[0]
    cdef float mu = p[1]
    cdef float s = p[2]
    for i in range(sh):
        e[i] = A * exp( - (pow(x[i]-mu,2)) / (2*pow(s,2)) ) - y[i]
    return e