from packaging import version
pv=version.parse
import os
import sys



os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3' 
print("# LOOKING EXECUTABLE")
print("You are currently using the Python executable", sys.executable)
print("Does it look like the path of a virtual environment to you?")
print("If it does, everything is fine")
print("# TESTING LIBRARIES...")
try:
    import numpy
except Exception as exc:
    print("Failed to import the package numpy")
try:
    import scipy
except Exception as exc:
    print("Failed to import the package scipy")
try:
    import librosa
except Exception as exc:
    print("Failed to import the package librosa")
try:
    import tensorflow
except Exception as exc:
    print("Failed to import the package tensorflow")
try:
    import pythonosc
except Exception as exc:
    print("Failed to import the package python-osc")
try:
    import sklearn
except Exception as exc:
    print("Failed to import the package scikit-learn")
try:
    import cv2
except Exception as exc:
    print("Failed to import the package cv")
try:
    import requests
except Exception as exc:
    print("Failed to import the package requests")
try:
    import matplotlib
except Exception as exc:
    print("Failed to import the package matplotlib")
try:
    import pandas
except Exception as exc:
    print("Failed to import the package pandas")
try:
    import ipykernel
except Exception as exc:
    print("Failed to import the package ipykernel")

