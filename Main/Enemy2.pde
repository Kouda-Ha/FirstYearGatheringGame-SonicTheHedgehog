//Enemy2 is the Ladybird type enemy from Sonic, sprite sheet is referenced in the READ ME file and below
//One frame is https://sonicdashcom.files.wordpress.com/2016/04/motobug_sprite_1_right.png then the other two are edited versions by me, so it becomes an animation when played together

class Enemy2 {

  int x, y;
  int counter;

  //The animation slides for Enemy2, Ladybird enemy
  PImage img1 = loadImage("enemy202.png");
  PImage img2 = loadImage("enemy201.png");
  PImage img3 = loadImage("enemy203.png");

  Enemy2(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    move();
    render();
  }
  // X and Y declared so it apears to be wiggling randomly across the level
  void move() {
    y += random(5, 15);
    x += random(-25, 5);
  }

  //Render to screen, play images every 10 frames to make ladybird appear to blink and become wide-eyed
  void render() {

    if (counter < 10) { 
      image(img1, x, y);
    } else if (counter < 20) { 
      image(img2, x, y);
    } else if (counter < 30) { 
      image(img3, x, y);
    } else { 
      counter=0;
    }

    counter++;
  }
}
