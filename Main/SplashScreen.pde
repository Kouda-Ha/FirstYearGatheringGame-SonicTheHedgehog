//The HOW TO PLAY/Splash screen. SplashScreen inherits from BackGround.

class SplashScreen extends Background { 

  // Declare attributes of Game Title and "How to Play"
  int xPosGameTitle, yPosGameTitle; 
  int xPosHowToPlay, yPosHowToPlay; 
  String splashScreenText;
  boolean hideText; 
  PImage splashScreenImage;

  // Constructor
  SplashScreen() {
    //initialize attributes
    this.xPosGameTitle = width/2;
    this.yPosGameTitle = height/8;
    this.xPosHowToPlay= width/3;
    this.yPosHowToPlay = height/2;

    // 'How to Play' text to overlay SplashScreen
    this.splashScreenText= "Sonic had his rings stolen! How to Play: Move with arrow keys, collect Sonic's Gold Rings to increase the score. Avoid the Dr. Eggman's Red Rings or your rings will lessen! Avoid his clones or it's game over! Attack the Ladybirds to gain a friend! You have 60 seconds. Clicking the mouse again will restart the level. (Cheat code: If the game is too hard, pressing 'b' will incresase the birds indefinately).";
    this.hideText = false; //text will be shown
  }

  void update() {
    if (!this.hideText) {

      //A background for before game start
      drawSplash();

      textAlign(CENTER); 
      fill(0);
      // Game title position
      textSize(50); 
      text("Gather Sonic's Rings!", this.xPosGameTitle, this.yPosGameTitle); 

      // Game 'How to play' instructions, position, size, text
      textSize(20); 
      text(this.splashScreenText, this.xPosHowToPlay, this.yPosHowToPlay, this.xPosHowToPlay, this.yPosHowToPlay);
    }
  }

  // Create method to remove text once game starts
  void remove() {
    this.hideText = true;
  }

  // Starts game, removes overlay splash screen
  void startGame() {
    gameMode = PLAYING;
    splashScreen.remove();
  }

  // Reset timer and score
  void resetGame() {
    gameTimer.reset();
    score = 0;
  }

  // At end of game without game over, display end of game screen
  void timesUp() {

    // Eggman hasn't caught player, so player wins overlay
    if (this.hideText) {
      //Splash screen overlays once the timer ends
      this.splashScreenText = "Game finished! Congratulations, you avoided Eggman's clones! Click to have another go!";
      this.hideText = false;
    }
  }

  // At end of game with game over, display game over screen
  void gameOver() {
    if (this.hideText) {

      // Splash screen overlays if Eggman touches you
      this.splashScreenText = "Oh no! Eggman caught you! It's Game Over! Click your mouse to restart and try again!";
      this.hideText = false;
      gameMode = FINISHED;
    }
  }
}
