import processing.pdf.*;

boolean recordPdf = false;
String[] campers;
int camperId = 5;

void setup() {
  size(400, 400);
  campers = getCampers();
}

void draw(){
  
  background(255);
  
  drawCamper(campers[camperId]);

}

void drawCamper(String filename){
  
  String camper = filename.replace(".csv", "");
  
  // start drawing to PDF
  if(recordPdf){
    beginRecord(PDF, camper + ".pdf"); 
  }
  
  // load data from CSV file
  // each row corresponds to a session the Camper attended
  try{
    Table sessions = loadTable(sketchPath("../../data/2013/campers/" + camper + ".csv"), "header");
    fill(0);
    text(camper, 10, 10);
  
    // loop over sessions
    for (TableRow session : sessions.rows()){
      // convert columns to Processing variables
      String title = session.getString("title");
      int day = session.getInt("day");
      int numComments = session.getInt("num_comments");
      // map data to visual properties
      float x = map(day, 0, 31, 0, width); // day determines x position
      float radius = map(numComments, 0, 40, 10, 100); // num attendees for the workshop determines circle size
      noFill();
      ellipse(x, height/2, radius, radius);
    }
  } catch(Exception e){
  }
  
  // finish drawing to PDF
  if(recordPdf){
    endRecord(); 
    recordPdf = false; 
  }

}

String[] getCampers(){
  java.io.File folder = new java.io.File(sketchPath("../../data/2013/campers/"));
  java.io.FilenameFilter csvFilter = new java.io.FilenameFilter() {
    public boolean accept(File dir, String name) {
      return name.toLowerCase().endsWith(".csv");
    }
  };
  return folder.list(csvFilter);
}

void keyPressed(){
  
  if(key == 'p'){
    recordPdf = true;
  }
  
  if(keyCode == LEFT){
    camperId --;
    if(camperId < 0){
      camperId = campers.length - 1;
    }
  } else if(keyCode == RIGHT){
    camperId ++;
    if(camperId >= campers.length){
      camperId = 0;
    }
  }

}
