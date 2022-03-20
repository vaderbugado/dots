#!/bin/sh
if [ -f /home/vader/media/video/recorder/record.mp4 ]
	then
		n=1
		while [ -f /home/vader/media/video/recorder/record_$n.mp4 ]
		do
			n=$((n+1))
		done
		filename="/home/vader/media/video/recorder/record_$n.mp4"
	else
		filename="/home/vader/media/video/recorder/record.mp4"
fi

if [ $(pgrep ffmpeg) ] 
	then
		pkill -x ffmpeg
	else
		ffmpeg -f x11grab -i :0.0 "$filename"
fi

