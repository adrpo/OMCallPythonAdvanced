package OMCallPythonAdvanced
  extends Modelica.Icons.Package;
  package Py
    extends Modelica.Icons.FunctionsPackage;
    class PythonHandle
      extends ExternalObject;

      function constructor "External object constructor will intialized python"
        output PythonHandle pyHandle;
      
        external "C" pyHandle = omc_PyInit() annotation(
          IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
          Include = "#include \"OMCallPythonAdvanced.h\"");
      end constructor;

      function destructor "External object destructor that frees the python dll"
        input PythonHandle pyHandle;
      
        external "C" omc_PyEnd(pyHandle) annotation(
          IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
          Include = "#include \"OMCallPythonAdvanced.h\"");
      end destructor;
    end PythonHandle;

    function initialize
      input PythonHandle pyHandle;
    
      external "C" omc_Py_Initialize(pyHandle) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end initialize;

    function run
      input PythonHandle pyHandle;
      input String pyProgram;
      output Integer status "0 is OK, -1 is bad";
    
      external "C" status = omc_PyRun_SimpleString(pyHandle, pyProgram) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end run;

    function twoRealArgumentsReturnReal
      input PythonHandle pyHandle;
      input Real x;
      input Real y;
      input String pyProgram "python code";
      input String pyModuleName "the module to import";
      input String pyFunctionName "the function to call from the module";
      output Real z;
      output Integer status "0 if OK, -1 if error";
    
      external "C" status = omc_PyRun_TwoArgumentsOneReturn(pyHandle, x, y, pyProgram, pyModuleName, pyFunctionName, z) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end twoRealArgumentsReturnReal;

    function fourRealArgumentsReturnReal
      input PythonHandle pyHandle;
      input Real x;
      input Real y;
      input Real a;
      input Real b;
      input String pyProgram "python code";
      input String pyModuleName "the module to import";
      input String pyFunctionName "the function to call from the module";
      output Real z;
      output Integer status "0 if OK, -1 if error";
    
      external "C" status = omc_PyRun_FourArgumentsOneReturn(pyHandle, x, y, a, b, pyProgram, pyModuleName, pyFunctionName, z) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end fourRealArgumentsReturnReal;

    function fiveRealArgumentsReturnReal
      input PythonHandle pyHandle;
      input Real x;
      input Real y;
      input Real a;
      input Real b;
      input Real c;
      input String pyProgram "python code";
      input String pyModuleName "the module to import";
      input String pyFunctionName "the function to call from the module";
      output Real z;
      output Integer status "0 if OK, -1 if error";
    
      external "C" status = omc_PyRun_FiveArgumentsOneReturn(pyHandle, x, y, a, b, c, pyProgram, pyModuleName, pyFunctionName, z) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end fiveRealArgumentsReturnReal;

    function sixRealArgumentsReturnReal
      input PythonHandle pyHandle;
      input Real x;
      input Real y;
      input Real a;
      input Real b;
      input Real c;
      input Real d;
      input String pyProgram "python code";
      input String pyModuleName "the module to import";
      input String pyFunctionName "the function to call from the module";
      output Real z;
      output Integer status "0 if OK, -1 if error";
    
      external "C" status = omc_PyRun_SixArgumentsOneReturn(pyHandle, x, y, a, b, c, d, pyProgram, pyModuleName, pyFunctionName, z) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end sixRealArgumentsReturnReal;

    function nineRealArgumentsReturnReal
      input PythonHandle pyHandle;
      input Real x;
      input Real y;
      input Real a;
      input Real b;
      input Real c;
      input Real d;
      input Real e;
      input Real f;
      input Real g;
      input String pyProgram "python code";
      input String pyModuleName "the module to import";
      input String pyFunctionName "the function to call from the module";
      output Real z;
      output Integer status "0 if OK, -1 if error";
    
      external "C" status = omc_PyRun_NineArgumentsOneReturn(pyHandle, x, y, a, b, c, d, e, f, g, pyProgram, pyModuleName, pyFunctionName, z) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end nineRealArgumentsReturnReal;

    function finalize
      input PythonHandle pyHandle;
    
      external "C" omc_Py_Finalize(pyHandle) annotation(
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python39"});
    end finalize;
  end Py;

annotation(version="1.0.0");
end OMCallPythonAdvanced;
