source = VideoReader('car-tracking.mp4');
output = VideoWriter('results.mp4', 'MPEG-4');
open(output);
frame = readFrame(source);
imshow(frame);
writeVideo(output, frame);
while hasFrame(source)
frame = readFrame(source);
imshow(frame);
writeVideo(output, frame);
end
close(output);