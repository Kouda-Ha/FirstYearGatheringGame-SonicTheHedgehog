
class Bird extends Collidable {

  PImage imgL = loadImage("birdLeft.png");
  PImage imgR = loadImage("birdRight.png");

  PVector heading;

  Bird() {
    radius = 8;
    x = 500;
    y = 500;
  }

  void render(int birdNum) {
    move(birdNum);
    super.render();
    if (heading.x < 0) {
      image(imgL, x, y);
    } else {
      image(imgR, x, y);
    }
}

  void move(int birdNum) {

    // try to have them fly around the player.
    PVector target = new PVector();
    target.x = player.x + player.radius + sin(frameTimeOld/200.0 + (PI*2 / birdCount * birdNum)) * 40 - radius;
    target.y = player.y + player.radius + cos(frameTimeOld/200.0 + (PI*2 / birdCount * birdNum)) * 40 - radius;

    heading = new PVector(target.x-this.x, target.y-this.y);
    heading.normalize();
    this.x += heading.x*globalSpeed*frameTime*0.9;
    this.y += heading.y*globalSpeed*frameTime*0.9;
  }
}
