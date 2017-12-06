OBJ = hello
EXEC = hey
OPTIONS = 
CXXFLAGS := $(CXXFLAGS) -Wall $(OPTIONS)

all: $(EXEC)
$(EXEC) : $(OBJ).o
	$(CXX) $(CXXFLAGS) -o $(EXEC) $(OBJ).o
$(OBJ).o: hello.c
	$(CXX) $(CXXFLAGS) -c hello.c
clean:
	$(RM) $(OBJ).o
mrproper: clean
	$(RM) $(EXEC)
