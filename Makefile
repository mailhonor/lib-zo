all: libzc_coroutine.a all_test

CC=gcc

CFLAGS= -std=gnu99 -Wall -Winline -I./ -O2 -g -ggdb


libzc_coroutine.a: coroutine.c coroutine.h
	@echo build $<
	$(CC) -o libzc_coroutine.o -c coroutine.c $(CFLAGS)
	ar r libzc_coroutine.a libzc_coroutine.o
	ranlib libzc_coroutine.a
	rm libzc_coroutine.o

TEST_SRCS = $(wildcard *_test.c)
TEST_OBJS = $(patsubst %.c, %, $(TEST_SRCS))

$(TEST_OBJS):libzc_coroutine.a

$(TEST_OBJS):%:%.c
	@echo build $@
	$(CC) -o $@ $@.c $(CFLAGS) libzc_coroutine.a -lresolv -lpthread

all_test:$(TEST_OBJS)

clean:
	rm -f libzc_coroutine.a $(TEST_OBJS)
	rm -f tags gmon.out a.txt
	find -type f -name "*.o" -exec rm {} \;
	find -type f -name "*~" -exec rm {} \;

