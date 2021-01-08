//Both the Enemy AND collectable are coins, so I made Coin class so Enemy and Gold can extend from this.

class Ring { 

  //Attributes: Position, size, speed, colour, value
  float x, y;
  float diameter;
  float speed;
  color ringColour;
  float value;

  //First constructor no parameters: Set default x and y position
  Ring() { 
    this(random(0, width), 0);
  }

  //Second constructor two parameters: x and y 
  Ring(float x, float y) {    
    this.x = x;
    this.y = y;
  }

  //Function: Return coin value
  float getValue() { 
    return this.value;
  }

  //Function: Return Ring x position
  float getXPosition() {
    return this.x;
  }

  //Function: Return ring y position
  float getYPosition() {
    return this.y;
  }

  //Function: Return Ring size
  float getDiameter() {
    return this.diameter;
  }

  //Method: Update rings
  void update() {

    //Ring colour = ringColor. Gold's is set to yellow, MinusRing is set to red.
    fill(this.ringColour);

    //Draw ring
    ellipse(this.x, this.y, this.diameter, this.diameter);
    fill(211, 211, 211);
    ellipse(this.x, this.y, this.diameter-25, this.diameter-25);

    fill(0);

    //Remove ring if out of bounds
    if (y > height + diameter) {
      myRings.remove(this);
    } else {

      //Else add speed/don't despawn
      this.y += speed;
    }
  }
}
