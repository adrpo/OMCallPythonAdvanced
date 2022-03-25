
# change these to suit your platform!
PYTHON_INCLUDE_DIR=-I"e:/bin/py64/include"
PYTHON_LIBRARY_DIR=-L"e:/bin/py64"
PYTHON_LIBRARY=-lpython38
CFLAGS=-g ${PYTHON_INCLUDE_DIR}
LDFLAGS=${PYTHON_LIBRARY_DIR} ${PYTHON_LIBRARY}


all: ../Library/win64/libOMCallPythonAdvanced.a

../Library/win64/libOMCallPythonAdvanced.a: libOMCallPythonAdvanced.a
	mkdir -p ../Library/win64/
	mv $^ ../Library/win64/.

libOMCallPythonAdvanced.a: OMCallPythonAdvanced.o
	ar -ru $@ $^

OMCallPythonAdvanced.o: OMCallPythonAdvanced.c OMCallPythonAdvanced.h
	gcc -o $@ -c $< ${CFLAGS} ${LDFLAGS}

clean:
	rm -f ../Library/win64/libOMCallPythonAdvanced.a OMCallPythonAdvanced.o libOMCallPythonAdvanced.a
