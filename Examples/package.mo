within OMCallPythonAdvanced;
package Examples

  import OMCallPythonAdvanced.Py;

  model Test
    Py.PythonHandle pyHandle = Py.PythonHandle() "Initialize Python";
    constant String pyProgram = 
"def multiply(x, y):
  print(\"Will compute\", x, \"times\", y)
  return x * y
";
    parameter String pyModuleName = "__main__";
    parameter String pyFunctionName = "multiply";
    parameter Real a = -1.0;
    Real x(start = 1.0, fixed = true);
  initial algorithm
    Py.initialize(pyHandle);
  equation
    der(x) = Py.twoRealArgumentsReturnReal(pyHandle, x, a, pyProgram, pyModuleName, pyFunctionName);
  end Test;
end Examples;
