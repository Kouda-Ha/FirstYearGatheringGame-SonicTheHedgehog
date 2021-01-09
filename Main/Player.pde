// Player is Tails sprite, referenced in READ ME and below
// Sprite sheet used: https://www.deviantart.com/winstontheechidna/art/Sonic-XG-Tails-Sprite-Sheet-698275178

class Player extends Collidable{

  //The animation slides for Tails, player. Pressing keys changes which is shown.
  PImage img0 = loadImage("up.png");
  PImage img1 = loadImage("front.png");
  PImage img2 = loadImage("left.png");
  PImage img3 = loadImage("right.png");
  PImage img4 = loadImage("idle1.png"); // Resting position to be set to default when keys NOT pressed
  PImage img5 = loadImage("idle2.png"); // blank image is used for hit box

  boolean keyUp;
  boolean keyDown;
  boolean keyLeft;
  boolean keyRight;

  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
    radius = 20;
  }
  void render()
  {
    super.render();

    PImage image = img4;

    //Player movement: Only move when an arrow key is pressed
    //Display specific picture when key pressed to simulate animation
    //Player can move diagonally too
    if (keyUp == true && player.y >0)
    {
      player.y = (player.y -(globalSpeed*frameTime));
      image = img0;
    } else if (keyDown == true && player.y <height-70)
    {
      player.y = (player.y +(globalSpeed*frameTime));
      image = img1;
    } 

    if (keyLeft == true && player.x >0)
    {
      player.x = (player.x -(globalSpeed*frameTime));
      image = img2;
    } else if (keyRight == true && player.x <width-60)
    {
      player.x = (player.x +(globalSpeed*frameTime));
      image = img3;
    }

    //Player default image
    image(image, x, y); // Tails idle image
    noFill();
    noStroke();
    rect(x, y, width(), height()); //hit box (blank 'idle2' image5)
  }

  int width() {
    return img5.width; // (idle2 image5)
  }
  int height() {
    return img5.height; //(idle2 image5)
  }
  // this one being function returns value
  boolean crash(EnemyEggman enemy) {
    return abs(this.x-enemy.x) < 91 && abs(this.y - enemy.y) < 44;
  }

  //Looks at event and sets flags
  public void keyPressed(KeyEvent e)
  {

    if (e.getKeyCode() == UP) {
      keyUp = true;
    }
    if (e.getKeyCode() == DOWN) {
      keyDown = true;
    }
    if (e.getKeyCode() == LEFT) {
      keyLeft = true;
    }
    if (e.getKeyCode() == RIGHT) {
      keyRight = true;
    }
  }


  //Looks at event and sets flags
  public  void keyReleased(KeyEvent e)
  {

    if (e.getKeyCode() == UP) {
      keyUp = false;
    }
    if (e.getKeyCode() == DOWN) {
      keyDown = false;
    }
    if (e.getKeyCode() == LEFT) {
      keyLeft = false;
    }
    if (e.getKeyCode() == RIGHT) {
      keyRight = false;
    }
  }
}
