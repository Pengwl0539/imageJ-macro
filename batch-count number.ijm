macro "Auto Measure and Save"
{
	dir_saving = getDirectory("Choose a Directory to save");
	dir_processing = getDirectory("Choose a Directory to process");
	list = getFileList(dir_processing);
	for(i = 0; i < list.length; i++)
	{
		open(list[i]);
		run("8-bit");
		setAutoThreshold("Default");
		//run("Threshold...");
		//setThreshold(0, 123);
		setOption("BlackBackground", false);
		run("Convert to Mask");
		run("Fill Holes");
		run("Watershed");
		saveAs("tiff", "D:/light-output/"+ getTitle);
		run("Analyze Particles...", "size=10-Infinity show=[Overlay Masks] display exclude clear summarize add in_situ");
		close();
		saveAs("Results", "D:/light-output/" + i+1 + ".csv");
		run("Close");
	}
}

