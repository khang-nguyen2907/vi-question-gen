pip install -U gdown
mkdir data
gdown https://drive.google.com/drive/folders/1BSnqdV7qewebo_30nV4ix_ARss7APfUP -O data/UIT-ViQuAD --folder 

mkdir models

pip install -U transformers
pip install -U datasets
pip install -U SentencePiece
pip install -U evaluate
pip install -U rouge_score
pip install -U tensorboard