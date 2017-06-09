# older ffmpeg doesn't have swscale. you might need to build a newer ffmpeg from source

CFLAGS=-w -O3 -s -D_FILE_OFFSET_BITS=64
LDFLAGS= -lavcodec -lavformat -lavcodec -lswscale -lavutil -lavresample -lgd -lfreetype -ljpeg -lpng -lx264 -lx265 -lvpx -lvorbis -logg -lmp3lame -lfdk-aac -lopus -ltheora -lvorbisenc
DYNLIBS= -lfontconfig
LIBS+= -lz -lm -lpthread -ldl -fPIC -lstdc++

all: mtn mtns

mtn: mtn.c Makefile
	$(CC) -o mtn mtn.c $(CFLAGS) $(LDFLAGS) $(DYNLIBS) $(LIBS)

mtns: mtn.c Makefile
	$(CC) -o mtns mtn.c $(CFLAGS) -Wl,-Bstatic $(LDFLAGS) -Wl,-Bdynamic $(DYNLIBS) $(LIBS)

clean:
	rm -f mtn mtns
