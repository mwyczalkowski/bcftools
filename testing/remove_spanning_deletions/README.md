Evaluating normalization issues with TinJasmine runs.  

Testing recent test run of TinJasmine v1.3 for C3L-00017, which ran here:
/cache1/fs1/home1/Active/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-testing-reheader

VCF=/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc/call-canonical_filter/execution/output/HotspotFiltered.vcf
D=/storage1/fs1/dinglab/Active/Projects/CPTAC3/Analysis/cromwell-data/cromwell-workdir/cromwell-executions/TinJasmine.v1.3.vep-100.cwl/68d3f41e-9415-4666-a43e-c5a28d2ba4dc

```
chr19   55358535    .   T   *,C 1709.01 PASS
chr6    31356827    .   T   *,C 2089.01 PASS  (set=gatk_snv-varscan_snv)
```

There are two problems: 
* the commas indicate multi-allelic variant
* the stars indicate spanning deletions

We need to split the multi-allelics into multiple lines, and get rid of the spanning deletions

It seems that merging undoes the normalization step.  Note that other normalized variants are also merged, not just spanning deletions.

# Filtering of spanning deletion
Key step will be to remove the spanning deletion (ALT=`*`) for GATK generated calls after normalization.  This will prevent them from re-merging
Possibly, may need to normalize again after merging.

Based on discussion here, the following argument to `bcftools view` should work:
    -e'ALT="*"'

This seems to work nicely: `bcftools view -e'ALT="*"' -o out.vcf.gz -O z $VCF`

Are there other multiallelic variants post merge? yes, there are a number.  Example: C,CAA

## Tasks
Need to add to additional steps to TinJasmine workflow:
1. Remove spanning deletions in normalized GATK SNVs and indels prior to merging
2. perform normalization again for merged VCF

## Development and testing
Following example of bcftools_normalize, example of which is here:
    /cache1/fs1/home1/Active/home/m.wyczalkowski/Projects/TinJasmine/TinJasmine-testing-reheader/TinJasmine/cwl/bcftools_normalize.cwl

As input, use the output of the reheadered GATK snp:
    $D/call-bcftools_reheader_gatk_snp/execution/output.reheader.vcf.gz

