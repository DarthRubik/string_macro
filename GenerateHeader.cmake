cmake_minimum_required(VERSION 2.8.7)

function(generate_header PROJECT_BINARY_DIR LIBRARY GENERATOR GENERATED)
	add_executable(${GENERATOR}.o ${GENERATOR})
	set(CURRENT_FLAGS "-include iostream -D\"GENERATE_CODE(x)=int main(){ std::cout << x << std::endl; }\"")
	set_source_files_properties(
		${GENERATOR} PROPERTIES COMPILE_FLAGS "${CURRENT_FLAGS}")
	target_sources(${LIBRARY} INTERFACE ${PROJECT_BINARY_DIR}/${GENERATED})
	target_link_libraries(${LIBRARY} INTERFACE ${PROJECT_BINARY_DIR}/${GENERATED})
	target_include_directories(${LIBRARY} INTERFACE ${PROJECT_BINARY_DIR})
	add_custom_command(
		OUTPUT ${PROJECT_BINARY_DIR}/${GENERATED}
		COMMAND $<TARGET_FILE:${GENERATOR}.o> > ${PROJECT_BINARY_DIR}/${GENERATED}
		DEPENDS ${GENERATOR}
	)
endfunction()
