//This macro needs to be run on previously 3D segmented chlorophyl channels Tiffs

dir1 = getDirectory("Choose Source Directory "); 
dir2 = getDirectory("Choose Destination Directory "); 
list = getFileList(dir1);
setBatchMode(true);
for (i=0; i<list.length; i++) {
showProgress(i+1, list.length); open(dir1+list[i]);


//Cell Counts
run("3D Objects Counter", "threshold=1 min.=1000 statistics");

saveAs("Text", dir2+list[i]);
run("Close"); }