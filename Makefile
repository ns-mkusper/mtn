# older ffmpeg doesn't have swscale. you might need to build a newer ffmpeg from source

#CFLAGS=-W -Wall -O3 -s -D_FILE_OFFSET_BITS=64 -mtune=i686 -march=i386 -I/home/tuitfun/include -L/home/tuitfun/lib
CFLAGS=-W -Wall -O3 -D_FILE_OFFSET_BITS=64 -march=haswell
DEBUGGER_CFLAGS=-W  -march=haswell
LDFLAGS=-lavcodec -lavformat -lavdevice -lavutil -lswscale -lavutil -lgd -lfreetype -ljpeg  -lvpx -laom -lva-drm -lx264 -lx265 -lavc1394  -lz -lm -lpthread -logg  

#LIBS=/home/tuitfun/lib/libavcodec.a /home/tuitfun/lib/libavformat.a /home/tuitfun/lib/libavutil.a /home/tuitfun/lib/libswscale.a
#LIBS=/usr/lib/libgd.a

all: mtn mtn_debug

mtn: mtn.c Makefile
	gcc -o mtn mtn.c -s $(CFLAGS) $(LDFLAGS) $(LIBS)

mtn_debug: mtn.c Makefile
	gcc  -ggdb -g -o mtn_debug mtn.c $(DEBUGGER_CFLAGS) $(LDFLAGS) $(LIBS)

clean:
	rm -f mtn 


