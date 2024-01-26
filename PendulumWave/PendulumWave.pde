/**
 Pendulum Wave
 
 @Author - Nagashree R H
 Version - 1.0 
 Description - Many pendulums with increasing lengths are started together,which swing along to make a pendulum wave. 
 */

Bob bob;
ArrayList<Bob> bobs=new ArrayList<Bob>();

void setup() {
  size(1080, 1920, P3D);
  int bobSize=30;
  int length=200;
  for (int i=bobSize; i<width; i+=bobSize) {
    bobs.add(new Bob(new PVector(width/2, 0), length, 40));
    length+=50;
  }
}

void draw() {
  background(0);
  for (int i=0; i<bobs.size(); i++) {
    bob=bobs.get(i);
    bob.go();
  }
}
