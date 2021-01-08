//Static background image, originally scrolling but changed to the town image as the appearance improved overall

class Background {

  public void drawBackground()
  {
    //Background image
    background = loadImage("backGround.png");
    
    //Size it to fit screen and positioned
    background.resize(width, height);
    image(background, 0, y);
    image(background, 0, y+background.height);
  }
}
