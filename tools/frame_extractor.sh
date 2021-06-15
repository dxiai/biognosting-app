#!/bin/bash

# Tool to extract keyframes and metadata from iPhone videos.
# The tool expects a folder with the containing videos as parameter.
# SYNOPSIS
#   frame_extractor.sh mydata/videos
#
# The tool will generate a ZIP file with JPEG images and the metadata CSV from the 
# provided videos. The ZIP file will be in the parent directory of the provided 
# video directory.

# This tool should move into the server component.

DIR=$1

PARENTDIR=${DIR%/*}
FRAMEDIR=$PARENTDIR/fotos

# Extract the metadata for all provided videos and store them into csv format.
# see https://github.com/dxiai/biognosting-app/issues/3
exiftool -creationdate -gpslatitude -gpslongitude -T -n -csv $DIR/* > $PARENTDIR/metadata.csv

for FILE in `ls $DIR`
do
    # remove the video's file extension
    VIDEONAME=${FILE%.*}

    # Each video will be extracted into a directory with the same name. 
    FOTOPATH=$FRAMEDIR/$VIDEONAME/
    # Each video frame will be placed into a file with the video name as prefix and the 
    # frame number in sequence.
    FOTOFILE=$FOTOPATH/$VIDEONAME-%03d.jpg

    mkdir -p $FOTOPATH

    # Extract keyframes without quality loss, although some loss will happen because of JPEG.
    # see https://github.com/dxiai/biognosting-app/issues/4
    ffmpeg -i $DIR/$FILE -vf "select='eq(pict_type,PICT_TYPE_I)'" -q:v 1 -vsync vfr $FOTOFILE
done

# ZIP metadata and framedir for distribution
zip -r $PARENTDIR/daten.zip $PARENTDIR/metadata.csv $FRAMEDIR 

# Cleanup: remove the generated files and free space
rm -rf $FRAMEDIR
rm -f  $PARENTDIR/metadata.csv
