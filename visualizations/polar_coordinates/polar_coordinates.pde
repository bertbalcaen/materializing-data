Table campers;
int camperSize = 200; 

void setup(){
  size(800, 400);
  campers = loadTable(sketchPath("../../data/2014/campers.csv"), "header");
}

void draw(){
  background(255);
  int row = 0;
  int column = 0;
  for(TableRow camper : campers.rows()){
    // move to position in grid
    pushMatrix();
    translate(column * camperSize + camperSize * 0.5, row * camperSize + camperSize * 0.5);
    drawCamper(camper);
    popMatrix();
    // check position in grid
    column ++;
    if(column >= 10){
      column = 0;
      row ++;
    }
  }
}

void drawCamper(TableRow camper){
  noFill();
  // draw box around camper
  rectMode(RADIUS);
  rect(0, 0, camperSize/2, camperSize/2);
  // convert data to processing vars
  String name = camper.getString("name");
  float distToHome = camper.getFloat("distance from ITP to hometown");
  float angle = camper.getFloat("compass from ITP to hometown");
  // dot in the center
  fill(255, 0, 0);
  ellipse(0, 0, 5, 5);
  // show home town
  noFill();
  textAlign(CENTER);
  ellipseMode(CENTER);
  float x = map(distToHome, 0, 6000, 0, camperSize/2) * cos(radians(angle - 90));
  float y = map(distToHome, 0, 6000, 0, camperSize/2) * sin(radians(angle - 90));
  ellipse(x, y, 10, 10);
  fill(0);
  text(name, 0, camperSize/2 + 15);
}
