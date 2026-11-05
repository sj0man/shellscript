#!/bin/bash

INFILE=in.mkv
OUTFILE=out.aac

ffmpeg -i $INFILE -vn -c:a aac -b:a 192k $OUTFILE 


