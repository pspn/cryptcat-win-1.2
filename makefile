
cc=cl
link=link

cflags=/nologo /ML /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_CONSOLE" /D "TELNET" /D "GAPING_SECURITY_HOLE" /YX /FD /c 
lflags=kernel32.lib user32.lib wsock32.lib winmm.lib /nologo /subsystem:console /incremental:yes /machine:I386 /out:nc.exe

all: nc.exe

getopt.obj: getopt.c
    $(cc) $(cflags) getopt.c

doexec.obj: doexec.c
    $(cc) $(cflags) doexec.c

netcat.obj: netcat.c
    $(cc) $(cflags) netcat.c

farm9crypt.obj: farm9crypt.cpp
	$(cc) $(cflags) farm9crypt.cpp

twofish2.obj: twofish2.cpp
	$(cc) $(cflags) twofish2.cpp
	

nc.exe: getopt.obj doexec.obj farm9crypt.obj twofish2.obj netcat.obj
    $(link) getopt.obj doexec.obj farm9crypt.obj twofish2.obj netcat.obj $(lflags)
