PImage worldImage;
Table table;

int currentYear = 1800;

void setup() {
  size(1200, 600);
  worldImage = loadImage("data/world.jpg");
  worldImage.resize(1200, 600);  
  table = loadTable("data/Meteorite_Landings.csv", "header");
}

void draw() {
  background(worldImage);
  currentYear++;
  println(currentYear);
  for (TableRow row : table.rows()) {
    String name = row.getString("name");
    float mass = row.getFloat("mass");
    float reclat = row.getFloat("reclat");
    float reclong = row.getFloat("reclong");
    int year = row.getInt("year");
    println(year);
    // latitude = -90 to +90
    // longitude = -180 to +180

    float mapx = map(reclong, -180, 180, 0, width);
    float mapy = map(reclat, 90, -90, 0, height);

    float mapMass = map(mass, 0, 5000000, 3, 8);


    if (currentYear == year) {
      stroke(255, 0, 0);
      strokeWeight(0.1);
      //fill(255, 0, 0);
      point(mapx, mapy);
    }
    //ellipse(mapx, mapy, mapMass, mapMass);
  }
}
