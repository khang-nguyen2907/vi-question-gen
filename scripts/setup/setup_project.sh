pip install -U gdown
mkdir data
gdown https://drive.google.com/drive/folders/1BSnqdV7qewebo_30nV4ix_ARss7APfUP -O data/UIT-ViQuAD --folder 

mkdir models
mkdir tuner

conda install pytorch==1.13.1 torchvision==0.14.1 torchaudio==0.13.1 pytorch-cuda=11.6 -c pytorch -c nvidia
pip install -r requirements.txt