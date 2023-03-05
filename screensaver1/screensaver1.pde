ArrayList<PVector> pos1 = new ArrayList<PVector>();
ArrayList<PVector> pos2 = new ArrayList<PVector>();
color currColor;
ArrayList<Integer> colors = new ArrayList<Integer>();
PVector vel1;
PVector vel2;

void setup() {
  fullScreen();
  //size(1280, 720);
  randomSeed(123456789);
  currColor = color((int)random(255), (int)random(255), (int)random(255));
  vel1 = new PVector(random(50), random(50));
  vel2 = new PVector(random(50), random(50));
}

// called every frame
void ss(int limit) {
  colors.add(currColor);
  if (pos1.size() == 0) {
    pos1.add(new PVector());
    pos2.add(new PVector());
  }
  else {
    int inx = pos1.size()-1;
    PVector v1 = PVector.add(pos1.get(inx), vel1);
    PVector v2 = PVector.add(pos2.get(inx), vel2);
    
    if (v1.x < 0 || v1.x > width) {
      vel1.x *= -1;
      currColor = color((int)random(255), (int)random(255), (int)random(255));
    }
    if (v1.y < 0 || v1.y > height) {
      vel1.y *= -1;
      currColor = color((int)random(255), (int)random(255), (int)random(255));
    }
    
    if (v2.x < 0 || v2.x > width) {
      vel2.x *= -1;
      currColor = color((int)random(255), (int)random(255), (int)random(255));
    }
    if (v2.y < 0 || v2.y > height) {
      vel2.y *= -1;
      currColor = color((int)random(255), (int)random(255), (int)random(255));
    }
    
    v1 = PVector.add(pos1.get(inx), vel1);
    v2 = PVector.add(pos2.get(inx), vel2);
    pos1.add(v1);
    pos2.add(v2);
  }
  if (pos1.size() >= limit) {
    pos1.remove(0);
    pos2.remove(0);
    colors.remove(0);
  }
  
  strokeWeight(2.5f);
  for (int i = 0; i < pos1.size(); i++) {
    stroke(colors.get(i));
    float x1 = pos1.get(i).x;
    float y1 = pos1.get(i).y;
    float x2 = pos2.get(i).x;
    float y2 = pos2.get(i).y;
    line(x1, y1, x2, y2);
  }
}

void draw() {
  background(0);
  ss(100);
}
