// Both the Enemy AND collectable are coins, so I made Coin class so Enemy and Gold can extend from this.
// Rings drawn by Processing, no referenced pictures used or needed

class Ring extends Collidable { 

  // Attributes: speed, colour, value
  float speed;
  color ringColour;
  float value;

  // First constructor default x and y positions
  Ring() { 
    this(random(0, width), -60);
  }

  // Second constructor two parameters: x and y 
  Ring(float x, float y) {    
    this.x = x;
    this.y = y;
  }

  // Return coin value
  float getValue() { 
    return this.value;
  }

  // Return Ring x and Y positions
  float getXPosition() {
    return this.x;
  }
  float getYPosition() {
    return this.y;
  }

  // Return Ring size
  float getDiameter() {
    return this.radius*2;
  }

  // Update
  void update() {

    // Remove ring if out of bounds
    if (y > height + radius) {
      myRings.remove(this);
    } else {

      // Else add speed/don't despawn
      this.y += frameTime * globalSpeed*speed;
    }

    // Ring colour. Gold is set to yellow, MinusRing is set to red
    super.render();

    ellipseMode(RADIUS); 
    stroke(this.ringColour);
    strokeWeight(15);
    noFill();
    // Draw these offset so the collision code will still work
    // (the collision code assumes it's dealing with a sprite with x y values in the top left)
    ellipse(this.x+this.radius, this.y+this.radius, (this.radius-7) * abs(sin(frameTimeOld/200.0)), this.radius-7);
  }
}
