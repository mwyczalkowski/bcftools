source /opt/ibm/lsfsuite/lsf/conf/lsf.conf

PWD=$(pwd)
CWL="../../../cwl/bcftools_remove_spanning_deletions.cwl"

CONFIG="../../cromwell-config/cromwell-config-db.compute1-filedb.dat"
YAML="bcftools_remove_spanning_deletions.yaml"

# Cromwell v78 
JAVA="/opt/java/openjdk/bin/java"
CROMWELL="/app/cromwell-78-38cd360.jar"

# from https://confluence.ris.wustl.edu/pages/viewpage.action?spaceKey=CI&title=Cromwell#Cromwell-ConnectingtotheDatabase
# Connecting to the database section
# Note also database section in config file
CMD="$JAVA -Dconfig.file=$CONFIG -jar $CROMWELL run -t cwl -i $YAML $CWL"

echo Running: $CMD
eval $CMD

rc=$?
if [[ $rc != 0 ]]; then
    >&2 echo Fatal error $rc: $!.  Exiting.
    exit $rc;
fi

