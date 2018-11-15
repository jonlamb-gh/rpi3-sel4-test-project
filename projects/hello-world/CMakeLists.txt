cmake_minimum_required(VERSION 3.7.2)

project(hello-world C)

set(configure_string "")

set(
    BuildWithCommonSimulationSettings
    ON
    CACHE BOOL
    "Include common simulation compatible configurations and utilities")

# TODO - seems this is no longer needed
config_option(
    UserDebugBuild
    USER_DEBUG_BUILD
    "Enable user debugging."
    DEFAULT ON
)

if(BuildWithCommonSimulationSettings)
    # TODO - only useful for x86, come back and add kernel_arch parameter
    #ApplyCommonSimulationSettings($)
    GenerateSimulateScript()
endif()

# TODO - this tries to infer the desired elfloader image type
# this is explicity prescribed in this project for now
#ApplyData61ElfLoaderSettings()

if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
    set(KernelPrinting OFF CACHE BOOL "" FORCE)
    set(KernelDebugBuild OFF CACHE BOOL "" FORCE)
    set(UserDebugBuild OFF CACHE BOOL "" FORCE)
    set(LibSel4PlatSupportUseDebugPutChar OFF CACHE BOOL "" FORCE)
    set(LibUtilsDefaultZfLogLevel "5" CACHE STRING "" FORCE)
else()
    set(KernelPrinting ON CACHE BOOL "" FORCE)
    set(KernelDebugBuild ON CACHE BOOL "" FORCE)
    set(UserDebugBuild ON CACHE BOOL "" FORCE)
    set(LibSel4PlatSupportUseDebugPutChar ON CACHE BOOL "" FORCE)
    set(LibUtilsDefaultZfLogLevel "0" CACHE STRING "" FORCE)
endif()

add_executable(
    hello-world
    src/main.c)

# TODO - no longer needed
include_directories(${CMAKE_BINARY_DIR}/generated)

add_config_library(
    hello-world
    "${configure_string}")

set_property(
    TARGET
    hello-world
    PROPERTY
    C_STANDARD
    99)

target_compile_options(
    hello-world
    PRIVATE
    -Wall
    -Wextra
    -Wshadow
    -Wno-unused-parameter
    -Wwrite-strings
    -Wstrict-prototypes
    -Wold-style-definition
    -Wnested-externs
#    -Wmissing-include-dirs
    -Wno-unused-result
    -Werror)

target_link_libraries(
    hello-world
    Configuration
    muslc
    sel4
    sel4utils
    sel4muslcsys
    sel4debug
    utils
    cpio
    elf)

DeclareRootserver(hello-world)
