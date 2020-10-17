macro "Auto Measure and Save"
{
	dir_saving = getDirectory("Choose a Directory to save");
	dir_processing = getDirectory("Choose a Directory to process");
	list = getFileList(dir_processing);
	for(i = 0; i < list.length; i++)
	{
		open(list[i]);
		run("8-bit");
		setAutoThreshold("MaxEntropy dark");
		//run("Threshold...");
		//setThreshold(39, 255);
		setOption("BlackBackground", true);
		run("Convert to Mask");
		run("Fill Holes");
		run("Watershed");
		saveAs("tiff", "D:/light-output/"+ getTitle);
		run("Analyze Particles...", "size=10-Infinity show=[Overlay Masks] display exclude clear summarize add in_situ");
		close();
		open(list[i]);
		roiManager("Show None");
		roiManager("Show All");
		roiManager("Measure");
		saveAs("Results", "D:/light-output/" + i+1 + ".csv");
		close();
	}
}

