# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appSimpleCalulator_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appSimpleCalulator_autogen.dir\\ParseCache.txt"
  "appSimpleCalulator_autogen"
  )
endif()
