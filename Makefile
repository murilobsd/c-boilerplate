CC=		gcc

CFLAGS+=	-I. -Wall
CFLAGS+=	-std=c89 \
		-O0 

COVFLAGS=	-fprofile-arcs -ftest-coverage


EXAMPLESRC=	example/main.c

sum.o: sum.h
	${CC} -c sum.c ${CFLAGS} ${COVFLAGS}

app: sum.o
	${CC} -o $@ ${EXAMPLESRC} $< ${CFLAGS}

coverage: sum.o
	${CC} -o app ${EXAMPLESRC} $< ${CFLAGS} ${COVFLAGS}

all: app

.PHONY: clean

clean:
	rm -f *.core *.o app core *~ *.gcno *.gcov
