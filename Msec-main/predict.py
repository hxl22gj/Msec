#!/usr/bin/env python
import numpy as np
from keras.models import Sequential
from keras.layers import Dense, Activation,Dropout
from keras.layers import Conv1D, GlobalAveragePooling1D, MaxPooling1D
from keras.optimizers import Adam
import h5py
import sys
import os
from keras import regularizers
from keras.models import load_model
def main():
    
    argc = len(sys.argv)
    argv = sys.argv
    
    gap2=h5py.File(argv[1]+'gap2.mat')
    gap2=gap2['gap2'][:]
    
    gap5=h5py.File(argv[1]+'gap5.mat')
    gap5=gap5['gap5'][:]

    gap0=h5py.File(argv[1]+'gap0.mat')
    gap0=gap0['gap0'][:]

    model2=load_model('./twomer_2gap/model.h5')
    model5=load_model('./twomer_5gap/model.h5')
    model0=load_model('./twomer_0gap/model.h5')

    predict2 = model2.predict(gap2)
    predict5 = model5.predict(gap5)
    predict0 = model0.predict(gap0)

    np.savetxt(argv[1]+'predict2.csv',predict2)
    np.savetxt(argv[1]+'predict5.csv',predict5)
    np.savetxt(argv[1]+'predict0.csv',predict0)
    
    del model2
    del model5
    del model0
    

if __name__=="__main__":
    main()
