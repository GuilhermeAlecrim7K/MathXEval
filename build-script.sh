#!/bin/bash

# Script directory
script_dir="$(dirname "$(readlink -f "$0")")"

# Project file
input_file_name="Calculate.pp"
input_file="$script_dir/src/$input_file_name"

# Output file (without extension)
output_file="${input_file_name%.*}"

# Compile the input file with fpc
fpc "$input_file" -FE"$script_dir/bin/" -FU"$script_dir/src/obj"

# Check if compilation was successful
if [ $? -eq 0 ]; then
    # Set executable permissions on the output file
    chmod +x "$script_dir/bin/$output_file"
    echo "Compilation successful. Executable file created: $script_dir/bin/$output_file"
else
    echo "Compilation failed for $input_file"
fi
