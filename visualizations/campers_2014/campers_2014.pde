import processing.pdf.*;

boolean recordPdf = false;
Table campers;
int camperId = 0;
float radiusInches = 2;

void setup() {
  size(500, 500);
  //size((int)inches2Px(12), (int)inches2Px(12));
  campers = getCampers();
}

void draw(){
  
  background(255);
  
  drawRuler();
  
  drawCamper(camperId);

}

void drawCamper(int camperId){
  
  TableRow camper = campers.getRow(camperId);
  
  // convert columns to Processing variables
  String camperName = camper.getString("name");
  
  String hometown = camper.getString("hometown");
  float distToHome = camper.getFloat("distance from ITP to hometown");
  float compassToHome = camper.getFloat("compass from ITP to hometown");
  
  String currentCity = camper.getString("current city");
  float distToCurrentCity = camper.getFloat("distance from ITP to current city");
  float compassToCurrentCity = camper.getFloat("compass from ITP to current city");
  
  String[] skillNames = {
    "web knowledge",
    "digital fabrication knowledge",
    "wearables knowledge",
    "a/v knowledge",
    "creative coding knowledge",
    "mobile knowledge"
  };

  String[] desiredSkillNames = {
    "web desired knowledge",
    "digital fabrication desired knowledge",
    "wearables desired knowledge",
    "a/v desired knowledge",
    "creative coding desired knowledge",
    "mobile desired knowledge"
  };

  // start drawing to PDF
  if(recordPdf){
    beginRecord(PDF, camperName + ".pdf"); 
  }
  
  // add camper name
  guideText();
  text(camperName, inches2Px(0.5), inches2Px(0.5));

  // draw  
  pushMatrix();
  translate(width/2, height/2);

  // draw circle
  vectorCut();  
  ellipse(0, 0, inches2Px(radiusInches*2), inches2Px(radiusInches*2));
  
  // draw hometown
  vectorEtch();
  PVector homePos = location2Pos(distToHome, compassToHome);
  ellipse(inches2Px(homePos.x), inches2Px(homePos.y), inches2Px(0.1), inches2Px(0.1));
  rasterEtch();
  text(hometown, inches2Px(homePos.x + 0.25), inches2Px(homePos.y));
  
  // draw current city
  vectorEtch();
  PVector currentCityPos = location2Pos(distToCurrentCity, compassToCurrentCity);
  ellipse(inches2Px(currentCityPos.x), inches2Px(currentCityPos.y), inches2Px(0.1), inches2Px(0.1));
  rasterEtch();
  text(currentCity, inches2Px(currentCityPos.x + 0.25), inches2Px(currentCityPos.y));
  
  // draw skills
  drawSkills(camper, skillNames);
  drawSkills(camper, desiredSkillNames);
  
  popMatrix();
  
  // finish drawing to PDF
  if(recordPdf){
    endRecord(); 
    recordPdf = false; 
  }

}

void keyPressed(){
  
  if(key == 'p'){
    recordPdf = true;
  }
  
  if(keyCode == LEFT){
    camperId --;
    if(camperId < 0){
      camperId = campers.getRowCount() - 1;
    }
  } else if(keyCode == RIGHT){
    camperId ++;
    if(camperId >= campers.getRowCount()){
      camperId = 0;
    }
  }

}

void drawSkills(TableRow camper, String[] skillNames){
  // draw shape
  vectorEtch();
  beginShape();
  for(int i = 0; i < skillNames.length; i ++){
    float angleInDegrees = (i*1.0 / skillNames.length) * 360;
    float val = camper.getFloat(skillNames[i]);
    PVector pos = skill2Pos(val, angleInDegrees);
    vertex(inches2Px(pos.x), inches2Px(pos.y));
  }  
  endShape(CLOSE);
  // draw labels
  for(int i = 0; i < skillNames.length; i ++){
    float angleInDegrees = (i*1.0 / skillNames.length) * 360;
    float val = 1;
    PVector pos = skill2Pos(val, angleInDegrees);
    rasterEtch();
    text(skillNames[i].substring(0, 1), inches2Px(pos.x), inches2Px(pos.y));
  }  
}

PVector location2Pos(float dist, float angleInDegrees){
 /*
  x = r * cos(a)
  y = r * sin(a)
 */
 float x = map(dist, 0, 7000, 0, radiusInches * .95) * cos(radians(angleInDegrees - 90));
 float y = map(dist, 0, 7000, 0, radiusInches * .95) * sin(radians(angleInDegrees - 90));
 return new PVector(x, y);
}

PVector skill2Pos(float val, float angleInDegrees){
 float x = map(val, 0, 10, 0.25, radiusInches * .95) * cos(radians(angleInDegrees - 90));
 float y = map(val, 0, 10, 0.25, radiusInches * .95) * sin(radians(angleInDegrees - 90));
 return new PVector(x, y);
}

Table getCampers(){
    return loadTable(sketchPath("../../data/2014/campers.csv"), "header");
}

void drawRuler() {
  textAlign(CENTER);
  for(int i = 0; i < 10; i ++){
    guide();
    line(inches2Px(i), 0,  inches2Px(i), inches2Px(0.1));
    guideText();
    text(i, inches2Px(i), inches2Px(0.3));
  }
  textAlign(LEFT);
}

float inches2Px(float inches){
  // see http://wiki.imal.org/howto/calculate-pdfwindow-size-processing
  return inches * 72;
}

void vectorCut(){
  noFill();
  stroke(255, 0, 0);
}

void vectorEtch(){
  noFill();
  stroke(0, 0, 255);
}

void rasterEtch(){
  fill(0, 0, 0);
  noStroke();
}

void guide(){
  noFill();
  stroke(0, 255, 0);
}

void guideText(){
  fill(0, 255, 0);
  noStroke();
}
