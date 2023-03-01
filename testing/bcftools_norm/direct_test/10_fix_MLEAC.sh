# /storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-vep_annotate_tin_jasmine_v100/execution/results/vep/output_vep.vcf

D1="/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions"

BCFTOOLS="/cache1/fs1/home1/Active/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-normalize/TinJasmine-dev/submodules/bcftools"

mkdir -p dat
OUT="dat/data-fixMLEAC.vcf"
VCF="$D1/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-vep_annotate_tin_jasmine_v100/execution/results/vep/output_vep.vcf"

FIX="$BCFTOOLS/src/fix_MLEAC.sh"

CMD="bash $FIX $VCF $OUT"

echo Running: $CMD
eval $CMD
