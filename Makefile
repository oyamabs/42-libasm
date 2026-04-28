CC = cc
ASM = nasm
# -fno-omit-frame-pointer is to prevent malloc stacktraces from being truncated,
# see "My malloc stacktraces are too short" here:
# https://github.com/google/sanitizers/wiki/AddressSanitizer
SANITIZERS = -fsanitize=address,undefined -fno-omit-frame-pointer
ifeq ($(CFLAGS),)
	CFLAGS = -Wall -Wextra -Werror -g
endif
ASMFLAGS = -f elf64
IFLAGS = 

SOURCEFILES = src/ft_strlen.S \
			  src/ft_strcpy.S \
			  src/ft_strcmp.S \
			  src/ft_write.S \
			  src/ft_read.S \
			  src/ft_strdup.S \

OBJECTS = $(SOURCEFILES:.S=.o)
NAME = libasm.a
DEPS = $(OBJECTS:.o=.d)

.PHONY: all clean fclean bonus re sane test

all: $(OBJECTS) $(NAME)

-include $(DEPS)

$(NAME): $(OBJECTS)
	ar rcs $(NAME) $(OBJECTS)

%.o: %.S
	$(ASM) $(ASMFLAGS) $(IFLAGS) -o $*.o $*.S

clean:
	find . -name '*.o' -print -delete

fclean: clean
	rm -f $(NAME) tester

test: CFLAGS += $(SANITIZERS)
test:
	$(CC) $(CFLAGS) src/test.c -o tester -L. -lasm
	./tester

re:
	+make fclean
	+make all
	+make test
