
class Bird extends Collidable {

  PImage imgL = loadImage("birdLeft.png");
  PImage imgR = loadImage("birdRight.png");

  PVector heading;

  //constructor
  Bird(float x, float y) {
    radius = 8;
    this.x = x;
    this.y = y;
  }

  void update(int birdNum) {
    move(birdNum);
    render();
  }


  void render() {
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
