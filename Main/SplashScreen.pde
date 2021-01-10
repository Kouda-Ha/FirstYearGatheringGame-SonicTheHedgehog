//HOW TO PLAY / SPLASH SCREEN 
class SplashScreen extends Background { 

  //declare attributes of Game Title and "How to Play"
  int xPosGameTitle, yPosGameTitle; 
  int xPosHowToPlay, yPosHowToPlay; 
  String splashScreenText;
  boolean hideText; 
  PImage splashScreenImage;
  //Constructor
  SplashScreen() {
    //initialize attributes
    this.xPosGameTitle = width/2;
    this.yPosGameTitle = height/8;
    this.xPosHowToPlay= width/3;
    this.yPosHowToPlay = height/2;

    //INSTRUCTIONS
    this.splashScreenText= "Sonic had his rings stolen! How to Play: Move with arrow keys, collect Sonic's Gold Rings to increase the score! Avoid the Dr. Eggman's Red Rings or your score will lessen. Avoid his clones or it's game over! Attack the Ladybirds to gain a friend! You have 60 seconds to try. Clicking the mouse again will restart the level.";
    this.hideText = false; //text will be shown
  }

  void update() {
    if (!this.hideText) {

      //A background colour for before game start

      drawSplash();


      textAlign(CENTER); 
      fill(0);
      //Game title, top centre.
      textSize(50); 
      text("Rings for Sonic!", this.xPosGameTitle, this.yPosGameTitle); 

      //Game instructions, position, size, text
      textSize(20); 
      text(this.splashScreenText, this.xPosHowToPlay, this.yPosHowToPlay, this.xPosHowToPlay, this.yPosHowToPlay);
    }
  }


  //create method to remove text from the sketch window
  void remove() {
    this.hideText = true;
  }
  //Method: Starts game, removes overlay splash screen
  void startGame() {
    gameMode = PLAYING;
    splashScreen.remove();
  }


  //Method: Reset timer and score
  void resetGame() {
    gameTimer.reset();
    score = 0;
  }

  //Method: At end of game, display this.
  void timesUp() {
    if (this.hideText) {
      //Splash screen overlays once the timer ends
      this.splashScreenText = "Game finished! Click to have another go!";
      this.hideText = false;
    }
  }

  //Method: Game over
  void gameOver() {
    if (this.hideText) {
      //Splash screen overlays if Eggman touches you
      this.splashScreenText = "Eggman caught you! Game over! Click your mouse to restart and try again!";
      this.hideText = false;
      gameMode = FINISHED;
    }
  }
}
