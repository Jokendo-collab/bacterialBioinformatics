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

# Functional annotation using eggNOG-mapper (optional)
eggNOG_mapper_executable="/path/to/eggnog-mapper.py"
eggNOG_database="/path/to/eggnog.db"

$eggNOG_mapper_executable \
    -i "$output_dir/$input_genome.ffn" \  # Prokka's predicted protein-coding genes
    -o "$output_dir/eggnog_annotation" \
    --database "$eggNOG_database" \
    --cpu 4  # Number of CPU threads to use

echo "Functional annotation with eggNOG-mapper completed."


