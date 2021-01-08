// Player is Tails sprite, referenced in READ ME and below
// Sprite sheet used: https://www.deviantart.com/winstontheechidna/art/Sonic-XG-Tails-Sprite-Sheet-698275178

class Player {


  //The animation slides for Tails, player. Pressing keys changes which is shown.
  PImage img0 = loadImage("up.png");
  PImage img1 = loadImage("front.png");
  PImage img2 = loadImage("left.png");
  PImage img3 = loadImage("right.png");

  int x =0;
  int y =0;
  PImage img4 = loadImage("idle1.png"); // Resting position to be set to default when keys NOT pressed
  PImage img5 = loadImage("idle2.png"); // blank image is used for hit box


  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  void render()
  {
    //Player default image
    image(img4, x, y); // Tails idle image
    noFill();
    noStroke();
    rect(x,y,width(),height()); //hit box (blank 'idle2' image5)
  }

  int width() {
    return img5.width; // (idle2 image5)
  }
  int height() {
    return img5.height; //(idle2 image5)
  }
// this one being function returns value
  boolean crash(Enemy1 enemy) {
    return abs(this.x-enemy.x) < 91 && abs(this.y - enemy.y) < 44;
  }
  //Player movement: Only move when an arrow key is pressed
  //Display specific picture when key pressed to simulate animation
  public  void keyPressed()
  {
    if (keyPressed == true)
    {
      if (keyCode == UP && player.y >0)
      {
        player.y = player.y -10;
        image(img0, x, y);
      } else if (keyCode == DOWN && player.y <height-70)
      {
        image(img1, x, y);

        player.y = player.y +10;
      } else if (keyCode == LEFT && player.x >0)
      {
        image(img2, x, y);

        player.x = player.x -10;
      } else if (keyCode == RIGHT && player.x <width-60)
      {
        image(img3, x, y);

        player.x = player.x +10;
      }
    }
  }
}
