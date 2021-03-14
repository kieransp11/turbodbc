cmake_minimum_required(VERSION 2.8.12)
project(turbodbc_intern CXX)

# Take precedence over system modules
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_SOURCE_DIR}/cmake_scripts)

include(FetchContent)
if(${CMAKE_VERSION} VERSION_LESS 3.14)
  include(cmake/add_FetchContent_MakeAvailable.cmake)
endif()

include(default_build_setup)

# Boost 1.70 comes with its own CMake config which is incompatible with
# using FindBoost.cmake from CMake. While we still support older Boost
# versions, rely on the CMake built-in.
set(Boost_NO_BOOST_CMAKE ON)

find_package(pybind11)
find_package(GTest)
add_subdirectory(cpp)
add_subdirectory(python)
add_subdirectory(docs)

if(BUILD_TESTING)
    enable_testing()
endif()

install(
	FILES setup.py setup.cfg MANIFEST.in Makefile LICENSE README.md CHANGELOG.rst
	DESTINATION .
)
