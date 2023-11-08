/**
 Image filters with shrink animation
 
 @Author - Nagashree R H
 Version - 1.0 
 Description - Few image filters with shrink. 
 */



PImage picture;
int choice=0;
ImageFilters imageFilter;
Animation animation;
PImage newImage;


void setup() {
  size(410, 616);
  picture =loadImage("flower.jpg");
  imageFilter = new ImageFilters();
  animation = new Animation(0.5);
  newImage = createImage(410, 616, RGB);
}

void draw() {

  picture.loadPixels();

  for (int x=0; x<picture.width; x++) {
    for (int y=0; y<picture.height; y++) {

      int loc = x+y*picture.width;
      color c = picture.pixels[loc];
      float r = c >> 16 & 0xFF;
      float g = c>> 8 & 0xFF;
      float b = c & 0xFF;

      switch(choice) {

      case 0:
        newImage.pixels[loc]=picture.pixels[loc];
        break;
      case 1:   //grey filter
        float value = imageFilter.greyFilter(r, g, b);
        newImage.pixels[loc] = color(value);
        break;

      case 2:
        float[] filterValue = imageFilter.negativeFilter(r, g, b);
        newImage.pixels[loc] = color(filterValue[0], filterValue[1], filterValue[2]);
        break;

      case 3:
        float[] sepiaFilter = imageFilter.sepiaFilter(r, g, b);
        newImage.pixels[loc] = color(sepiaFilter[0], sepiaFilter[1], sepiaFilter[2]);
        break;

      case 4:
        //modifying red component
        float valuer = imageFilter.colorFilter(r);
        newImage.pixels[loc] = color(valuer, g, b);
        break;

      case 5:
        //modifying green component
        float valueg = imageFilter.colorFilter(g);
        newImage.pixels[loc] = color(r, valueg, b);
        break;

      case 6:
        //modifying blue component
        float valueb = imageFilter.colorFilter(b);
        newImage.pixels[loc] = color(r, g, valueb);
        break;
      case 7:
        //modifying red and green component
        float[] modified = imageFilter.modifyTwoColorComponents(r, g);
        newImage.pixels[loc] = color(modified[0], modified[1], b);
        break;

      case 8:
        //modifying blue component
        float en = imageFilter.enhance(b);
        newImage.pixels[loc] = color(r, g, en);
        break;

      default:
        choice=1;
        //newImage=picture;
        break;
      }
    }
  }
  newImage.updatePixels();
  if (animation.getCurrentShrinkValue()<=animation.getShrinkLimit()) {
    choice++;
    animation.resetShrinkValue(1);
  } else {
    animation.shrink(newImage);
  }
  //saveFrame("output/image-####.png");
}
