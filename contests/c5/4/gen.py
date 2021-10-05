#!/usr/local/bin/python3.9
import os, sys
from stat import *

for i in range(0,0o1000):
    print('CMD/{'+filemode(i)[1:]+'}/')
    print('OUTPUT/{'+oct(i)[2:]+'\n}/\n')
