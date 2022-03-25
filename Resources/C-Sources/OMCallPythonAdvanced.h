
#if !defined(__OMCallPythonAdvanced_H__)
#define __OMCallPythonAdvanced_H__


#if defined _WIN32
  #include <windows.h>
#endif

extern void* omc_PyInit();
extern void omc_PyEnd();
extern void omc_Py_Initialize(void* pyHandle);
extern void omc_Py_Finalize(void* pyHandle);
extern int omc_PyRun_SimpleString(void* pyHandle, const char* program);
extern int omc_PyRun_TwoArgumentsOneReturn(void* pyHandle, double x, double y, const char* pyProgram, const char* pyModuleName, const char* pyFunctionName, double *z);


#endif /* #if !defined(__OMCallPythonAdvanced_H__) */