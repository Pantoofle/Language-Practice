EXEC = hey
CXXFLAGS = -Wall

all: $(EXEC)
$(EXEC) : hello.o
	$(CXX) -o $@ $^

%.o: %.c
	$(CXX) $(CXXFLAGS) -o $@ -c $<
clean:
	$(RM) *.o
mrproper: clean
	$(RM) $(EXEC)
