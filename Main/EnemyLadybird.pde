//Enemy2 is the Ladybird type enemy from Sonic, sprite sheet is referenced in the READ ME file and below
//One frame is https://sonicdashcom.files.wordpress.com/2016/04/motobug_sprite_1_right.png then the other two are edited versions by me, so it becomes an animation when played together
class EnemyLadybird extends EnemyBase {

  int counter;

  //The animation slides for Enemy2, Ladybird enemy
  PImage img1 = loadImage("enemy202.png");
  PImage img2 = loadImage("enemy201.png");
  PImage img3 = loadImage("enemy203.png");

  //constructor
  EnemyLadybird(int x, int y) {
    super(x, y, 40);
  }

  boolean cull() {
    if (explosion.exploding == true && explosion.timeExploding() > 3.0) {
      return true;
    } else {
      return false;
    }
  }
  boolean destructive() {
    return false;
  }
  // X and Y declared so it apears to be wiggling randomly across the level
  // The ladybirds will get to the bottom of the screen then teleport back to the top of the screen
  // giving the appearance of despawning and respawning but it is always the same 5 ladybirds enemies.
  void move() {
    if (explosion.exploding == false) {
      if (x > -img1.width && y < height) {
        float speed = globalSpeed*frameTime*0.9;
        x -=speed * (random(200, 1000)/1000.0);
        y +=speed * (random(200, 1000)/1000.0);
      } else {

        x = width;
        y =0;
      }
    }
    super.move();
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
      image(img2, x, y);
      counter=0;
    }
    counter++;
    super.render();
  }
}
