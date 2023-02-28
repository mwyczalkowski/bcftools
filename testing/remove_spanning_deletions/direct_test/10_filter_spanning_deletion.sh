D=/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc
VCF=$D/call-bcftools_reheader_gatk_snp/execution/output.reheader.vcf

mkdir dat
OUT="dat/output.no_spanning_deletion.vcf"

echo Filtering $VCF
echo Removing spanning deletions
bcftools view -e'ALT="*"' -o $OUT $VCF
echo Written to $OUT

