# the name of the target operating system
SET(CMAKE_SYSTEM_NAME      Windows)
SET(CMAKE_SYSTEM_PROCESSOR i686)
SET(COMPILER_PREFIX ${CMAKE_SYSTEM_PROCESSOR}-w64-mingw32)

# which compilers to use for C and C++ and ASM-ATT
find_program(CMAKE_RC_COMPILER NAMES ${COMPILER_PREFIX}-windres)
find_program(CMAKE_C_COMPILER NAMES ${COMPILER_PREFIX}-gcc)
find_program(CMAKE_CXX_COMPILER NAMES ${COMPILER_PREFIX}-g++)
find_program(CMAKE_CXX_COMPILER NAMES ${COMPILER_PREFIX}-as)

SET(CMAKE_FIND_ROOT_PATH  /usr/${COMPILER_PREFIX} ${USER_ROOT_PATH})

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search 
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
