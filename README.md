## `container-toga`

Run with sudo

```bash
sudo singularity exec \
    --writable-tmpfs \
    -B test_input:/tb \
    container-toga_v1.1.12.sif \
        /toga/toga.py \
        /toga/test_input/hg38.mm10.chr11.chain \
        /toga/test_input/hg38.genCode27.chr11.bed \
        /tb/hg38.2bit \
        /tb/mm10.2bit \
        --kt --pn test \
        -i /toga/supply/hg38.wgEncodeGencodeCompV34.isoforms.txt \
        --nc /toga/nextflow_config_files \
        --cb 3,5 \
        --cjn 500 \
        --u12 /toga/supply/hg38.U12sites.tsv \
        --ms
```


```bash
    # -B test_input:/tb \
    # -B nf_plugins:/.nextflow/plugins \

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

## Config files

nextflow_config_files are required by TOGA and the default is to run on SLURM.
Example files are provided in this repo for overriding those defaults.
You will have to write a config file specific to the machine you are running TOGA on.
Contact the TOGA authors for support.
