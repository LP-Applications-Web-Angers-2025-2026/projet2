all: bin/add_vectors.exe

bin/add_vectors.exe: obj/add_vectors.o obj/add_vectors_reference_O2.o
	g++ -o $@ -std=c++11 -mavx2 -O3 $^

obj/add_vectors.o: src/add_vectors.cpp
	g++ -c -o $@ -std=c++11 -mavx2 -O3 $^

obj/add_vectors_reference_O2.o: src/add_vectors_reference.cpp
	g++ -c -o $@ -std=c++11 -O1 $<
	g++ -S -masm=intel -std=c++11 -O1 $<
	
clean:
	@echo "clean chapter_8..." ;\
	rm -rf obj/*.o bin/*.exe
	

