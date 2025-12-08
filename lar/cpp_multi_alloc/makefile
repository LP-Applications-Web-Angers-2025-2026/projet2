all: bin/main_1.exe bin/main_2.exe

CPP_FLAGS= -std=c++17 -O3

bin/main_1.exe: obj/main_1.o obj/cpu_timer.o obj/memory_mgr.o
	g++ -o $@ $^ $(CPPFLAGS)

bin/main_2.exe: obj/main_2.o obj/cpu_timer.o obj/memory_mgr.o
	g++ -o $@ $^ $(CPPFLAGS)
	
obj/%.o: src/%.cpp
	g++ -c -o $@ $< $(CPPFLAGS)
	
clean:
	rm -rf bin/*.exe obj/*.o

