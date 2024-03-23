the_Video = VideoReader("video\cars_on_the_road (720p).mp4"); 
object_detector = vision.ForegroundDetector('NumGaussians',3,'NumTrainingFrames',50); 
for i=1:150 
    frame= readFrame(the_Video); 
    the_object= step(object_detector, frame); 
end  
figure, imshow(frame); title('this is the video frame'); 
figure, imshow(the_object); title('this is the object frame'); 
Structure = strel("square", 3); 
Noise_Free= imopen( the_object,Structure); 
figure; imshow(Noise_Free); title("object after reoving noise"); 
Bounding_Box=vision.BlobAnalysis('BoundingBoxOutputPort',true,'AreaOutputPort',false,'CentroidOutputPort',false,  'MinimumBlobArea',150);
the_box= step(Bounding_Box,Noise_Free); 
Detected_car=insertShape(frame,'Rectangle',the_box,'Color','green');
count=size(the_box,1); 
Detected_car=insertText(Detected_car,[10 10],count,'BoxOpacity',1,'FontSize',15); 
figure, imshow(Detected_car); title('detected cars') 