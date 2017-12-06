all : hello

hello : hello.o
	g++ -o hello hello.c

hello.o: hello.c
	g++ -c hello.c

run : hello
	./hello

clean : 
	rm -f hello.o #le -f empêche l'erreur si le fichier a déjà été supprimé

mrproper : clean
	rm -f hello

.PHONHY: clean mrproper
