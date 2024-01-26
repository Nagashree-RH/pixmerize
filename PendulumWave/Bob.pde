class Bob {

  PVector origin;
  int length;
  float g =1;
  float damping =0.99;
  float aVel=0;
  float aAcc =0;
  float a=PI/2;
  PVector bobLoc;
  int bobSize;
  color c;

  Bob(PVector origin, int len, int bobSize) {
    this.origin = new PVector(origin.x, origin.y);
    length=len;
    this.bobSize=bobSize;
    c=color(random(0, 255), random(0, 255), random(0, 255));
  }

  void update() {

    aAcc=(-1 * g / length) * sin(a);
    aVel+=aAcc;
    aVel*=damping;
    a+=aVel;
  }

  void calcBobLoc() {

    float x= origin.x+length*sin(a);
    float y = origin.y+length*cos(a);

    bobLoc= new PVector(x, y);
  }

  void go() {

    calcBobLoc();
    update();
    display();
  }

  void display() {
    stroke(255);
    line(origin.x, origin.y, bobLoc.x, bobLoc.y);
    fill(c);
    ellipse(bobLoc.x, bobLoc.y, bobSize, bobSize);
  }
}
