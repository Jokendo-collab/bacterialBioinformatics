#!/bin/bash

# Define input and output directories/files
input_genome="genome.fasta"
output_dir="annotation_output"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Define the path to Prokka executable
prokka_executable="/path/to/prokka"

# Run Prokka for genome annotation
$prokka_executable \
    --outdir "$output_dir" \
    --genus "YourGenus" \
    --species "YourSpecies" \
    --strain "StrainName" \
    --locustag "LOCUSTAG" \
    --kingdom Bacteria \  # Specify kingdom as Bacteria or Archaea
    --cpus 4 \  # Number of CPU threads to use
    "$input_genome"

echo "Genome annotation with Prokka completed."

