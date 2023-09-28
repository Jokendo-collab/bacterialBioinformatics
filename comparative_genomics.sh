#!/bin/bash

# Define input and output directories
input_genomes_dir="genome_assemblies"
annotation_dir="annotations"
output_dir="comparative_genomics_output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Define the path to OrthoFinder executable
ortho_finder_executable="/path/to/orthofinder"

# Run OrthoFinder for comparative genomics
$ortho_finder_executable \
    -f "$input_genomes_dir" \  # Directory containing genome assemblies (FASTA format)
    -a "$annotation_dir" \  # Directory containing annotation files (GFF3 format)
    -t 4 \  # Number of CPU threads to use
    -o "$output_dir"

echo "Comparative genomics analysis with OrthoFinder completed."


