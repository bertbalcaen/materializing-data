Table campers = loadTable(sketchPath("../../data/2014/campers.csv"), "header");
for(TableRow camper : campers.rows()){
  String name = camper.getString("name");
  float distToHome = camper.getFloat("distance from ITP to hometown");
  println(name);
  println(distToHome);
}

