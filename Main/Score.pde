// Score is bottom right of the screen
class Score { 

  // Attributes: Position, size
  int x, y; 
  int scoreTextWidth; //score box width
  int scoreTextHeight; //score box height

  // Constructor
  Score() {   

    this.scoreTextWidth = 100;
    this.scoreTextHeight = 100;
    this.x = width-this.scoreTextWidth;
    this.y = height-this.scoreTextHeight;
  }

  // Create update method to display score "box"
  void update() {
    textSize(50);

    // Score displayed in the center of invisible score box
    text(score, this.x + (scoreTextWidth/2), this.y + scoreTextHeight/2);
  }
}
