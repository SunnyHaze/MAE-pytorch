# Set the path to save checkpoints
OUTPUT_DIR='output/pretrain_mae_base_patch16_224'
# path to imagenet-1k train set
# DATA_PATH='./path/to/ImageNet_ILSVRC2012/train'

DATA_PATH='~/data/nist'


# batch_size can be adjusted according to the graphics card
OMP_NUM_THREADS=1 python -m torch.distributed.launch --nproc_per_node=1 --master_port 66660 run_mae_pretraining.py \
        --data_path ${DATA_PATH} \
        --mask_ratio 0.75 \
        --model pretrain_mae_base_patch16_224 \
        --batch_size 128 \
        --opt adamw \
        --opt_betas 0.9 0.95 \
        --warmup_epochs 40 \
        --epochs 1600 \
        --output_dir ${OUTPUT_DIR}