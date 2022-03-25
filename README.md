# OMCallPythonAdvanced

Simple package to call Python from Modelica

Open the Examples.Test model, and simulate

libOMCallPythonAdvanced.a and python dll are in the package so you don't need to 
build it, but if needed (other python version, etc) follow the procedure below.

To run the example **you will need to**
- change OMCallPythonAdvanced/Resources/C-Sources/Makefile to suite your platform
  - update the python include directory
  - update the python directory
- build OMCallPythonAdvanced/Resources/win64/libOMCallPythonAdvanced.a
```
cd OMCallPythonAdvanced/Resources/C-Sources
make
```
- copy python3.dll and python3N.dll into OMCallPythonAdvanced/Resources/win64/



