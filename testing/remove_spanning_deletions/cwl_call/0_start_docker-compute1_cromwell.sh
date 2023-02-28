IMAGE="mwyczalkowski/cromwell-runner:v78"

PWD=$(pwd)

VOLUME_MAPPING=" \
/storage1/fs1/m.wyczalkowski/Active \
/storage1/fs1/dinglab/Active \
/scratch1/fs1/dinglab \
/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-normalize/testing_TinJasmine/TinJasmine/submodules/bcftools \
"

ARG="-q dinglab-interactive"

CMD="bash ../../../docker/WUDocker/start_docker.sh $ARG -A -I $IMAGE -M compute1 $VOLUME_MAPPING"
echo Running: $CMD
eval $CMD
