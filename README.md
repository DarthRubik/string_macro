# string_macro


## What is string_macro

String macro is a cmake script that is designed to let you generate C++ from inside native C++ by adding a build command to CMake.  It is designed to make generating repetitive files less tedious.

## Building string_macro

To use string_macro, you do not need to actually build this project.....the only thing that would do is run the automated tests.....All you need to do is take the script that you want to use in your build and put it in your build tree, and then start using it.

## Using string_macro

To use this suppose that you have a file that you want to generate (call it generated.hpp).  First, what you do is create a generator file....in our case this is going to be called generator.cpp:

    #include <string>
    
    std::string code = "void foo();" //Obviously you can do some thing more sofisticated that this

    GENERATE_CODE(code)  //This needs to be in the global namespace at namespace scope

Then we will use it in our main.cpp"

    #include "generated.hpp"  //This file was generated for us

    int main()
    {
    }

And then we set up the CMakeLists.txt as so:

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

    add_executable(main main.cpp)

    #Then you just link the header library to your
    #executable (or library) as normal and you are
    #good to go
    target_link_libraries(main single_generated_header_library)
