/**
 Chaotic System - A classic example of that is Double Pendulum
 
 @Author - Nagashree R H
 Version - 1.0
 Description - I have developed a simulation of a double pendulum,a classic example
 of a chaotic system,which shows the complex trajectories that emerge from this system.
 */


Bob b;
float px, py=-1;
PGraphics graphics; //used to trace the path of the double pendulum

void setup() {
  size(1080, 1920, P2D);

  b=new Bob();

  graphics = createGraphics(width, height);
  graphics.beginDraw();
  graphics.background(0);
  graphics.endDraw();
}

void draw() {
  image(graphics, 0, 0);
  translate(width/2, 600);

  b.go();

  graphics.beginDraw();
  graphics.stroke(random(255), random(255), random(255));
  graphics.translate(width/2, 600);
  graphics.strokeWeight(1);
  if (px!=-1 && py!=-1)
    graphics.line(px, py, b.x2, b.y2);
  graphics.endDraw();

  px=b.x2;
  py=b.y2;
}
