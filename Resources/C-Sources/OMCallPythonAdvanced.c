#include <stdio.h>
#include "OMCallPythonAdvanced.h"

#define PY_SSIZE_T_CLEAN
#include <Python.h>

static int omc_PyGlobal = 0;
static int omc_PyIsInitialized = 0;

void* omc_PyInit() {
  if (!omc_PyIsInitialized) {
    omc_PyGlobal = 1;
    omc_Py_Initialize((void*)&omc_PyGlobal);
  }
  return (void*)&omc_PyGlobal;
}

void omc_PyEnd(void* pyHandle) {
  if (omc_PyIsInitialized) {
    omc_Py_Finalize(pyHandle);
    omc_PyIsInitialized = 0;
  }
}

void omc_Py_Initialize(void* pyHandle) {
  if (omc_PyIsInitialized)
    return;
  Py_Initialize();
  omc_PyIsInitialized = 1;
}

void omc_Py_Finalize(void* pyHandle) {
  if (omc_PyIsInitialized) {
    Py_Finalize();
  }
}

int omc_PyRun_SimpleString(void* pyHandle, const char* program) {
  if (!omc_PyIsInitialized) {
    fprintf(stderr, "omc_PyRun_SimpleString: Python is not initialized!\n"); fflush(NULL);
    return -1;
  }
  return PyRun_SimpleString(program);
}

int omc_PyRun_TwoArgumentsOneReturn(void* pyHandle, double x, double y, const char* pyProgram, const char* pyModuleName, const char* pyFunctionName, double *z) {
    static int runDone = 0;
    PyObject *pModule, *pFunc;
    PyObject *pArgs, *pValue;
    int i, status = -1;
    /* set the output to zero first */
    *z = 0;
    
    if (!omc_PyIsInitialized) {
      fprintf(stderr, "omc_PyRun_TwoArgumentsOneReturn: Python is not initialized!\n"); fflush(NULL);
      return -1;
    }
    
    /* only run this once! */
    if (!runDone) {
      status = PyRun_SimpleString(pyProgram);
      runDone = 1;
      if (status != 0) {
        fprintf(stderr, "Could not run program \n---- Program: ----\n%s\n----------------\n", pyProgram); fflush(NULL);
        return -1;
      }
    }

    pModule = PyImport_ImportModule(pyModuleName);

    if (pModule != NULL) {
        pFunc = PyObject_GetAttrString(pModule, pyFunctionName);

        if (pFunc && PyCallable_Check(pFunc)) {
            pArgs = PyTuple_New(2);
            /* first argument */
            pValue = PyFloat_FromDouble(x);
            if (!pValue) {
                Py_DECREF(pArgs);
                Py_DECREF(pModule);
                fprintf(stderr, "Cannot convert argument x: %g to Python float!\n", x); fflush(NULL);
                return -1;
            }
            /* store it in the tuple, pValue reference stolen here */
            PyTuple_SetItem(pArgs, 0, pValue);
            /* second argument */
            pValue = PyFloat_FromDouble(y);
            if (!pValue) {
                Py_DECREF(pArgs);
                Py_DECREF(pModule);
                fprintf(stderr, "Cannot convert argument y: %g to Python float!\n", y); fflush(NULL);
                return -1;
            }
            /* store it in the tuple, pValue reference stolen here */
            PyTuple_SetItem(pArgs, 1, pValue);

            pValue = PyObject_CallObject(pFunc, pArgs);
            Py_DECREF(pArgs);
            if (pValue != NULL) {
                *z = PyFloat_AsDouble(pValue);
                if (PyErr_Occurred()) {
                   PyErr_Print();
                   fprintf(stderr, "Cannot convert return argument double z from Python float\n!"); fflush(NULL);
                   return -1;
                }
                fprintf(stdout, "Result of call: %s(%g, %g) -> %g\n", pyFunctionName, x, y, *z); fflush(NULL);
                Py_DECREF(pValue);
            }
            else {
                Py_DECREF(pFunc);
                Py_DECREF(pModule);
                PyErr_Print();
                fprintf(stderr,"Call to %s failed!\n", pyFunctionName); fflush(NULL);
                return -1;
            }
        }
        else {
            if (PyErr_Occurred())
                PyErr_Print();
            fprintf(stderr, "Cannot find function \"%s\"\n", pyFunctionName); fflush(NULL);
            return -1;
        }
        Py_XDECREF(pFunc);
        Py_DECREF(pModule);
    }
    else {
        PyErr_Print();
        fprintf(stderr, "Failed to load \"%s\"\n", pyModuleName);
        return -1;
    }
    return 0;
}
