ArrayList<ArrayList<PVector>> pos1 = new ArrayList<ArrayList<PVector>>();
ArrayList<ArrayList<PVector>> pos2 = new ArrayList<ArrayList<PVector>>();
ArrayList<Integer> currColor = new ArrayList<Integer>();
ArrayList<ArrayList<Integer>> colors = new ArrayList<ArrayList<Integer>>();
ArrayList<PVector> vel1 = new ArrayList<PVector>();
ArrayList<PVector> vel2 = new ArrayList<PVector>();

final int TRAILLENGTH = 25;
final int LINESAMOUNT = 5;

void setup() {
  fullScreen();
  //size(1280, 720);
  randomSeed(123456789);
  for (int i = 0; i < LINESAMOUNT; i++) {
    currColor.add(color((int)random(255), (int)random(255), (int)random(255)));
    vel1.add(new PVector(random(50), random(50)));
    vel2.add(new PVector(random(50), random(50)));
    colors.add(new ArrayList<Integer>());
    pos1.add(new ArrayList<PVector>());
    pos2.add(new ArrayList<PVector>());
  }
}

void ss(int limit, int amt) {
  for (int i = 0; i < amt; i++) {
    colors.get(i).add(currColor.get(i));
    if (pos1.get(i).size() == 0) {
      pos1.get(i).add(new PVector());
      pos2.get(i).add(new PVector());
    }
    else {
      int inx = pos1.get(i).size()-1;
      PVector v1 = PVector.add(pos1.get(i).get(inx), vel1.get(i));
      PVector v2 = PVector.add(pos2.get(i).get(inx), vel2.get(i));
      
      if (v1.x < 0 || v1.x > width) {
        vel1.set(i, new PVector(vel1.get(i).x * -1, vel1.get(i).y));
        currColor.set(i, color((int)random(255), (int)random(255), (int)random(255)));
      }
      if (v1.y < 0 || v1.y > height) {
        vel1.set(i, new PVector(vel1.get(i).x, vel1.get(i).y * -1));
        currColor.set(i, color((int)random(255), (int)random(255), (int)random(255)));
      }
      
      if (v2.x < 0 || v2.x > width) {
        vel2.set(i, new PVector(vel2.get(i).x * -1, vel2.get(i).y));
        currColor.set(i, color((int)random(255), (int)random(255), (int)random(255)));
      }
      if (v2.y < 0 || v2.y > height) {
        vel2.set(i, new PVector(vel2.get(i).x, vel2.get(i).y * -1));
        currColor.set(i, color((int)random(255), (int)random(255), (int)random(255)));
      }
      
      v1 = PVector.add(pos1.get(i).get(inx), vel1.get(i));
      v2 = PVector.add(pos2.get(i).get(inx), vel2.get(i));
      pos1.get(i).add(v1);
      pos2.get(i).add(v2);
    }
    if (pos1.get(i).size() >= limit) {
      pos1.get(i).remove(0);
      pos2.get(i).remove(0);
      colors.get(i).remove(0);
    }
    
    strokeWeight(2.5f);
    for (int j = 0; j < pos1.get(i).size(); j++) {
      stroke(colors.get(i).get(j));
      float x1 = pos1.get(i).get(j).x;
      float y1 = pos1.get(i).get(j).y;
      float x2 = pos2.get(i).get(j).x;
      float y2 = pos2.get(i).get(j).y;
      line(x1, y1, x2, y2);
    }
  }
}

void draw() {
  background(0);
  ss(TRAILLENGTH, LINESAMOUNT);
}
