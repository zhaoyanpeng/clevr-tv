#!/usr/bin/sh


beg=$1 # input param.
eslice=$2
nscene=$3 #7500
offset=$4
n_per_image=$5
troot=$6
ifile=$7
ofile=$8


python -u generate_questions.py \
  --verbose \
  --reset_counts_every 5000 \
  --input_scene_file $ifile \
  --templates_per_image $n_per_image \
  --output_questions_file $ofile \
  --template_dir $troot \
  --scene_start_idx $beg \
  --num_scenes $nscene 
