
class Player {


  //The animation slides for Tails, player.
  PImage img0 = loadImage("up.png");
  PImage img1 = loadImage("front.png");
  PImage img2 = loadImage("left.png");
  PImage img3 = loadImage("right.png");

  int x =0;
  int y =0;
  PImage img4 = loadImage("idle1.png");
  PImage img5 = loadImage("idle2.png");


  Player(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  void render()
  {
    //Player default image
    image(img5, x, y);
    rect(x,y,width(),height());
  }

  int width() {
    return img4.width;
  }
  int height() {
    return img4.height;
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
