/**
 Chaotic System - A classic example of that is Double Pendulum
 
 @Author - Nagashree R H
 Version - 1.0
 Description - 40,000double pendulums simulation is done which results in a chaotic system,
 The number of double pendulums can be changed according to the requirment
 */


ArrayList<Bob> b = new ArrayList<>();

void setup() {
  size(1080, 1920, P2D);
  float theta=45;
  float numPendulums = 40000;
  for (int i=0; i<numPendulums; i++) {
    color c = colorPicker(i);
    b.add(new Bob(c, radians(theta)));
    //theta should decrease as the number of pendulums increase so that the pendulums are close to each other .
    theta+=0.001;
  }
}

void draw() {

  background(0);
  translate(width/2, height/2);

  for (int i=0; i<b.size(); i++) {
    Bob bob = b.get(i);
    bob.go();
  }
}
/**
 This color picker is just to have a good gradient of colors based on the number of pendulums the range can be changed
 */
color colorPicker(int value) {
  color purple = color(#711DB0, 50);
  color pink = color(#C21292, 80);
  color red = color(#EF4040, 100);
  color yellow = color(#FFA732, 50);
  if (value<=10000)
    return purple;
  else if (value>10000 && value<=20000)
    return pink;
  else if (value>20000 && value<=30000)
    return red;
  else if (value>30000 && value<=40000)
    return yellow;
  else
    return yellow;
}
