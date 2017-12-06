EXEC = hey
CXXFLAGS = -Wall

all: $(EXEC)
$(EXEC) : hello.o
	$(CXX) $(CXXFLAGS) -o $@ $^
hello.o: hello.c
	$(CXX) $(CXXFLAGS) -c $^
clean:
	$(RM) hello.o
mrproper: clean
	$(RM) $(EXEC)
