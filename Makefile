CC     := gcc
CFLAGS := -Wall -Werror -g

.PHONY: all

run: server client lib

server: server.o udp.o
	${CC} -o server server.o udp.o ${CFLAGS}

client: client.o udp.o
	${CC} -o client client.o udp.o ${CFLAGS}

lib: mfs.o udp.o
	${CC} -o libmfs.so mfs.c udp.c ${CFLAGS} -shared -fPIC

%.o: %.c
	${CC} ${CFLAGS} -c $<

clean:
	rm -f server.o client.o udp.o libmfs.so mfs.o server client lib runtests.log
