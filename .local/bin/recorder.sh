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

if [ $(pactl info) ] 
	then
		if [ $(pgrep ffmpeg) ] 
			then
				pkill -x ffmpeg
			else
				ffmpeg -f x11grab -i :0.0 -f pulse -i default -c:v libx264 -r 30 -pix_fmt yuv420p "$filename"
		fi
	else
		if [ $(pgrep ffmpeg) ] 
			then
				pkill -x ffmpeg
			else
				ffmpeg -f x11grab -i :0.0 -c:v libx264 -r 30 -pix_fmt yuv420p "$filename"
		fi
fi


