# Model
MODEL_NAME_OR_PATH=VietAI/vit5-base
TOKENIZER_NAME=VietAI/vit5-base

# Data
DATASET_FOLDER=./data/UIT-ViQuAD
OUTPUT_DIR=./models/$(date +%Y%m%d_%H%M%S)/output
LOGGING_DIR=$OUTPUT_DIR/log
QUESTION_PREFIX="câu hỏi: "
ANSWER_PREFIX="đáp án: "
CONTEXT_PREFIX="tài liệu: "

# Training
BATCHSIZE=8
LR=1e-5
N_EPOCHS=20
MAX_SEQ_LENGTH=512
MAX_ANSWER_LENGTH=55
WARMUP_STEPS=500
WEIGHT_DECAY=0.01
GRAD_ACC=8

# Logging
EVAL_STRATEGY=steps
SAVE_TOTAL_LIMIT=1
SAVE_STEPS=100
EVAL_STEPS=100
LOGGING_STEPS=100
REPORT_TO=tensorboard

# Tuning 
NUM_SAMPLES=8
GPUS_PER_TRIAL=2
LOCAL_TUNING_DIR=./tuner/$(date +%Y%m%d_%H%M%S)/output
NAME_TUNING_EXP=$(date +%Y%m%d_%H%M%S)_tuner

python src/tuning/run_qg_tuning.py \
  --model_name_or_path $MODEL_NAME_OR_PATH \
  --tokenizer_name $TOKENIZER_NAME \
  --dataset_folder $DATASET_FOLDER \
  --do_train \
  --do_eval \
  --predict_with_generate \
  --per_device_train_batch_size $BATCHSIZE \
  --learning_rate $LR \
  --num_train_epochs $N_EPOCHS \
  --max_source_length $MAX_SEQ_LENGTH \
  --max_target_length $MAX_ANSWER_LENGTH \
  --logging_dir $LOGGING_DIR \
  --evaluation_strategy steps \
  --save_total_limit $SAVE_TOTAL_LIMIT \
  --save_steps $SAVE_STEPS \
  --eval_steps $EVAL_STEPS \
  --gradient_accumulation_steps $GRAD_ACC \
  --warmup_steps $WARMUP_STEPS \
  --weight_decay $WEIGHT_DECAY \
  --logging_steps $LOGGING_STEPS \
  --report_to $REPORT_TO \
  --output_dir $OUTPUT_DIR \
  --num_samples $NUM_SAMPLES \
  --gpus_per_trial $GPUS_PER_TRIAL\
  --local_tuning_dir $LOCAL_TUNING_DIR \
  --name_tuning_exp $NAME_TUNING_EXP