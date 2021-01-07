class Background {

  public void drawBackground()
  {
    //Background image
    background = loadImage("backGround3.png");
    background.resize(width, height);

    //Background movement
    image(background, 0, y);
    image(background, 0, y+background.height);
    //y -=4;
    //if (y == -background.height)
    //  y=0;
  }
}
