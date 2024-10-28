cmake_minimum_required(VERSION 3.10)
set(PROJECT_NAME "template")
project(${PROJECT_NAME})

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(include)

set(OUTPUT_DIR "${CMAKE_BINARY_DIR}/../release")
set(STATIC_DIR "${CMAKE_SOURCE_DIR}/static")
file(MAKE_DIRECTORY ${OUTPUT_DIR})
file(GLOB SOURCES "src/*.cpp")

set(PROJECT_DESCRIPTION "A sample project description")
set(COMPANY_NAME "Your Company")
set(ICON_PATH "icon")

set(EXCLUDED_FILES
    "desktop_template.desktop.in"
    "resource_template.rc.in"
)

configure_file(${STATIC_DIR}/resource_template.rc.in
               ${OUTPUT_DIR}/resource.rc @ONLY)

configure_file(${STATIC_DIR}/desktop_template.desktop.in
               ${OUTPUT_DIR}/${PROJECT_NAME}.desktop @ONLY)

if(UNIX)
    execute_process(COMMAND chmod +x ${OUTPUT_DIR}/${PROJECT_NAME}.desktop)
    add_executable(${PROJECT_NAME} ${SOURCES})
    # Link to any Unix-specific libraries, e.g. .so files
    # target_link_libraries(${PROJECT_NAME} ${STATIC_DIR}/mylib.so)
endif()

if(WIN32)
    add_executable(${PROJECT_NAME} ${SOURCES} ${OUTPUT_DIR}/resource.rc)
    # Link to any Windows-specific libraries, e.g. .dll files
    # target_link_libraries(${PROJECT_NAME} ${STATIC_DIR}/mylib.dll)
    target_compile_options(${PROJECT_NAME} PRIVATE -static-libgcc -static-libstdc++)
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUTPUT_DIR})

file(GLOB ALL_STATIC_FILES "${STATIC_DIR}/*")
foreach(EXCLUDED_FILE ${EXCLUDED_FILES})
    list(REMOVE_ITEM ALL_STATIC_FILES "${STATIC_DIR}/${EXCLUDED_FILE}")
endforeach()
file(COPY ${ALL_STATIC_FILES} DESTINATION ${OUTPUT_DIR})