# Fix errors associated with MLEAC/MLEAF INFO fields seen in GATK VCFs.  Errors look like,
#   Error: wrong number of fields in INFO/MLEAC at chr1:9082880, expected 2, found 1
# Solution is described here: https://github.com/samtools/bcftools/issues/581

# If input file ends in .gz, uncompress with zcat and recompress with gzip -c

IN=$1
OUT=$2

if [ ! -e $IN ]; then
    >&2 echo ERROR: File $IN not found
    exit 1
fi

>&2 echo Fixing MLEAC / MLEAF INFO fields
>&2 echo VCF = $IN
>&2 echo OUTPUT = $OUT

FN=$(basename -- "$IN")
EXT="${FN##*.}"
if [ "$EXT" == "gz" ]; then
    >&2 echo $IN is a compressed file, will write compressed output
    zcat $IN | sed 's/ID=MLEAC,Number=A/ID=MLEAC,Number=./g' | sed 's/ID=MLEAF,Number=A/ID=MLEAF,Number=./g' | gzip -c > $OUT
else
    sed 's/ID=MLEAC,Number=A/ID=MLEAC,Number=./g' $IN | sed 's/ID=MLEAF,Number=A/ID=MLEAF,Number=./g' > $OUT
fi

>&2 echo Success



# zcat /gscmnt/gc2741/ding/PanCan_Germline_CPTAC/Analysis/3.FilterVCFs/data_freeze_1.2/${cancer}/${sample}/${sample}.filtered.AD.5.noLongIndels.ROI.v1.2.vcf.gz | sed 's/ID=MLEAC,Number=A/ID=MLEAC,Number=./g' | sed 's/ID=MLEAF,Number=A/ID=MLEAF,Number=./g' | bgzip -c > /gscmnt/gc2741/ding/PanCan_Germline_CPTAC/Analysis/3.FilterVCFs/data_freeze_1.2/${cancer}/${sample}/${sample}.filtered.AD.5.noLongIndels.ROI.INFOfixed.v1.2.vcf.gz


