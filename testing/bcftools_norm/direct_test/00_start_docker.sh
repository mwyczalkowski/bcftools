#/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-vep_annotate_tin_jasmine_v100/execution/results/vep/output_vep.vcf

REF="/storage1/fs1/m.wyczalkowski/Active/Primary/Resources/References/GRCh38.d1.vd1"
D="/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions"
BCFTOOLS="/cache1/fs1/home1/Active/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-normalize/TinJasmine-dev/submodules/bcftools"
IMAGE="mwyczalkowski/bcftools:20230228"

bash ../../../docker/WUDocker/start_docker.sh -r -I $IMAGE -M compute1 $D $REF $BCFTOOLS

