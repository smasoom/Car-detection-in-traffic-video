<h1 id="car-detection-in-traffic-video--">Car Detection in Traffic Video -</h1>
<h2 id="objective">Objective</h2>
<p>The goal of this project is to develop an algorithm for detecting light-colored cars in
a video of traffic using MATLAB&#39;s Image Processing Toolbox. The algorithm aims to
identify and tag light-colored cars in each frame of the video.</p>
<h2 id="step-1-access-video-information">Step 1: Access Video Information</h2>
<p>The video &#39;traffic.mj2&#39; is loaded using the VideoReader function, providing essential
details about the video:  Duration: 8 seconds  Frame dimensions: 160 x 120 pixels  Frame rate: 15 frames per second  Video format: RGB24</p>
<h2 id="step-2-explore-video-with-implay">Step 2: Explore Video with IMPLAY</h2>
<p>Visualize the video using implay(&#39;traffic.mj2&#39;) to gain insights into its content and
characteristics.
##Step 3: Develop Algorithm</p>
<p><strong>3.1 Select Representative Frame</strong>
Choose a representative frame containing both light-colored and dark-colored cars
for algorithm development.</p>
<p><strong>3.2 Remove Dark-Colored Cars</strong>
Eliminate dark-colored cars from the selected frame using the following steps:  Convert the frame to grayscale.  Use imextendedmax to create a binary image, identifying regional maxima above
a specified threshold (darkCarValue = 50).  Visualize the effect by comparing the original and processed images.</p>
<p><strong>3.3 Remove Lane Markings</strong>
To further refine the result, employ morphological processing with imopen:  Define a disk-shaped structuring element (sedisk) with a radius corresponding
to the width of lane markings (set to 2).  Apply imopen to remove small structures and visualize the result.</p>
<p><strong>3.4 Complete the Algorithm</strong> </p>
<p>Use a loop to process each frame of the video individually.  Convert each frame to grayscale.  Apply the dark car and small structure removal operations.  Use regionprops to find centroids of remaining objects (light-colored cars).  Tag light-coloured cars in the original frame by changing the centroid pixel
value to red.</p>
<p><strong>Step 4: Apply Algorithm to the Video</strong>
Process the entire video frame by frame in a loop, applying the developed algorithm
to each frame. Pre-allocate memory to store the processed video efficiently.</p>
<p><strong>Step 5: Visualize Results</strong>
Retrieve the frame rate of the original video and use it to visualize the tagged cars in
implay. The tagged cars are highlighted in red within each frame. </p>
