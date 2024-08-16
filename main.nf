nextflow.enable.dsl=2

//params.cachedir = '/mnt/OmicNAS/dd/p2rank/viz'
params.cores = 40 // (number) machine cores to use
params.pdb = '/mnt/OmicNAS/dd/rcsb-apo/1FDH_apo.pdb'

process P2RANK {

  container 'p2rank-tiruzer-1:latest'

 // storeDir "params.cachedir/{params.cachedir}/{pdb.baseName}"

  publishDir "${params.outdir}", mode: 'copy'

  input:
    path pdb

  output:
    path  "${pdb.name}_predictions.csv", emit: pocket_pred
    path "${pdb.name}_residues.csv", emit: resid_pred
    path "visualizations/${pdb.name}.pml", emit: pymol_viz
    path "visualizations/data/${pdb.name}_points.pdb.gz", emit: viz_points
    path "run.log", emit: log_file

  shell:
    """
    prank predict -threads params.cores−o.−f{params.cores} -o . -f {pdb}
    """
}

workflow {
  P2RANK(params.pdb)
}
