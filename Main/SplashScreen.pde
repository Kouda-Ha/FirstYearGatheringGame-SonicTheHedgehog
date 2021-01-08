//MAIN MENU / INSTRUCTIONS / SPLASH SCREEN 
class SplashScreen { 

  //declare attributes of Game Instructions
  int xPosTitle; 
  int yPosTitle; 
  int xPosText; 
  int yPosText; 
  String splashScreenText;
  boolean hideText; 

  //Create constructor
  SplashScreen() {
    //initialize attributes
    this.xPosTitle = width/2;
    this.yPosTitle = 0 + height/8;
    this.xPosText= width/2;
    this.yPosText = height/2;

    //INSTRUCTIONS
    this.splashScreenText= "Sonic had his rings stolen! Instructions: Use the arrow keys to move, collect Sonic's Gold Rings to increase the score! Avoid the Dr. Eggman's Red Rings and his Ladybirds or your score will lessen. Avoid his clones or it's game over! You have 60 seconds to try. Clicking the mouse again will restart the level.";
    this.hideText = false; //text will be shown
  }

  void update() {

    if (!this.hideText) {
      //A background colour for before game start
      background(211, 211, 211);

      //text colour, position, size, text
      fill(0); 
      textAlign(CENTER); 

      //Game title, top centre.
      textSize(50); 
      text("Rings for Sonic!", this.xPosTitle, this.yPosTitle); 

      //Game instructions, position, size, text
      textSize(20); 
      text(this.splashScreenText, width/4, height/6, this.xPosText, this.yPosText);
    }
  }


  //create method to remove text from the sketch window
  void remove() {
    this.hideText = true;
  }


  //At end of game, display this.
  void timesUp() {
    if (this.hideText) {
      //Splash screen overlays once the timer ends
      this.splashScreenText = "Game finished!";
      this.hideText = false;
    }
  }
  void gameOver() {
    if (this.hideText) {
      //Splash screen overlays if Eggman touches you
      this.splashScreenText = "Eggman caught you! Game over!";
      this.hideText = false;
    }
  }
}
