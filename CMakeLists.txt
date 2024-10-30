cmake_minimum_required(VERSION 3.30.3)

include(cmake/CPM.cmake)

project(cpp-native)
add_executable(cpp-native src/main.cpp)

CPMAddPackage(
    NAME stdexec
    GITHUB_REPOSITORY NVIDIA/stdexec
    GIT_TAG main # This will always pull the latest code from the `main` branch. You may also use a specific release version or tag
)

target_include_directories(cpp-native PUBLIC
    ${CMAKE_INCLUDE_PATH}
)
target_compile_definitions(cpp-native PUBLIC)

target_link_libraries(cpp-native STDEXEC::stdexec)