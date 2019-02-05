# nginx-conf
nginx configs for FFMPEG-HLS transcoding for Home Assistant

Using of modified FFmpeg:

MMAL:

ffmpeg -v verbose \
       -nostats \
       -hide_banner \
       -rtsp_transport tcp \
       -i rtsp://your_camera_ip:554/unicast \
       -map 0 \
       -r 25 \
       -vcodec h264_mmal \
       -c:v copy \
       -an \
       -f hls \
       -hls_time 0 \
       -hls_list_size 10 \
       -hls_flags delete_segments \
       -hls_segment_filename "/usr/local/share/hls/%09d.ts" \
       "/usr/local/share/hls/cam1.m3u8" 

OMX
ffmpeg -v verbose \
       -nostats \
       -hide_banner \
       -rtsp_transport tcp \
       -i rtsp://your_camera_ip:554/unicast \
       -map 0 \
       -r 25 \
       -vcodec h264_omx \
       -c:v copy \
       -an \
       -f hls \
       -hls_time 0 \
       -hls_list_size 10 \
       -hls_flags delete_segments \
       -hls_segment_filename "/usr/local/share/hls/%09d.ts" \
       "/usr/local/share/hls/cam1.m3u8" 
