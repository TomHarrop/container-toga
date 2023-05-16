## `container-toga`

- [hillerlab/TOGA](https://github.com/hillerlab/TOGA/releases/tag/v1.1.2) v1.1.2
- [hillerlab/make-lastz-chains \@ commit ee21f17](https://github.com/hillerlab/make_lastz_chains/commit/ee21f172fa7f473b7b7f5b8872daaee4746b07f0) (no tagged releases).

## Notes for running

Run the "[final test](https://github.com/hillerlab/TOGA#final-test)"

```bash
singularity exec \
    --writable-tmpfs \
    toga.sif \
        toga.py \
        --cb 3,5 \
        --cjn 500 \
        --kt \
        --ms \
        --nc nextflow_config_files \
        --nextflow_dir workdir \
        --pn test \
        --project_dir output \
        --u12 /toga/supply/hg38.U12sites.tsv \
        -i /toga/supply/hg38.wgEncodeGencodeCompV34.isoforms.txt \
        /toga/test_input/hg38.mm10.chr11.chain \
        /toga/test_input/hg38.genCode27.chr11.bed \
        test_input/hg38.2bit \
        test_input/mm10.2bit
```

### Config files

nextflow_config_files are required by TOGA.
The config files shipped with TOGA require SLURM.
Example files are provided in this repo for testing locally.
You will have to write a config file specific to the machine you are running TOGA on.
Contact the TOGA authors for support.

For example, the machine I tested on has 8 cores and 32 GB RAM, so I used the following config:

```java
process {
    executor = 'local'
    cpus = 7
    memory = '28 GB'
}
```

## Make-lastz-chains

TOGA [needs chain files](https://github.com/hillerlab/TOGA#genome-alignment) for input.
These can be generated with `make_chains.py` in this container.

```bash
singularity exec \
    --writable-tmpfs \
    toga_chains.sif \
        make_chains.py \
        --project_dir chains_output \
        hg38 mm10 \
        test_input/hg38.2bit \
        test_input/mm10.2bit
```