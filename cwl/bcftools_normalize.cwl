class: CommandLineTool
cwlVersion: v1.0
id: bcftools_normalize
baseCommand:
  - /usr/local/bin/bcftools
  - norm
inputs:
  - id: vcf
    type: File
    inputBinding:
      position: 20
  - id: reference
    type: File?
    inputBinding:
      position: 1
      prefix: '-f'
  - id: output_type
    type: string
    inputBinding:
      position: 7
      prefix: '-O'
    label: Output type
    doc: 'v for .vcf, z for .vcf.gz'
outputs:
  - id: output
    type: File
    outputBinding:
      glob: output.normalized.vcf.gz
label: bcftools_normalize
arguments:
  - position: 5
    prefix: '--multiallelics'
    valueFrom: '-'
  - position: 6
    prefix: '--check-ref'
    valueFrom: w
  - position: 8
    prefix: '-o'
    valueFrom: output.normalized.vcf.gz
requirements:
  - class: ResourceRequirement
    ramMin: 8000
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/bcftools:v1.10.2'
