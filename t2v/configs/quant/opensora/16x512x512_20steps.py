num_frames = 16
fps = 24 // 3
image_size = (512, 512)

# Define model
model = dict(
    type="STDiT-XL/2",
    space_scale=1.0,
    time_scale=1.0,
    enable_flashattn=False, # default is True
    enable_layernorm_kernel=False, # default is True
    from_pretrained="PRETRAINED_MODEL"
)
vae = dict(
    type="VideoAutoencoderKL",
    from_pretrained="/data/qvdit/logs/vae_ckpt",
    micro_batch_size=128,
)
text_encoder = dict(
    type="t5",
    from_pretrained="/data/qvdit/logs",
    local_cache=True,
    save_pretrained="/data/qvdit/logs/t5-v1_1-xxl",
    model_max_length=120,
)
scheduler = dict(
    type="iddpm",
    num_sampling_steps=20,
    cfg_scale=7.0,
)
dtype = "fp32"

# Other
batch_size = 4
seed = 42
prompt_path = "./assets/texts/t2v_samples.txt"
# save_dir = "./generated_videos/fp16"

