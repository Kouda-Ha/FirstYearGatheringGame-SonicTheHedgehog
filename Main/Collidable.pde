//Noticing all of the enemies and collectables are round-like, a new Collision class was made to treat them all as circles, including Player/Tails.

class Collidable {
  float x, y;
  int radius;
  color hitboxColour;

  void render() {
    //drawing hitbox
    //  noFill();
    if (drawHitBoxes == true) {
      noStroke();
      ellipseMode(RADIUS);    
      fill(hitboxColour);
      ellipse(x+radius, y+radius, radius, radius);
    }
  }

  float distance(Collidable otherThing) {
    // get the distance between this thing and the other thing.
    float vecX = (otherThing.x+otherThing.radius) - (x+radius);
    float vecY = (otherThing.y+otherThing.radius) - (y+radius);
    float distanceSquared = vecX * vecX + vecY * vecY;
    float distance = sqrt(distanceSquared); // because pythagoras theorem

    return distance;
  }

  boolean collisionTest(Collidable otherThing) {
    // if the distance is smaller than our radius + other thing's radius, there is a collision
    float distance = distance(otherThing);

    if (distance < otherThing.radius + radius) {
      hitboxColour = color(250, 0, 0);
      return true;
    } else {
      hitboxColour = color(0, 0, 0);
      return false;
    }
  }
}
