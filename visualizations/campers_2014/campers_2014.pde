import processing.pdf.*;

boolean recordPdf = false;
color cutColor = color(255, 0, 0);
Table campers;
int camperId = 0;

void setup() {
  size(400, 400);
  campers = getCampers();
}

void draw(){
  
  background(255);
  
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
  fill(0);
  text(camperName, 10, 10);

  // draw  
  pushMatrix();
  translate(width/2, height/2);
  
  // draw center
  fill(255, 0, 0);
  ellipse(0, 0, 10, 10);
  
  // draw hometown
  stroke(cutColor);
  noFill();
  PVector homePos = location2Pos(distToHome, compassToHome);
  ellipse(homePos.x, homePos.y, 10, 10);
  text(hometown, homePos.x + 15, homePos.y);
  
  // draw current city
  stroke(cutColor);
  noFill();
  PVector currentCityPos = location2Pos(distToCurrentCity, compassToCurrentCity);
  ellipse(currentCityPos.x, currentCityPos.y, 10, 10);
  text(currentCity, currentCityPos.x + 15, currentCityPos.y);
  
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
  stroke(cutColor);
  noFill();
  beginShape();
  for(int i = 0; i < skillNames.length; i ++){
    float angleInDegrees = (i*1.0 / skillNames.length) * 360;
    float val = camper.getFloat(skillNames[i]);
    PVector pos = skill2Pos(val, angleInDegrees);
    vertex(pos.x, pos.y);
    text(skillNames[i], pos.x, pos.y + 15);
  }  
  endShape(CLOSE);
}

PVector location2Pos(float dist, float angleInDegrees){
 /*
  x = r * cos(a)
  y = r * sin(a)
 */
 float x = map(dist, 0, 10000, 0, width/2) * cos(radians(angleInDegrees - 90));
 float y = map(dist, 0, 10000, 0, width/2) * sin(radians(angleInDegrees - 90));
 return new PVector(x, y);
}

PVector skill2Pos(float val, float angleInDegrees){
 float x = map(val, 0, 10, 50, width/2) * cos(radians(angleInDegrees - 90));
 float y = map(val, 0, 10, 50, width/2) * sin(radians(angleInDegrees - 90));
 return new PVector(x, y);
}

Table getCampers(){
    return loadTable(sketchPath("../../data/2014/campers.csv"), "header");
}
