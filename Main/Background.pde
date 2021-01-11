// Class for backgrounds, SlashScreen will inherit from this too
// Please check README.txt and 'Picture References' in the Zip folder for the references to the sprites/pictures used (Background: references: 6,7,8,9,10,11)

class Background {
  private PImage picture;
  private PImage splashDraw;
  //constructor
  public Background() {

    // A static background image for the gameplay, originally scrolling but changed to the town image as the appearance improved overall
    picture = loadImage("backGround.png");

    // The background for the Splash Screens, similar to the game play screen and also static
    splashDraw = loadImage("backGround2new.png");
  }

  // Used in BackGround
  public void drawBackground()
  {

    // Size it to fit screen and positioned
    picture.resize(width, height);
    image(picture, 0, y);
    image(picture, 0, y+picture.height);
  }

  // Used in SplashScreen
  public void drawSplash()
  {

    // Size it to fit screen and positioned
    splashDraw.resize(width, height);
    image(splashDraw, 0, y);
    image(splashDraw, 0, y+splashDraw.height);
  }
}
