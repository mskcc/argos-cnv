CONTAINER_SIF=helix_filters_01_facets-suite-2.0.6.sif 
OUTPUT_DIR=$PWD/output

SNP_PILEUP=sample.pileup.gz
SAMPLE_ID=sample_id

mkdir -p $OUTPUT_DIR
module load singularity/3.3.0
singularity exec \
-B /juno/work \
-B $PWD \
-B $OUTPUT_DIR \
$CONTAINER_SIF \
/bin/bash -c ' \
cd $PWD; \
run-facets-wrapper.R \
--counts-file '"$SNP_PILEUP"' \
--purity-cval 100 \
--cval 50 \
--seed 1000 \
--everything \
--min-nhet 25 \
--purity-min-nhet 25 \
--directory '"$OUTPUT_DIR"' \
--facets-lib-path /usr/local/lib/R/site-library \
--sample-id '"$SAMPLE_ID"' 
'