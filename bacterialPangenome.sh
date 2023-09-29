#!/bin/bash

# Define input directory (containing genome assemblies in FASTA format)
input_genomes_dir="genome_assemblies"

# Create an output directory for pangenome analysis results
output_dir="pangenome_analysis_output"
mkdir -p "$output_dir"

# Step 1: Genome Annotation using Prokka
for genome_file in "$input_genomes_dir"/*.fasta; do
    genome_name=$(basename "$genome_file" .fasta)
    
    # Annotate the genome using Prokka
    prokka --outdir "$output_dir/$genome_name" --prefix "$genome_name" "$genome_file"
    
    echo "Annotated genome: $genome_name"
done

# Step 2: Orthologous Gene Clustering using OrthoFinder
# Make sure you have OrthoFinder installed and configured.

# Create a list of annotated protein files (in GFF format)
protein_files=""
for annotation_dir in "$output_dir"/*; do
    if [ -d "$annotation_dir" ]; then
        protein_file="$annotation_dir/$genome_name.faa"
        protein_files="$protein_files $protein_file"
    fi
done

# Run OrthoFinder for orthologous gene clustering
orthofinder -f $protein_files -t 4  # Adjust the number of CPU threads as needed

# Step 3: Functional Annotation using EggNOG-mapper
# Make sure you have EggNOG-mapper installed and configured.

# Create a combined FASTA file of all predicted proteins
combined_proteins="$output_dir/combined_proteins.fasta"
cat "$output_dir"/*/*.faa > "$combined_proteins"

# Run EggNOG-mapper for functional annotation
emapper.py -i "$combined_proteins" -o "$output_dir/emapper_output" --cpu 4  # Adjust CPU threads

echo "Pangenome analysis completed."

