# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake.exe

# The command to remove a file.
RM = /usr/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /c/Users/wilson/program/project/task_scheduler

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /c/Users/wilson/program/project/task_scheduler

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/bin/ccmake.exe -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake.exe --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /c/Users/wilson/program/project/task_scheduler/CMakeFiles /c/Users/wilson/program/project/task_scheduler//CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /c/Users/wilson/program/project/task_scheduler/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named main.elf

# Build rule for target.
main.elf: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 main.elf
.PHONY : main.elf

# fast build rule for target.
main.elf/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/build
.PHONY : main.elf/fast

cmsis_device_f1/Source/Templates/system_stm32f1xx.o: cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o
.PHONY : cmsis_device_f1/Source/Templates/system_stm32f1xx.o

# target to build an object file
cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o
.PHONY : cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o

cmsis_device_f1/Source/Templates/system_stm32f1xx.i: cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i
.PHONY : cmsis_device_f1/Source/Templates/system_stm32f1xx.i

# target to preprocess a source file
cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i
.PHONY : cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i

cmsis_device_f1/Source/Templates/system_stm32f1xx.s: cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s
.PHONY : cmsis_device_f1/Source/Templates/system_stm32f1xx.s

# target to generate assembly for a file
cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s
.PHONY : cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s

src/scheduler.o: src/scheduler.c.o
.PHONY : src/scheduler.o

# target to build an object file
src/scheduler.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/src/scheduler.c.o
.PHONY : src/scheduler.c.o

src/scheduler.i: src/scheduler.c.i
.PHONY : src/scheduler.i

# target to preprocess a source file
src/scheduler.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/src/scheduler.c.i
.PHONY : src/scheduler.c.i

src/scheduler.s: src/scheduler.c.s
.PHONY : src/scheduler.s

# target to generate assembly for a file
src/scheduler.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/src/scheduler.c.s
.PHONY : src/scheduler.c.s

src/task.o: src/task.c.o
.PHONY : src/task.o

# target to build an object file
src/task.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/src/task.c.o
.PHONY : src/task.c.o

src/task.i: src/task.c.i
.PHONY : src/task.i

# target to preprocess a source file
src/task.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/src/task.c.i
.PHONY : src/task.c.i

src/task.s: src/task.c.s
.PHONY : src/task.s

# target to generate assembly for a file
src/task.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/main.elf.dir/build.make CMakeFiles/main.elf.dir/src/task.c.s
.PHONY : src/task.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... main.elf"
	@echo "... cmsis_device_f1/Source/Templates/system_stm32f1xx.o"
	@echo "... cmsis_device_f1/Source/Templates/system_stm32f1xx.i"
	@echo "... cmsis_device_f1/Source/Templates/system_stm32f1xx.s"
	@echo "... src/scheduler.o"
	@echo "... src/scheduler.i"
	@echo "... src/scheduler.s"
	@echo "... src/task.o"
	@echo "... src/task.i"
	@echo "... src/task.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
