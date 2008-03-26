CC=gcc
CFLAGS=-g -Wall -Wshadow -Wpointer-arith -Wmissing-declarations -Wnested-externs #-static

N2N_LIB=n2n.a
N2N_OBJS=n2n.o minilzo.o twofish.o tuntap_linux.o tuntap_osx.o
LIBS=-lpthread

APPS=edge supernode

all: $(APPS)

edge: edge.c $(N2N_LIB) n2n.h Makefile
	$(CC) $(CFLAGS) edge.c $(N2N_LIB) $(LIBS) -o edge

supernode: supernode.c $(N2N_LIB) n2n.h Makefile
	$(CC) $(CFLAGS) supernode.c $(N2N_LIB) $(LIBS) -o supernode

.c.o: n2n.h Makefile
	$(CC) $(CFLAGS) -c $<

$(N2N_LIB): $(N2N_OBJS)
	ar rc $(N2N_LIB) $(N2N_OBJS)
#	$(RANLIB) $@


clean:
	rm -f $(N2N_OBJS) $(N2N_LIB) $(APPS) *~