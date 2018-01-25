#!/bin/bash

# czi-cancer-data
# 2018 Gregory Way

# Script to download gene expression and covariate data from 4 single cell gene
# expression analyses. The script will fetch, decompress, and rename each data set
# listed below

mkdir --parents data/raw

# Patel et al. 2014 (https://doi.org/10.1126/science.1254257)
# RNAseq (SMART-seq) of 430 Glioblastoma Cells from 5 patients
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57872/suppl/GSE57872_GBM_data_matrix.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE57nnn/GSE57872/matrix/GSE57872_series_matrix.txt.gz
gunzip -c GSE57872_GBM_data_matrix.txt.gz > data/raw/GSE57872_data.txt
gunzip -c GSE57872_series_matrix.txt.gz > data/GSE57872_samples.txt

# Sottoriva et al. 2013 (https://doi.org/10.1073/pnas.1219747110)
# Microarray of 11 Glioblastoma patients (multi-sampled to test intratumoral heterogeneity)
wget http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-1129/E-MTAB-1129.raw.1.zip
wget http://www.ebi.ac.uk/arrayexpress/files/E-MTAB-1129/E-MTAB-1129.sdrf.txt
unzip E-MTAB-1129.raw.1.zip 
mv Genomestudio-GBMrawdata.txt data/raw/E-MTAB-1129_data.txt
mv E-MTAB-1129.sdrf.txt data/E-MTAB-1129_samples.txt

# Venteicher et al. 2017 (https://doi.org/10.1126/science.aai8478)
# Tirosh et al. 2016a (https://doi.org/10.1038/nature20123)
# RNAseq (Smart-seq2) profiling of two low-grade glioma single cell datasets

# Astrocytoma Data
# 9,879 Cells from 10 Astrocytoma patients
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE89nnn/GSE89567/suppl/GSE89567_IDH_A_processed_data.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE89nnn/GSE89567/matrix/GSE89567_series_matrix.txt.gz
gunzip -c GSE89567_IDH_A_processed_data.txt.gz > data/raw/GSE89567_data.txt
gunzip -c GSE89567_series_matrix.txt.gz > data/GSE89567_samples.txt

# Oligodendroglioma Data
# 4,347 Cells from 6 Oligodendroglioma patients
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE70nnn/GSE70630/suppl/GSE70630_OG_processed_data_v2.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE70nnn/GSE70630/matrix/GSE70630_series_matrix.txt.gz
gunzip -c GSE70630_OG_processed_data_v2.txt.gz > data/raw/GSE70630_data.txt
gunzip -c GSE70630_series_matrix.txt.gz > data/GSE70630_samples.txt

# Tirosh et al. 2016b (https://doi.org/10.1126/science.aad0501)
# RNAseq (Smart-seq2) of 4645 Cells from 19 melanoma patients
# This analysis includes malignant, immune, stromal, and endothelial cells
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE72nnn/GSE72056/suppl/GSE72056_melanoma_single_cell_revised_v2.txt.gz
wget ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE72nnn/GSE72056/matrix/GSE72056_series_matrix.txt.gz
gunzip -c GSE72056_melanoma_single_cell_revised_v2.txt.gz > data/raw/GSE72056_data.txt
gunzip -c GSE72056_series_matrix.txt.gz > data/GSE72056_samples.txt
rm *.gz
rm *.zip
