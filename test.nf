nextflow.enable.dsl=2

params.pdb = '/mnt/OmicNAS/dd/rcsb-apo/1FDH_apo.pdb'
params.outdir = '/mnt/OmicNAS/test-outputs/fpocket'

include {P2RANK} from './main.nf'

workflow {
    P2RANK(params.pdb)
}