if(NOT LIBOSMOSDR_FOUND)
  pkg_check_modules (LIBOSMOSDR_PKG libosmosdr)
  find_path(LIBOSMOSDR_INCLUDE_DIRS NAMES osmosdr.h
    PATHS
    ${LIBOSMOSDR_PKG_INCLUDE_DIRS}
    /usr/include
    /usr/local/include
  )

  find_library(LIBOSMOSDR_LIBRARIES NAMES osmosdr
    PATHS
    ${LIBOSMOSDR_PKG_LIBRARY_DIRS}
    /usr/lib
    /usr/local/lib
  )

if(LIBOSMOSDR_INCLUDE_DIRS AND LIBOSMOSDR_LIBRARIES)
  set(LIBOSMOSDR_FOUND TRUE CACHE INTERNAL "libosmosdr found")
  message(STATUS "Found libosmosdr: ${LIBOSMOSDR_INCLUDE_DIRS}, ${LIBOSMOSDR_LIBRARIES}")
else(LIBOSMOSDR_INCLUDE_DIRS AND LIBOSMOSDR_LIBRARIES)
  set(LIBOSMOSDR_FOUND FALSE CACHE INTERNAL "libosmosdr found")
  message(STATUS "libosmosdr not found.")
endif(LIBOSMOSDR_INCLUDE_DIRS AND LIBOSMOSDR_LIBRARIES)

mark_as_advanced(LIBOSMOSDR_LIBRARIES LIBOSMOSDR_INCLUDE_DIRS)

endif(NOT LIBOSMOSDR_FOUND)
