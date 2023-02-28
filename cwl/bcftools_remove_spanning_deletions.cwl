class: CommandLineTool
cwlVersion: v1.0
id: bcftools_remove_spanning_deletions
baseCommand:
  - /usr/local/bin/bcftools
  - view
inputs:
  - id: vcf
    type: File
    inputBinding:
      position: 20
outputs:
  - id: output
    type: File
    outputBinding:
      glob: output.no_spanning_deletions.vcf.gz
label: bcftools_remove_spanning_deletions
arguments:
  - position: 5
    prefix: '-e'
    valueFrom: 'ALT="*"'
  - position: 6
    prefix: '-O'
    valueFrom: z
  - position: 7
    prefix: '-o'
    valueFrom: output.no_spanning_deletions.vcf.gz
requirements:
  - class: ResourceRequirement
    ramMin: 8000
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/bcftools:20230228'

