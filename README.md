# Template Project

This is a cross-platform C++ project template that uses CMake for building. It supports both Linux and Windows platforms.

## Prerequisites

- CMake (version 3.10 or higher)
- A C++ compiler (e.g., GCC for Linux, MinGW for Windows)
- Make (for building the project)

## Project Structure

/project-root <br>
├── /build # Contains build directories for each platform <br>
│       ├── /linux <br>
│       └── /windows <br>
├── /src # Source files (.cpp) <br>
├── /include # Header files (.h) <br>
├── /static # Static files (resources, icons, etc.) <br>
│       ├── icon.png <br>
│       ├── desktop_template.desktop.in <br>
│       └── resource_template.rc.in <br>
├── CMakeLists.txt # CMake configuration file <br>
├── compile_linux.bash # Bash script for building on Linux <br>
└── compile_windows.bat # Batch script for building on Windows<br>

## Building the Project

### For Linux

1. Open a terminal.
2. Navigate to the project directory.
3. Run the build script:
   ```bash
   ./compile_linux
   ```
### For Windows

1. Open Command Prompt.
2. Navigate to the project directory.
3. Run the build script:
   ```bat
   compile_windows.bat
   ```

## Output
After building, the compiled executables will be located in the `build/release` directory. Both Linux and Windows builds will output their respective executables here.

## Customizing Metadata

You can customize the metadata for your application in the CMakeLists.txt file:

- PROJECT_NAME: Set the name of your app.
- PROJECT_DESCRIPTION: Set a description for your project.
- COMPANY_NAME: Set the name of your company.
- ICON_PATH: Set the path to the icon file for your application.

## Excluded Files

You can exclude specific files from being copied to the release directory by adding them to the `EXCLUDED_FILES` list in the `CMakeLists.txt` file.

## Running the Application
### On Linux

You can run the application by executing the binary directly:
```bash
./build/release/template
```

Make sure to set the executable permissions for the .desktop file:

```bash
chmod +x build/release/template.desktop
```

### On Windows

You can run the application by double-clicking the executable in the `build/release` directory or using the command line:

```cmd
build\release\template.exe
```