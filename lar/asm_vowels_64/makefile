# =====================================================================
# author: Jean-Michel RICHER
# email: jean-michel.richer@univ-angers.fr
# date: January 2019
# =====================================================================

PROJECT_NAME=$(shell cat cfg/project.cfg | grep "^PROJECT_NAME=" | cut -d'=' -f2)
PROJECT_VERSION=$(shell cat cfg/project.cfg | grep "^PROJECT_VERSION=" | cut -d'=' -f2)
PROJECT_DIR=$(shell pwd)

TODAY=$(shell date '+%Y_%m_%d_%Hh_%M')
TAR_ARCHIVE_NAME="$(HOME)/export/$(PROJECT_NAME)_$(PROJECT_VERSION)_$(TODAY).tgz"
ZIP_ARCHIVE_NAME="$(HOME)/export/$(PROJECT_NAME).zip"

BUILD_DIR=build
OBJ_DIR=$(BUILD_DIR)/obj
BIN_DIR=$(BUILD_DIR)/bin
SRC_DIR=src

MEMORY_MODEL=$(addprefix -m,$(shell cat cfg/project.cfg | grep "MEMORY_MODEL=" | cut -d'=' -f2))

ifeq ($(MEMORY_MODEL),-m32)
NFLAGS=-f elf
else
NFLAGS=-f elf64
endif


ifeq ($(compiler),)
  compiler=gnu
endif

ifeq ($(distrib),)
  distrib=release
endif

CPU_TECHNOS=$(shell cat cfg/cpu_technos_$(compiler).mak)


# ===================================================================
# COMPILERS
# ===================================================================
include cfg/compilers.cfg

# ===================================================================
# SOURCE, OBJECTS
# ===================================================================
CPP_SRCS=$(shell ls $(SRC_DIR)/*.cpp)
ASM_SRCS=$(shell ls $(SRC_DIR)/*.asm)
SRCS=$(CPP_SRCS) $(ASM_SRCS)
OBJS_CPP=$(subst .cpp,.o,$(subst $(SRC_DIR),$(OBJ_DIR),$(CPP_SRCS)))
OBJS_ASM=$(subst .asm,.o,$(subst $(SRC_DIR),$(OBJ_DIR),$(ASM_SRCS)))
OBJS=$(OBJS_CPP) $(OBJS_ASM)
TARGET=$(BIN_DIR)/$(PROJECT_NAME).exe

all: info create_build_dirs $(TARGET)

build: all

configure:
	@echo "- determine cpu technologies..."
	@./resources/cpu_technos.sh `./resources/cpu_name.sh`

INFO_FLAGS=$(addprefix "\\n\\t\\t",$(foreach option,$(CXXFLAGS_O3),$(option)))

info:
	@echo "================================================="
	@echo " Project: $(PROJECT_NAME)"
	@echo " Version: $(PROJECT_VERSION)"
	@echo "================================================="
	@echo "> distrib  = $(distrib)"
	@echo "> compiler = $(compiler)"
	@echo "> CXXFLAGS_O3 = { $(INFO_FLAGS)"
	@echo "                }"
	@echo "================================================="
	
create_build_dirs:
	@echo "- create build directories ..."
	@mkdir -p $(OBJ_DIR) $(BIN_DIR)
	
debug:
	make --no-print-directory distrib=debug
		
$(TARGET): $(OBJS)
	@echo "- link as $@"
	@$(CPP) -o $@ $^ $(CXXFLAGS_O3)
	@echo "================================================="

$(OBJ_DIR)/%_O2.o: $(SRC_DIR)/%_O2.cpp
	@echo "- compile $<"
	@$(CPP) -c -o $@ $< $(CXXFLAGS_O2)

$(OBJ_DIR)/%_O3.o: $(SRC_DIR)/%_O3.cpp
	@echo "- compile $<"
	@$(CPP) -c -o $@ $< $(CXXFLAGS_O3)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	@echo "- compile $<"
	@$(CPP) -c -o $@ $< $(CXXFLAGS_O3)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.asm
	@echo "- assemble $<"
	@nasm $(NFLAGS) $< -o $@

clean:
	@echo "- clean ..." 
	@rm -rf $(OBJ_DIR)/*.o $(BIN_DIR)/*.exe

test:
	$(TARGET) -t

	
performance: $(TARGET)
	./performance_test.php
	./performance_graph.php
	
validity: $(TARGET)
	./valididty_test.php

compile:
	@make --no-print-directory clean
	@make --no-print-directory configure
	@make --no-print-directory 

test_methods: compile
	./test_methods.sh

run: compile
	@make --no-print-directory performance

archive: clean
	@echo "- generate archive " ;\
	mkdir -p ~/export ;\
	date +'%Y/%m/%d %Hh%M' >timestamp ;\
	echo "file:\n$(TAR_ARCHIVE_NAME)" ;\
	mkdir -p `dirname $(TAR_ARCHIVE_NAME)` ;\
	cd .. ; \
	tar -czf $(TAR_ARCHIVE_NAME) $(PROJECT_NAME) ; \
	zip -r $(ZIP_ARCHIVE_NAME) $(PROJECT_NAME) ; \
	echo "--------------------------------" ;\
	echo "Archive send to:" ; \
	echo "$(TAR_ARCHIVE_NAME)" ;\
	echo "$(ZIP_ARCHIVE_NAME)" ;\
	cd $(PROJECT_DIR) ;\
	cat timestamp

CASCADELAKE_FLAGS= -O3 -march=cascadelake -m64 -Wall   -mavx2  -mpopcnt  -mfma  -mbmi  -mbmi2  -ftree-vectorize -funroll-loops -std=c++11

cascadelake_gen_s:
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/count_vowels_avx2_intrinsics.cpp
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/count_vowels_avx512_intrinsics_v2.cpp
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/gnu_gpl.cpp
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/signal_handler.cpp
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/count_vowels_avx512_intrinsics_v1.cpp
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/cpu_timer.cpp
	gcc -S -masm=intel $(CASCADELAKE_FLAGS) src/main.cpp
	mv *.s src

cascadelake:  $(OBJS_ASM) 
	as -o build/obj/count_vowels_avx2_intrinsics.o src/count_vowels_avx2_intrinsics.s
	as -o build/obj/count_vowels_avx512_intrinsics_v2.o src/count_vowels_avx512_intrinsics_v2.s
	as -o build/obj/gnu_gpl.o src/gnu_gpl.s
	as -o build/obj/signal_handler.o src/signal_handler.s
	as -o build/obj/count_vowels_avx512_intrinsics_v1.o src/count_vowels_avx512_intrinsics_v1.s
	as -o build/obj/cpu_timer.o src/cpu_timer.s
	as -o build/obj/main.o src/main.s
	g++ -o $(TARGET) $(OBJ_DIR)/*.o
	
	
	
	
	
