class: CommandLineTool
cwlVersion: v1.0
id: bcftools_reheader
baseCommand:
  - /usr/local/bin/bcftools
  - reheader
inputs:
  - id: vcf
    type: File
    inputBinding:
      position: 20
  - id: samples
    type: string
    label: sample name
outputs:
  - id: output
    type: File
    outputBinding:
      glob: output.reheader.vcf.gz
label: bcftools_reheader
arguments:
  - position: 1
    prefix: '--output'
    valueFrom: output.reheader.vcf.gz
  - position: 2
    prefix: '--samples'
    valueFrom: samples.dat
requirements:
    ResourceRequirement:
      ramMin: 8000
    DockerRequirement:
      dockerPull: 'mwyczalkowski/bcftools:20230228'
    InitialWorkDirRequirement:
        listing:
          - entryname: samples.dat
            entry: |-
                $(inputs.samples)

