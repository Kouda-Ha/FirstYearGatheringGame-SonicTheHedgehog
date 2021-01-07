//MAIN MENU / INSTRUCTIONS / SPLASH SCREEN 
class SplashScreen { 

  //declare attributes of Game Instructions
  int xPosTitle; 
  int yPosTitle; 
  int xPosText; 
  int yPosText; 
  String instructionText;
  boolean hideText; 

  //Create constructor
  SplashScreen() {
    //initialize attributes
    this.xPosTitle = width/2;
    this.yPosTitle = 0 + height/8;
    this.xPosText= width/2;
    this.yPosText = height/2;

    //INSTRUCTIONS
    this.instructionText= "Sonic lost his rings on the freeway. Instructions: Use the arrow keys to move, collect the Gold Rings to increase your score. Avoid the Dr. Eggman's Red Rings or your score will lessen. Avoid his clones or game over! You have 60 seconds to try. Clicking the mouse again will restart the level.";
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
      text("Collect Sonic's Rings!", this.xPosTitle, this.yPosTitle); 

      //Game instructions, position, size, text
      textSize(20); 
      text(this.instructionText, width/4, height/6, this.xPosText, this.yPosText);
    }
  }


  //create method to remove text from the sketch window
  void remove() {
    this.hideText = true;
  }


  //At end of game, display this.
  void gameOver() {
    if (this.hideText) {
      //Splash screen overlays once the timer ends
      this.instructionText = "Game finished! Click mouse to restart!";
      this.hideText = false;
      
    }
  }
}
