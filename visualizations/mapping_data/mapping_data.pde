size(800, 400);
Table campers = loadTable(sketchPath("../../data/2014/campers.csv"), "header");
int camperNumber = 0;
for(TableRow camper : campers.rows()){
  String name = camper.getString("name");
  float distToHome = camper.getFloat("distance from ITP to hometown");
  println(name);
  println(distToHome);
  float y = camperNumber * 30 + 10;
  float textColor = map(distToHome, 0, 6000, 0, 255);
  fill(textColor);
  text(name, 0, y);
  camperNumber ++;
}

