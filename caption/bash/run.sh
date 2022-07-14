#!/usr/bin/sh

uroot=/mnt/yann/data

tflag="1.0"
oflag="toy"
split="val" #"train" #

troot="./CAPTION_"$tflag"_templates"
oroot="$uroot/CLEVR_text/CAPTION_"$oflag"_captions/"
iroot="$uroot/CLEVR_v1.0/scenes/" # CLEVR scene layouts
iname="CLEVR_"$split"_scenes.json"
ifile=$iroot$iname

mkdir -p $oroot

i=0
beg=0
bslice=0
eslice=3
nscene=2 #5000
offset=0
n_per_image=10

#echo "Generation has been done, no need to run again." && exit 0
#exit 0

for ((i=bslice; i<eslice; i++)); do

    beg=$((nscene * i + offset))

    oname="caption_"$oflag"_"$split"."$beg".json"
    ofile=$oroot$oname
    echo "saving to "$ofile $beg $nscene

    #continue

    nohup bash ./bash/engine.sh $beg $eslice $nscene $offset $n_per_image $troot $ifile $ofile > "$ofile".txt 2>&1 &

done

