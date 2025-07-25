EXP_NAME="w3a8_ours"

CFG="./t2v/configs/quant/opensora/16x512x512.py"  # the opensora config
Q_CFG="./t2v/configs/quant/opensora/$EXP_NAME.yaml"  # TODO: the config of calibration
CKPT_PATH="./logs/split_ckpt/OpenSora-v1-HQ-16x512x512-split.pth"  # splited ckpt generated by split_ckpt.py
CALIB_DATA_DIR="./logs_100steps/calib_data"  # your path of calib data
OUTDIR="./logs_100steps/$EXP_NAME"  # TODO: your path to save the calibration result
GPU_ID=$1
MP_W_CONFIG="./t2v/configs/quant/opensora/mixed_precision/weight_3_mp.yaml"
MP_A_CONFIG="./t2v/configs/quant/opensora/mixed_precision/act_8_mp.yaml" # the mixed precision config of act
# calibration
CUDA_VISIBLE_DEVICES=$GPU_ID python t2v/scripts/calib.py $CFG --ckpt_path $CKPT_PATH --calib_config $Q_CFG --outdir $OUTDIR \
    --calib_data $CALIB_DATA_DIR/calib_data.pt \
    --part_fp \
    --time_mp_config_weight $MP_W_CONFIG \
    --time_mp_config_act $MP_A_CONFIG \
    --precompute_text_embeds ./t2v/utils_files/text_embeds.pth \
