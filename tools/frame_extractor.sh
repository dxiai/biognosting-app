#!/bin/bash

# Tool to extract keyframes from an iPhone video.
# This tool should move into the server component.

DIR=$1

FILES=`ls $1`

PARENTDIR=${DIR%/*}
FRAMEDIR=$PARENTDIR/fotos

exiftool -creationdate -gpslatitude -gpslongitude -T -n -csv $DIR/* > $PARENTDIR/metadata.csv

for FILE in $FILES 
do
    TFILE=${FILE%.*}
    VFILE=$DIR/$FILE
    FPATH=$FRAMEDIR/$TFILE/
    FFILE=$FPATH/$TFILE-%03d.jpg

    mkdir -p $FPATH

    ffmpeg -i $VFILE -vf "select='eq(pict_type,PICT_TYPE_I)'" -q:v 1 -vsync vfr $FFILE
done

# ZIP metadata and framedir for sending
zip -r $PARENTDIR/daten.zip $PARENTDIR/metadata.csv $FRAMEDIR 
