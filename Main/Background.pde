//Static background image, originally scrolling but changed to the town image as the appearance improved overall

class Background {
  private PImage picture;
  private PImage splashDraw;
  //constructor
  public Background() {
    //Background image
    picture = loadImage("backGround.png");
    splashDraw = loadImage("backGround2new.png");
  }

  public void drawBackground()
  {

    //Size it to fit screen and positioned
    picture.resize(width, height);
    image(picture, 0, y);
    image(picture, 0, y+picture.height);
  }



  public void drawSplash()
  {

    //Size it to fit screen and positioned
    splashDraw.resize(width, height);
    image(splashDraw, 0, y);
    image(splashDraw, 0, y+splashDraw.height);
  }
}
