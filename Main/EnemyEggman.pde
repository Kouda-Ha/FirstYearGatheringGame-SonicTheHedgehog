// Enemy 1 is Dr Eggman from Sonic the Hedgehog, his sprite sheet is referenced in the READ ME file and below
// Dr Eggman (Enemy1) Sprite from: https://www.seekpng.com/idown/u2q8r5w7a9r5q8e6_robotnik-sonic-1-eggman-sprites/  
// In this game, the Dr Eggman enemy are clones of him, as he's in the background image

class EnemyEggman extends Collidable {

  int counter;

  //The animation slides for Enemy1, enemy.
  //  PImage img1 = loadImage("enemy101.png");
  PImage img2 = loadImage("enemy102.png");
  PImage img3 = loadImage("enemy103.png");
  PImage img4 = loadImage("enemy104.png");

  EnemyEggman(float x, float y) {
    this.x = x;
    this.y = y;
    radius = 30;
  }

  void update() {
    move();
    render();
  }

  // The Eggmen clones will get to the far left side of the screen then teleport back to the right side of the screen
  // giving the appearance of despawning and respawning but it is always the same 2 Dr Eggmen clone enemies.
  void move() {

    if (this.distance(player) < 200) {
      PVector vector = new PVector(player.x-this.x, player.y-this.y);
      vector.normalize();
      this.x += vector.x*globalSpeed*frameTime*0.9;
      this.y += vector.y*globalSpeed*frameTime*0.9;
    } else {    

      if (x>0-this.radius*2) {
        float speed = globalSpeed*frameTime*0.9;
        x -=speed * (random(200, 1000)/1000.0);
      } else {
        x=width;
      }
    }
  }
  //Render to screen, make Dr Eggman clones fly his ship and both his expression and the ship change slightly every 10 frames, making him animated
  void render() {
    super.render();
    if (counter < 10) { 
      //  image(img1, x, y);
      //} else if (counter < 20) { 
      image(img2, x, y);
    } else if (counter < 30) { 
      image(img3, x, y);
    } else if (counter < 40) {
      image(img4, x, y);
    } else { 
      image(img2, x, y);

      counter=0;
    }

    counter++;
  }
}