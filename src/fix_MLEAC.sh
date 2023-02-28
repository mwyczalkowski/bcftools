# Fix errors associated with MLEAC/MLEAF INFO fields seen in GATK VCFs.  Errors look like,
#   Error: wrong number of fields in INFO/MLEAC at chr1:9082880, expected 2, found 1
# Solution is described here: https://github.com/samtools/bcftools/issues/581

IN=$1
OUT=$2

if [ ! -e $IN ]; then
    >&2 echo ERROR: File $IN not found
    exit 1
fi

>&2 echo Fixing MLEAC / MLEAF INFO fields
>&2 echo VCF = $IN
>&2 echo OUTPUT = $OUT

sed 's/ID=MLEAC,Number=A/ID=MLEAC,Number=./g' $IN | sed 's/ID=MLEAF,Number=A/ID=MLEAF,Number=./g' > $OUT

>&2 echo Success

