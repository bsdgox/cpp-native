cmake_minimum_required(VERSION 3.30.3)

project(cpp-native)

find_package(folly REQUIRED)
add_executable(cpp-native src/main.cpp)
target_link_libraries(cpp-native folly::folly)
