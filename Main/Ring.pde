//Both the Enemy AND collectable are coins, so I made Coin class so Enemy and Gold can extend from this.

class Ring extends Collidable { 

  //Attributes: speed, colour, value
  float speed;
  color ringColour;
  float value;

  //First constructor no parameters: Set default x and y position
  Ring() { 
    this(random(0, width), -60);
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
    return this.radius*2;
  }

  //Method: Update rings
  void update() {

    //Remove ring if out of bounds
    if (y > height + radius) {
      myRings.remove(this);
    } else {

      //Else add speed/don't despawn
      this.y += frameTime * globalSpeed*speed;
    }

    //Ring colour = ringColor. Gold's is set to yellow, MinusRing is set to red.
    super.render();

    ellipseMode(RADIUS); 
    stroke(this.ringColour);
    strokeWeight(15);
    noFill();
    // draw these offset so the collision code will still work
    //   (the collision code assumes it's dealing with a sprite with XY values in the top left)
    ellipse(this.x+this.radius, this.y+this.radius, (this.radius-7) * abs(sin(frameTimeOld/200.0)), this.radius-7);
  }
}
