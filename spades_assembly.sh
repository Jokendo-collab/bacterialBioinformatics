#!/bin/bash

# Define input and output directories/files
input_dir="input_fastq"
output_dir="assembly_output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Define the path to SPAdes executable
spades_executable="/path/to/spades.py"

# Define the number of CPU threads to use
threads=24  # Adjust this based on your available CPU resources

# Run SPAdes for genome assembly
$spades_executable \
    -o "$output_dir" \
    -1 "$input_dir/reads_1.fastq.gz" \  # Replace with your input files
    -2 "$input_dir/reads_2.fastq.gz" \  # Replace with your input files
    --careful \  # Use error correction
    --cov-cutoff auto \  # Automatically determine coverage cutoff
    -t $threads  # Number of CPU threads to use

echo "Genome assembly with SPAdes completed."

