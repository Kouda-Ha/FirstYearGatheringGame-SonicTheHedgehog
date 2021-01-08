// Enemy 1 is Dr Eggman from Sonic the Hedgehog, his sprite sheet is referenced in the READ ME file and below
// Dr Eggman (Enemy1) Sprite from: https://www.seekpng.com/idown/u2q8r5w7a9r5q8e6_robotnik-sonic-1-eggman-sprites/  
// In this game, the Dr Eggman enemy are clones of him, as he's in the background image

class Enemy1 {

  int x, y;
  int counter;

  //The animation slides for Enemy1, enemy.
  PImage img1 = loadImage("enemy101.png");
  PImage img2 = loadImage("enemy102.png");
  PImage img3 = loadImage("enemy103.png");
  PImage img4 = loadImage("enemy104.png");

  Enemy1(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    move();
    render();
  }

  // The Eggmen clones will get to the far left side of the screen then teleport back to the right side of the screen
  // giving the appearance of despawning and respawning but it is always the same 2 Dr Eggmen clone enemies.
  void move() {
    if (x>0) {
      x -= random(2, 10);
    } else {
        x=900;
    }
  }

  //Render to screen, make Dr Eggman clones fly his ship and both his expression and the ship change slightly every 10 frames, making him animated
  void render() {

    if (counter < 10) { 
      image(img1, x, y);
    } else if (counter < 20) { 
      image(img2, x, y);
    } else if (counter < 30) { 
      image(img3, x, y);
    } else if (counter < 40) {
      image(img4, x, y);
    } else { 
      counter=0;
    }

    counter++;
  }
}
