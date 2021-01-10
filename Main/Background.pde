//Static background image, originally scrolling but changed to the town image as the appearance improved overall

class Background {
  private PImage picture;
  //constructor
  public Background() {
    //Background image
    picture = loadImage("backGround.png");
  }

  public void drawBackground()
  {

    //Size it to fit screen and positioned
    picture.resize(width, height);
    image(picture, 0, y);
    image(picture, 0, y+picture.height);
  }
}
