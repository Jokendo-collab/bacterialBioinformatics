#!/bin/bash

# Define input and output directories
genome_dir="genome_assemblies"
output_dir="virulence_amr_predictions"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Define the path to ABRicate executable
abricate_executable="/path/to/abricate"

# Define the path to VFDB and CARD databases
vfdb_database="/path/to/vfdb.fasta"
card_database="/path/to/card.fasta"

# Run ABRicate for virulence and AMR prediction
for genome_file in "$genome_dir"/*.fasta; do
    genome_name=$(basename "$genome_file" .fasta)
    
    # Predict virulence factors using VFDB
    $abricate_executable --db "$vfdb_database" --minid 90 --mincov 60 -o "$output_dir/$genome_name.virulence.tsv" "$genome_file"
    
    # Predict AMR genes using CARD
    $abricate_executable --db "$card_database" --minid 90 --mincov 60 -o "$output_dir/$genome_name.amr.tsv" "$genome_file"
    
    echo "Predicted virulence factors and AMR genes for $genome_name."
done

echo "Virulence and AMR prediction completed."

