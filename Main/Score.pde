// Score is bottom right of the screen
class Score { 

  //declared attributes
  int xPos; //x position ofs score box
  int yPos; //y position of box
  int boxWidth; //score box width
  int boxHeight; //score box height

  //create constructor
  Score() {   
    //initialize attributes
    this.boxWidth = 100;
    this.boxHeight = 100;
    this.xPos = width-this.boxWidth;
    this.yPos = height-this.boxHeight;
  }

  //create update method to display score box
  void update() {
    textSize(50);
    //Score displayed in the center of invisible score box
    text(score, this.xPos + (boxWidth/2), this.yPos + boxHeight/2);
  }
}
