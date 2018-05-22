project(SINGLE_GENERATED)


add_library(single_generated_header_library INTERFACE)

generate_header(${SINGLE_GENERATED_BINARY_DIR} 
	single_generated_header_library generator.cpp generated.hpp)

add_executable(single_generated_main main.cpp)
target_link_libraries(single_generated_main single_generated_header_library)
