# /storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-vep_annotate_tin_jasmine_v100/execution/results/vep/output_vep.vcf

REFD="/storage1/fs1/m.wyczalkowski/Active/Primary/Resources/References/GRCh38.d1.vd1"

mkdir -p dat
OUT="dat/data-normalized.vcf"

REF="$REFD/GRCh38.d1.vd1.fa"
VCF="dat/data-fixMLEAC.vcf"
CMD="bcftools norm -f $REF -m-any --multiallelics - --check-ref e -o $OUT $VCF"

echo Running: $CMD
eval $CMD
