project(MULTIPLE_PROJECTS_LIB1)

add_library(multiple_projects_lib1 INTERFACE)

generate_header(${MULTIPLE_PROJECTS_LIB1_BINARY_DIR} 
	multiple_projects_lib1 lib1generator.cpp lib1.hpp)
