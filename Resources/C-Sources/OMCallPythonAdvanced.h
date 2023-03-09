
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
extern int omc_PyRun_FourArgumentsOneReturn(void* pyHandle, double x, double y, double a, double b, const char* pyProgram, const char* pyModuleName, const char* pyFunctionName, double *z);
extern int omc_PyRun_FiveArgumentsOneReturn(void* pyHandle, double x, double y, double a, double b, double c, const char* pyProgram, const char* pyModuleName, const char* pyFunctionName, double *z);
extern int omc_PyRun_SixArgumentsOneReturn(void* pyHandle, double x, double y, double a, double b, double c, double d, const char* pyProgram, const char* pyModuleName, const char* pyFunctionName, double *z);
extern int omc_PyRun_NineArgumentsOneReturn(void* pyHandle, double x, double y, double a, double b, double c, double d, double e, double f, double g, const char* pyProgram, const char* pyModuleName, const char* pyFunctionName, double *z);


#endif /* #if !defined(__OMCallPythonAdvanced_H__) */