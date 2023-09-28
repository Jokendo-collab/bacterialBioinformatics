#!/bin/bash

# module load
module add trimgalore 
module add multiqc

# Define input and output directories
input_dir="input_fastq"
output_dir="trimmed_fastq"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Specify options for Trim Galore!
# Adjust these options according to your specific needs
trim_galore_options="--quality 20 --trim-n --length 25 --fastqc --paired"

# Loop through all paired-end FASTQ files in the input directory
for input_file in "$input_dir"/*_1.fastq.gz; do
    # Get the base name of the input file
    base_name=$(basename "$input_file")

    # Derive the corresponding second read file
    input_file2="${input_file/_1/_2}"

    # Define the output file names for trimmed reads
    output_file1="$output_dir/${base_name/_1.fastq.gz/_1_trimmed.fastq.gz}"
    output_file2="$output_dir/${base_name/_1.fastq.gz/_2_trimmed.fastq.gz}"

    # Run Trim Galore! on paired-end reads
    trim_galore $trim_galore_options --output_dir "$output_dir" \
        --paired "$input_file" "$input_file2"

    echo "Trimmed: $base_name"
done

#move the the results folder and run multiqc 

cd $$output_dir

multiqc . 

echo "Quality control and trimming completed."

