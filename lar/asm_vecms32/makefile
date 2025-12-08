# =====================================================================
# author: Jean-Michel RICHER
# email: jean-michel.richer@univ-angers.fr
# date: January 2019
# =====================================================================

PROJECT_NAME=$(shell cat cfg/project.cfg | grep "^PROJECT_NAME=" | cut -d'=' -f2)
PROJECT_VERSION=$(shell cat cfg/project.cfg | grep "^PROJECT_VERSION=" | cut -d'=' -f2)
PROJECT_DIR=$(shell pwd)

TODAY=$(shell date '+%Y_%m_%d_%Hh_%M')
ARCHIVE="$(HOME)/export/$(PROJECT_NAME)_$(PROJECT_VERSION)_$(TODAY).tgz"

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

all: info create_build_dirs $(BIN_DIR)/main_case.exe $(BIN_DIR)/main_data.exe $(BIN_DIR)/main_text.exe

build: all

configure:
	@echo "- determine cpu technologies..."
	@./cpu_technos.sh `./cpu_name.sh`

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
		
$(BIN_DIR)/main_case.exe: $(OBJS)
	@echo "- link as $@"
	@$(CPP) -o $@ $(CXXFLAGS_O3) $(OBJ_DIR)/cpu_timer.o $(OBJ_DIR)/main.o $(OBJ_DIR)/signal_handler.o $(OBJ_DIR)/cpu_timer_nasm.o $(OBJ_DIR)/vec_merge_sort_nasm_32_case.o $(OBJ_DIR)/gnu_gpl.o

$(BIN_DIR)/main_data.exe: $(OBJS)
	@echo "- link as $@"
	@$(CPP) -o $@ $(CXXFLAGS_O3) $(OBJ_DIR)/cpu_timer.o $(OBJ_DIR)/main.o $(OBJ_DIR)/signal_handler.o $(OBJ_DIR)/cpu_timer_nasm.o $(OBJ_DIR)/vec_merge_sort_nasm_32_data.o $(OBJ_DIR)/gnu_gpl.o

$(BIN_DIR)/main_text.exe: $(OBJS) $(OBJ_DIR)/main_writable.o 
	@echo "- link as $@"
	@$(CPP) -o $@ $(CXXFLAGS_O3) $(OBJ_DIR)/cpu_timer.o $(OBJ_DIR)/main_writable.o $(OBJ_DIR)/signal_handler.o $(OBJ_DIR)/cpu_timer_nasm.o $(OBJ_DIR)/vec_merge_sort_nasm_32_text.o $(OBJ_DIR)/gnu_gpl.o

$(OBJ_DIR)/main_writable.o: $(SRC_DIR)/main.cpp
	@$(CPP) -c -o $@ $< $(CXXFLAGS_O2) -DTEXT_SECTION_WRITABLE

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
	$(BIN_DIR)/main_case.exe 

performance:
	./compare.php
	

compile:
	@make --no-print-directory clean
	@make --no-print-directory configure
	@make --no-print-directory 

run:
	@make --no-print-directory clean
	@make --no-print-directory configure
	@make --no-print-directory 
	@make --no-print-directory performance

archive: clean
	@echo "- generate archive " ;\
	mkdir -p ~/export ;\
	date +'%Y/%m/%d %Hh%M' >timestamp ;\
	echo "file:\n$(ARCHIVE)" ;\
	mkdir -p `dirname $(ARCHIVE)` ;\
	cd .. ; \
	tar -czf $(ARCHIVE) $(PROJECT_NAME) ; \
	cd $(PROJECT_DIR) 	

