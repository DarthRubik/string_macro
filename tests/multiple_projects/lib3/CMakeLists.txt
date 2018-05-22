project(MULTIPLE_PROJECTS_LIB3)

add_library(multiple_projects_lib3 INTERFACE)

generate_header(${MULTIPLE_PROJECTS_LIB3_BINARY_DIR} 
	multiple_projects_lib3 lib3generator.cpp lib3.hpp)
