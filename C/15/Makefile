SRC = genealogie.c proj.c copieur.c lecteur.c
OBJ  := $(SRC:%.c=%.o)
TARGET = proj copieur lecteur

CFLAGS = -Wall -I ./

all: $(TARGET)

proj: genealogie.o proj.o
	$(CC) -o $@ $^

copieur: copieur.o
	$(CC) -o $@ $^

lecteur: lecteur.o
	$(CC) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

mrproper: clean
	$(RM) $(OBJ)
clean:
	$(RM) $(TARGET)
