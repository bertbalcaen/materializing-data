size(800, 400);
Table campers = loadTable(sketchPath("../../data/2014/campers.csv"), "header");
int row = 0;
int column = 0;
int camperSize = 100; 
for(TableRow camper : campers.rows()){
  // move to position in grid
  pushMatrix();
  translate(column * camperSize + camperSize * 0.5, row * camperSize + camperSize * 0.5);
  noFill();
  // draw box around camper
  rectMode(RADIUS);
  rect(0, 0, camperSize/2, camperSize/2);
  // convert data to processing vars
  String name = camper.getString("name");
  float distToHome = camper.getFloat("distance from ITP to hometown");
  float angle = camper.getFloat("compass from ITP to hometown");
  // for now just add data as text
  fill(0);
  textAlign(CENTER);
  text(distToHome, 0, 0);
  text(angle, 0, 20);
  text(name, 0, 40);
  popMatrix();
  // check position in grid
  column ++;
  if(column >= 10){
    column = 0;
    row ++;
  }
}
