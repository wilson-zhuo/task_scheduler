# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

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

# Include any dependencies generated for this target.
include CMakeFiles/main.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/main.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/main.elf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.elf.dir/flags.make

CMakeFiles/main.elf.dir/src/scheduler.c.o: CMakeFiles/main.elf.dir/flags.make
CMakeFiles/main.elf.dir/src/scheduler.c.o: src/scheduler.c
CMakeFiles/main.elf.dir/src/scheduler.c.o: CMakeFiles/main.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/c/Users/wilson/program/project/task_scheduler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/main.elf.dir/src/scheduler.c.o"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.elf.dir/src/scheduler.c.o -MF CMakeFiles/main.elf.dir/src/scheduler.c.o.d -o CMakeFiles/main.elf.dir/src/scheduler.c.o -c /c/Users/wilson/program/project/task_scheduler/src/scheduler.c

CMakeFiles/main.elf.dir/src/scheduler.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.elf.dir/src/scheduler.c.i"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /c/Users/wilson/program/project/task_scheduler/src/scheduler.c > CMakeFiles/main.elf.dir/src/scheduler.c.i

CMakeFiles/main.elf.dir/src/scheduler.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.elf.dir/src/scheduler.c.s"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /c/Users/wilson/program/project/task_scheduler/src/scheduler.c -o CMakeFiles/main.elf.dir/src/scheduler.c.s

CMakeFiles/main.elf.dir/src/task.c.o: CMakeFiles/main.elf.dir/flags.make
CMakeFiles/main.elf.dir/src/task.c.o: src/task.c
CMakeFiles/main.elf.dir/src/task.c.o: CMakeFiles/main.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/c/Users/wilson/program/project/task_scheduler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/main.elf.dir/src/task.c.o"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.elf.dir/src/task.c.o -MF CMakeFiles/main.elf.dir/src/task.c.o.d -o CMakeFiles/main.elf.dir/src/task.c.o -c /c/Users/wilson/program/project/task_scheduler/src/task.c

CMakeFiles/main.elf.dir/src/task.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.elf.dir/src/task.c.i"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /c/Users/wilson/program/project/task_scheduler/src/task.c > CMakeFiles/main.elf.dir/src/task.c.i

CMakeFiles/main.elf.dir/src/task.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.elf.dir/src/task.c.s"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /c/Users/wilson/program/project/task_scheduler/src/task.c -o CMakeFiles/main.elf.dir/src/task.c.s

CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o: CMakeFiles/main.elf.dir/flags.make
CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o: cmsis_device_f1/Source/Templates/system_stm32f1xx.c
CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o: CMakeFiles/main.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/c/Users/wilson/program/project/task_scheduler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o -MF CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o.d -o CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o -c /c/Users/wilson/program/project/task_scheduler/cmsis_device_f1/Source/Templates/system_stm32f1xx.c

CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /c/Users/wilson/program/project/task_scheduler/cmsis_device_f1/Source/Templates/system_stm32f1xx.c > CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.i

CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s"
	/mingw64/bin/cc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /c/Users/wilson/program/project/task_scheduler/cmsis_device_f1/Source/Templates/system_stm32f1xx.c -o CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.s

# Object files for target main.elf
main_elf_OBJECTS = \
"CMakeFiles/main.elf.dir/src/scheduler.c.o" \
"CMakeFiles/main.elf.dir/src/task.c.o" \
"CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o"

# External object files for target main.elf
main_elf_EXTERNAL_OBJECTS =

main.elf.exe: CMakeFiles/main.elf.dir/src/scheduler.c.o
main.elf.exe: CMakeFiles/main.elf.dir/src/task.c.o
main.elf.exe: CMakeFiles/main.elf.dir/cmsis_device_f1/Source/Templates/system_stm32f1xx.c.o
main.elf.exe: CMakeFiles/main.elf.dir/build.make
main.elf.exe: CMakeFiles/main.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/c/Users/wilson/program/project/task_scheduler/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable main.elf.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.elf.dir/build: main.elf.exe
.PHONY : CMakeFiles/main.elf.dir/build

CMakeFiles/main.elf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.elf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.elf.dir/clean

CMakeFiles/main.elf.dir/depend:
	cd /c/Users/wilson/program/project/task_scheduler && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /c/Users/wilson/program/project/task_scheduler /c/Users/wilson/program/project/task_scheduler /c/Users/wilson/program/project/task_scheduler /c/Users/wilson/program/project/task_scheduler /c/Users/wilson/program/project/task_scheduler/CMakeFiles/main.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.elf.dir/depend

