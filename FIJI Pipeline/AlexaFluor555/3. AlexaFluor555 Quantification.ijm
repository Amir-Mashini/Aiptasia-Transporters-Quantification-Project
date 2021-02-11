//This macro needs to be run on fluorescnece quantification channel (e.g. AlexaFluor555)
//(manually segmented gastrodermis or totally)

dir1 = getDirectory("Choose Source Directory "); 
dir2 = getDirectory("Choose Destination Directory "); 
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
showProgress(i+1, list.length); open(dir1+list[i]);

//Gaussian Blur
run("Gaussian Blur 3D...", "x=1 y=1 z=1");

//Background Substraction
run("Subtract Background...", "rolling=50 stack");

//Alexafluor555 Quantification
run("3D Objects Counter", "threshold=200 statistics");


saveAs("Text", dir2+list[i]);
run("Close"); }