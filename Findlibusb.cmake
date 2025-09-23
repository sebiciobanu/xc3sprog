# - Try to find legacy libusb
#
# Once done this will define
#

#  LIBUSB_FOUND - system has libusb
#  LIBUSB_INCLUDE_DIR - the libusb include directory
#  LIBUSB_LIBRARIES - Link these to use libusb

find_path(LIBUSB_INCLUDE_DIR
    NAMES
        usb.h
    PATHS
        /usr/include
        /usr/local/include
)

find_library(LIBUSB_LIBRARIES
    NAMES
        usb
    PATHS
        /usr/lib
        /usr/local/lib
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibUSB
    FOUND_VAR LIBUSB_FOUND
    REQUIRED_VARS LIBUSB_LIBRARIES LIBUSB_INCLUDE_DIR)

mark_as_advanced(LIBUSB_INCLUDE_DIR LIBUSB_LIBRARIES)
