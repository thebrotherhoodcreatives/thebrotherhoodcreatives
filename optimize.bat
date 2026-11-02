   @echo off
   mkdir optimized 2>nul
   for %%f in (reel-*.mp4) do (
     ffmpeg -y -i "%%f" -an -vf "scale=480:-2" -c:v libx264 -profile:v main -pix_fmt yuv420p -crf 30 -preset slow -movflags +faststart "preview-%%~nf.mp4"
     ffmpeg -y -i "%%f" -vf "scale=720:-2" -c:v libx264 -profile:v main -pix_fmt yuv420p -crf 27 -preset slow -c:a aac -b:a 96k -movflags +faststart "optimized\%%~nf.mp4"
     ffmpeg -y -ss 0.5 -i "%%f" -frames:v 1 -vf "scale=480:-2" -q:v 5 "%%~nf.jpg"
   )
   pause