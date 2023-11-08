class ImageFilters {



  //grey filter
  private float greyFilter(float r, float g, float b) {
    float weightedValue = 0.299*r + 0.587*g + 0.114*b;
    return weightedValue;
  }

  //negativeFilter
  private float[] negativeFilter(float r, float g, float b)
  {

    //negative filter
    float mr = 255-r;
    float mg= 255-g;
    float mb=255-b;
    float[] value = {mr, mg, mb};
    return value;
  }

  //sepia filter
  private float[] sepiaFilter(float r, float g, float b) {

    //sepia filter - reddish brown
    float tr = (r * 0.393) + (g * 0.769) + (b * 0.189);

    float tg = (r * 0.349) + (g * 0.686) + (b * 0.168);

    float tb = (r * 0.272) + (g * 0.534) + (b * 0.131);

    float[] value = {tr, tg, tb};

    return value;
  }

  /*
It is a modification of the negative filter, where only one of the color is reversed
   You can pass in any component r or g or b.
   Many combinations can be made in this
   */
  private float colorFilter(float colorReceived)
  {
    float value = 255-colorReceived;
    return value;
  }

  /*
It is a modification of the negative filter, where two  color components is reversed
   You can pass in any component r or g or b.
   Many combinations can be made in this
   */
  private float[] modifyTwoColorComponents(float colorReceivedOne, float colorReceivedTwo)
  {
    float value1 = 255-colorReceivedOne;
    float value2 = 255-colorReceivedTwo;
    float[] value = {value1, value2};
    return value;
  }

  //enhancing one paticular color
  private float enhance(float colorReceived)
  {
    float value = 255+colorReceived;
    return value;
  }
}
