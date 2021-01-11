// Second enemy type is a Ladybird from Sonic, hitting these (as Tails) will result in a bird being released, and it will follow player (Tails) and help attack Eggmen to keep player safe
// Please check README.txt and 'Picture References' in the Zip folder for the references to the sprites/pictures used (Ladybird reference: 2)
// Ladybird image was edited twice to make the entire 3 images used, resulting in a small animation sequence for it

class EnemyLadybird extends EnemyBase {

  int counter;

  // The animation slides for Ladybird enemy
  PImage img1 = loadImage("enemy202.png");
  PImage img2 = loadImage("enemy201.png");
  PImage img3 = loadImage("enemy203.png");

  // Constructor
  EnemyLadybird(int x, int y) {
    super(x, y, 40);
  }

  // If Ladybird explodes, it will explode for 3 seconds
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

  // x and y declared so it apears to be wiggling randomly across the level
  // The ladybirds will get to the bottom of the screen then teleport back to the top of the screen
  // giving the appearance of despawning and respawning but it is always the same ladybirds enemies.
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

  // Render to screen, play images every 10 frames to make ladybird appear to blink and become wide-eyed
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
