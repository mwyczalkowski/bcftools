IMAGE="mwyczalkowski/cromwell-runner:v78"

BCFTOOLS="/cache1/fs1/home1/Active/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-normalize/TinJasmine-dev/submodules/bcftools"

VOLUME_MAPPING=" \
/storage1/fs1/m.wyczalkowski/Active \
/storage1/fs1/dinglab/Active \
/scratch1/fs1/dinglab \
$BCFTOOLS \
"


ARG="-q dinglab-interactive"

CMD="bash $BCFTOOLS/docker/WUDocker/start_docker.sh $ARG -A -I $IMAGE -M compute1 $VOLUME_MAPPING"
echo Running: $CMD
eval $CMD
