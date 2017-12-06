SRC = proj.c genealogie.c
OBJ  := $(SRC:%.c=%.o)
TARGET = proj

CFLAGS = -Wall -I ./

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

mrproper: clean
	$(RM) $(OBJ)
clean:
	$(RM) $(TARGET)
