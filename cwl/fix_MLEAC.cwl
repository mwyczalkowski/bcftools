class: CommandLineTool
cwlVersion: v1.0
id: fix_mleac
label: fix_mleac
baseCommand:
  - bash
  - /opt/bcftools/src/fix_MLEAC.sh
inputs:
  - id: vcf
    type: File
    inputBinding:
      position: 1
outputs:
  - id: output
    type: File
    outputBinding:
      glob: data.fix_MLEAC.vcf
arguments:
  - position: 2
    valueFrom: data.fix_MLEAC.vcf
requirements:
  - class: ResourceRequirement
    ramMin: 8000
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/bcftools:20230228'
