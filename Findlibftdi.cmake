# - Try to find libftdi
#
# Once done this will define
#
#  LIBFTDI_FOUND - system has libftdi
#  LIBFTDI_INCLUDE_DIR - the libftdi include directory
#  LIBFTDI_LIBRARIES - Link these to use libftdi

find_package(PkgConfig)
if (PKG_CONFIG_FOUND)
    pkg_check_modules(PC_LIBFTDI QUIET libftdi1)
endif()

find_path(LIBFTDI_INCLUDE_DIR
    NAMES ftdi.h
    HINTS ${PC_LIBFTDI_INCLUDE_DIRS}
          /usr/include/libftdi1
    PATHS /usr/include
          /usr/local/include
)

find_library(LIBFTDI_LIBRARIES
    NAMES ftdi1
    HINTS ${PC_LIBFTDI_LIBRARY_DIRS}
    PATHS /usr/lib
          /usr/local/lib
)

if(PC_LIBFTDI_FOUND)
    set(LIBFTDI_VERSION ${PC_LIBFTDI_VERSION})
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibFTDI
    FOUND_VAR LIBFTDI_FOUND
    REQUIRED_VARS LIBFTDI_LIBRARIES LIBFTDI_INCLUDE_DIR
    VERSION_VAR LIBFTDI_VERSION)

mark_as_advanced(LIBFTDI_INCLUDE_DIR LIBFTDI_LIBRARIES)
