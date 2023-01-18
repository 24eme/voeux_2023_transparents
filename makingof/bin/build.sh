if test -d original; then
	ls original/ | while read img; do convert original/$img -resize 50% resized/$img; done
fi
if test -d resized; then
    ls resized/ | grep -v crop | while read img; do convert resized/$img -crop 1300x2070+340+0 images/$img; done
fi
ffmpeg -y -framerate 1.5 -pattern_type glob -i 'images/*.jpg' -c:v libx264 -pix_fmt yuv420p makingof.mp4
