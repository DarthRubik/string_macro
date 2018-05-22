project(SINGLE_GENERATED)

#This is the library that the header file will be added to
#Note: that this library must be marked with INTERFACE
add_library(single_generated_header_library INTERFACE)

#This command generates the header and adds it to the 
#library given

#It is generated from the "generator.cpp" and the generated file
#is named generated.hpp
generate_header(${SINGLE_GENERATED_BINARY_DIR} 
	single_generated_header_library generator.cpp generated.hpp)

add_executable(single_generated_main main.cpp)

#Then you just link the header library to your
#executable (or library) as normal and you are
#good to go
target_link_libraries(single_generated_main single_generated_header_library)
