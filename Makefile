#change the name of the program here
NAME=helloworld

# default value of CC
CC ?= gcc

#install bin patch
bindir=/bin

#add extra c file to compile here
EXTRA_SRC=

#add extra library to compile here
LIBS=

#what should be done by default - 1st target
all: $(NAME)

#generate a list of object (.o) files
OBJS=$(patsubst %.c,%.o,$(NAME).c $(EXTRA_SRC))

#main program depend on all objects, rest is done by implicit rules
$(NAME): $(OBJS)
	${CC} ${LDFLAGS} -o ${NAME} ${OBJS} ${LIBS}

install:
	install -d $(DESTDIR)$(bindir)
	install -m 0755 $(NAME) $(DESTDIR)$(bindir)

#clean up rule
clean:
	rm -f $(NAME) $(OBJS)
	
test: $(NAME)
	./$(NAME)

#all, clean are phony rules, e.g. they should always run
.PHONY: all clean test
