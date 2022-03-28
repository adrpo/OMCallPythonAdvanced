# OMCallPythonAdvanced

Simple package to call Python from Modelica

Open the Examples.Test model, and simulate

Note this has only been tested on Windows but it should work on Linux as well.
libOMCallPythonAdvanced.a and python dll are in the package so you don't need to 
build it, but if needed (other python version, etc) follow the procedure below.

To run the example **you will need to**
- change OMCallPythonAdvanced/Resources/C-Sources/Makefile to suite your platform
  - update the python include directory
  - update the python directory
- build OMCallPythonAdvanced/Resources/win64/libOMCallPythonAdvanced.a
  * on Windows
    + first, run %OPENMODELICAHOME%/tools/MSYS_SETUP.bat
    + then start  %OPENMODELICAHOME%/tools/msys/mingw64.exe terminal
  * on Linux just run these in the terminal
```
cd OMCallPythonAdvanced/Resources/C-Sources
make
```
- copy python3.dll and python3N.dll into OMCallPythonAdvanced/Resources/win64/



