//This macro needs to be run on cholorphyll channel

dir1 = getDirectory("Choose Source Directory "); 
dir2 = getDirectory("Choose Destination Directory "); 
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
showProgress(i+1, list.length); open(dir1+list[i]);

//Gaussian Blur
run("Gaussian Blur 3D...", "x=1 y=1 z=1");
run("Subtract Background...", "rolling=50 stack");

//run("Threshold...");
setAutoThreshold("Default");
setOption("BlackBackground", false);
run("Convert to Mask", "method=Default background=Dark calculate");

//3D Watershed
run("3D Watershed Split", "seeds=Automatic radius=5");

saveAs("Tiff", dir2+list[i]+"3dSeg1");
run("Close All");}