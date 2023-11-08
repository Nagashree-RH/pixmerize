class Animation {
  float x=1; //by default it will be 1
  float shrinkLimit; //To what scale it should shrink

  public Animation(float value) {

    shrinkLimit = value;
  }

  private void shrink(PImage image) {
    color r = image.pixels[width/2];

    background(r);
    pushMatrix();
    translate(width/2, height/2);
    scale(x);
    imageMode(CENTER);
    image(image, 0, 0);
    popMatrix();
    if (x<=shrinkLimit) {
      x=0;
    } else {
      x=lerp(x, 0.0, 0.01);
      println(x);
    }
  }

  public float getCurrentShrinkValue() {
    return x;
  }

  public void setShrinkLimit(float limit) {
    shrinkLimit=limit;
  }

  public float getShrinkLimit() {
    return shrinkLimit;
  }

  public void resetShrinkValue(int value) {
    x=value;
  }
}
