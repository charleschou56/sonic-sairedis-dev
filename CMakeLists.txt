set(PROJECT_NAME syncdTest)

project(${PROJECT_NAME})
cmake_minimum_required(VERSION 3.5 FATAL_ERROR)

#find_program(MAKE_EXE NAMES gmake nmake make)

set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
message(STATUS "CMAKE_MODULE_PATH: " ${CMAKE_MODULE_PATH})

find_package(Gtest REQUIRED)
message(STATUS "GTEST_INCLUDE_DIR: " ${GTEST_INCLUDE_DIR})
message(STATUS "GTEST_LIBRARIES: " ${GTEST_LIBRARIES})
message(STATUS "======================================")

## Add definitions
add_definitions(-std=c++11)
add_definitions(-g -O0)

set(SRC_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(BUILD_PATH ${CMAKE_CURRENT_BINARY_DIR})
set(SWSSCOMM_PATH "${CMAKE_CURRENT_SOURCE_DIR}/sonic-swss-common/")
set(SAIREDIS_PATH "${CMAKE_CURRENT_SOURCE_DIR}/sonic-sairedis/")
message(STATUS "build path: " ${BUILD_PATH})

## syncdTest ######################################################
file(GLOB TESTS
    tests/main.cpp
    tests/test_syncd.cpp
)

add_executable(${PROJECT_NAME}
   ${TESTS}
)

target_link_libraries(${PROJECT_NAME} ${GTEST_LIBRARIES})
target_link_libraries(${PROJECT_NAME} pthread)