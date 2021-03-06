#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 EXPERIMENTS_DIR"
    exit 1
else
    EXPERIMENTS_DIR=$1
fi

DONE_DIR="$EXPERIMENTS_DIR/done"
TORUN_DIR="$EXPERIMENTS_DIR/torun"
mkdir -p $DONE_DIR
mkdir -p $TORUN_DIR

pkt_count=50000
for num_fields in 2 8 16 32 64 128 196
do
    for num_ops in 288
    do
        json_file=$(./gen_experiment.py \
            -p fields=$num_fields -p operations=$num_ops -p type=mod \
            -p count=$pkt_count \
            -o $TORUN_DIR)
        echo $json_file
        exp_dir=$(dirname $json_file)

        echo "#!/bin/bash" > $exp_dir/run.sh
        echo "$HOME/p4benchmark/benchmark/run_experiment.py experiment.json" >> $exp_dir/run.sh
        chmod +x $exp_dir/run.sh
    done
done
        


        
