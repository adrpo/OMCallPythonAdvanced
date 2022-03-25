package OMCallPythonAdvanced
  package Py

    class PythonHandle
      extends ExternalObject;

      function constructor "External object constructor will intialized python"
        output PythonHandle pyHandle;

        external "C" pyHandle = omc_PyInit() annotation (
          IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
          Include = "#include \"OMCallPythonAdvanced.h\"");
      end constructor;

      function destructor "External object destructor that frees the python dll"
        input PythonHandle pyHandle;

        external "C" omc_PyEnd(pyHandle) annotation (
          IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
          Include = "#include \"OMCallPythonAdvanced.h\"");
      end destructor;
    end PythonHandle;

    function initialize
      input PythonHandle pyHandle;
      external "C" omc_Py_Initialize(pyHandle) 
      annotation (
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python38"});
    end initialize;

    function run
      input PythonHandle pyHandle;
      input String pyProgram;
      output Integer status "0 is OK, -1 is bad";

      external "C" status = omc_PyRun_SimpleString(pyHandle, pyProgram)
      annotation (
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python38"});
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

      external "C" status = omc_PyRun_TwoArgumentsOneReturn(pyHandle, x, y, pyProgram, pyModuleName, pyFunctionName, z)
      annotation (
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python38"});
    end twoRealArgumentsReturnReal;

    function finalize
      input PythonHandle pyHandle;

      external "C" omc_Py_Finalize(pyHandle)
      annotation (
        IncludeDirectory = "modelica://OMCallPythonAdvanced/Resources/C-Sources",
        Include = "#include \"OMCallPythonAdvanced.h\"",
        LibraryDirectory = "modelica://OMCallPythonAdvanced/Resources/Library/",
        Library = {"OMCallPythonAdvanced", "python38"});
    end finalize;
  end Py;
end OMCallPythonAdvanced;
