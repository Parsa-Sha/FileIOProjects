// GetFolderInfo
// Takes folder information such as the number of files and names of each one
// Methods for java.io.File library: https://www.geeksforgeeks.org/file-class-in-java/
// https://github.com/Parsa-Sha/FileIOProjects


import java.io.File;

String path;
String[] fileNames = new String[10];
boolean systemInProgress = false;
int numberOfFiles = 0;
File dir = new File("");
File [] files = dir.listFiles();
  
void setup() {
  size(900, 400);
}

void draw(){ 
  background(0);
  if(!systemInProgress) {
    selectFolder("Select a folder to process:", "folderSelected"); 
    systemInProgress = true;
  } 
  
  if (path != null) {
    fill(128, 150, 128);
    textAlign(CENTER);
    textSize(75);
    text("FOLDER INFO", width/2, 80);
    
    textAlign(LEFT);
    textSize(20);
    text(path + ", " + numberOfFiles + " files", 20, 120);
    
    for(int i = 0; i < numberOfFiles; i++) {
      text(i + 1 + ". " + files[i].getName(), 50, 50 * i + 170);
    }
  }
}

void folderSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    path = selection.getAbsolutePath();
  }
  
  dir = new File(path);
  files = dir.listFiles();
  numberOfFiles = files.length;  
}
