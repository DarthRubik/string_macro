project(MULTIPLE_PROJECTS_LIB2)

add_library(multiple_projects_lib2 INTERFACE)

generate_header(${MULTIPLE_PROJECTS_LIB2_BINARY_DIR} 
	multiple_projects_lib2 lib2generator.cpp lib2.hpp)
