# Test gz funcionality

# /storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-vep_annotate_tin_jasmine_v100/execution/results/vep/output_vep.vcf

D1="/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions"

BCFTOOLS="/cache1/fs1/home1/Active/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-normalize/TinJasmine-dev/submodules/bcftools"

# First, compress this for testing purposes
mkdir -p dat
OUT_TMP="dat/data-input_vcf.gz"
VCF="$D1/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-vep_annotate_tin_jasmine_v100/execution/results/vep/output_vep.vcf"

>&2 echo Compressing $VCF into $OUT_TMP
cat $VCF | gzip -c > $OUT_TMP

OUT="dat/data-fixMLEAC.vcf.gz"

FIX="$BCFTOOLS/src/fix_MLEAC.sh"

CMD="bash $FIX $OUT_TMP $OUT"

echo Running: $CMD
eval $CMD
