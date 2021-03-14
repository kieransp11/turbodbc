get_filename_component(pybind11_path "${CMAKE_CURRENT_SOURCE_DIR}/pybind11" ABSOLUTE)

message(STATUS "Including Pybind11 via FethContent")
# https://pybind11.readthedocs.io/en/stable/compiling.html
FetchContent_Declare(
    pybind11
    GIT_REPOSITORY https://github.com/pybind/pybind11.git
    GIT_TAG v2.6.2
)
FetchContent_MakeAvailable(pybind11)

# if (pybind11_FOUND)
#     message(STATUS "Using local install of Pybind11")
# elseif(EXISTS ${pybind11_path} AND IS_DIRECTORY ${pybind11_path})
#     message(STATUS "Using submodule Pybind11")
#     add_subdirectory(${pybind11_path})
# else()

# endif()