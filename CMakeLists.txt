cmake_minimum_required(VERSION 3.30.3)

project(cpp-native)

find_package(folly REQUIRED)
add_executable(cpp-native src/main.cpp)

target_include_directories(cpp-native PUBLIC
    ${CMAKE_INCLUDE_PATH}
)
target_compile_definitions(cpp-native PUBLIC GLOG_USE_GLOG_EXPORT)
target_link_libraries(cpp-native folly::folly)
