#!/bin/sh

# Forward all arguments to cmake commands

# Configure build directory
cmake -S . -B build -DCMAKE_BUILD_TYPE=Debug "$@"
if [ $? -ne 0 ]; then
  echo "Configuring failed."
  exit 1
fi

echo "Configured successfully."

# Build the project
cmake --build build --config Debug "$@"
if [ $? -ne 0 ]; then
  echo "Build failed."
  exit 1
fi

echo "Build completed successfully."

# Run OS-specific command (Linux/macOS)
echo "Detected Linux/macOS OS."

# Adjust path and function name as needed
nm ./build/main | grep myFunction