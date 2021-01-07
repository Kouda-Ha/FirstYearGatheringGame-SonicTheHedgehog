//Both the Enemy AND collectable are coins, so I made Coin class so Enemy and Gold can extend from this.

class Coin { 

  //Attributes: Position, size, speed, colour, value
  float xPosition;
  float yPosition;
  float diameter;
  float speed;
  color coinColour;
  float value;


  //First constructor no parameters: Set default x and y position
  Coin() { 
    this(random(0, width), 0);
  }

  //Second constructor two parameters: x and y 
  Coin(float x, float y) {    
    this.xPosition = x;
    this.yPosition = y;
  }

  //Function: Return coin value
  float getValue() { 
    return this.value;
  }

  //Function: Return coin x position
  float getXPosition() {
    return this.xPosition;
  }

  //Function: Return coin y position
  float getYPosition() {
    return this.yPosition;
  }

  //Function: Returncoin size
  float getDiameter() {
    return this.diameter;
  }

  //Method: Update coins
  void update() {
    //Coin colour = coinColor. Gold's is set to yellow, MinusCoin is set to red.
    fill(this.coinColour);
    //Draw coin/ring
    ellipse(this.xPosition, this.yPosition, this.diameter, this.diameter);
    fill(211, 211, 211);
    ellipse(this.xPosition, this.yPosition, this.diameter-25, this.diameter-25);

    fill(0);

    //Remove coin if out of bounds
    if (yPosition > height + diameter) {
      myCoins.remove(this);
    } else {
      //Else add speed/don't despawn
      this.yPosition += speed;
    }
  }
}
