FILES := prog1.c
OBJ  := $(FILES:%.c=%.o)
EXEC := $(FILES:%.c=%.out)

CFLAGS = -Wall

all: $(EXEC)

%.out: %.o
	$(CC) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

mrproper: clean
	$(RM) $(OBJ)
clean:
	$(RM) $(EXEC)
