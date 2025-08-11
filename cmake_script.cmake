# build_and_run.cmake


# Base config command
set(config_command ${CMAKE_COMMAND} -S . -B build -DCMAKE_BUILD_TYPE=Debug)

# Append all script arguments to config_command list
foreach(arg IN LISTS ARGV)
list(APPEND config_command "${arg}")
endforeach()

# Configure the build directory
execute_process(COMMAND ${config_command}
                RESULT_VARIABLE res_config
                OUTPUT_VARIABLE out_config
                ERROR_VARIABLE err_config)

if(NOT res_config EQUAL 0)
  message(FATAL_ERROR "Configuring failed: ${err_config}")
endif()

message(STATUS "Configured successfully.")

# Base build command
set(config_command ${CMAKE_COMMAND} --build build --config Debug)

# Append all script arguments to config_command list
foreach(arg IN LISTS ARGV)
list(APPEND config_command "${arg}")
endforeach()


# Build the project
execute_process(COMMAND ${config_command}
                RESULT_VARIABLE res_build
                OUTPUT_VARIABLE out_build
                ERROR_VARIABLE err_build)

if(NOT res_build EQUAL 0)
  message(FATAL_ERROR "Build failed: ${err_build}")
endif()

message(STATUS "Build completed successfully.")

# Run different commands depending on OS
if(CMAKE_HOST_SYSTEM_NAME STREQUAL "Windows")

  message(STATUS "Detected Windows OS.")
  execute_process(COMMAND dumpbin /symbols .\\build\\main.dir\\Debug\\main.obj | findstr /l "myFunction(int,double)" ECHO_OUTPUT_VARIABLE)

elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL "Linux")

  message(STATUS "Detected Linux OS.")
  execute_process(COMMAND nm ./build/main.exe | grep "myFunction" ECHO_OUTPUT_VARIABLE)

else()
  message(WARNING "Unknown OS: ${CMAKE_HOST_SYSTEM_NAME}")
endif()
