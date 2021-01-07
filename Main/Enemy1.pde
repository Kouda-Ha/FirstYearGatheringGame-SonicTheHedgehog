// Enemy 1 is Dr Eggman from Sonic the Hedgehog, his sprite sheet is referenced in the READ ME file and below
// Dr Eggman (Enemy1) Sprite from: https://www.seekpng.com/idown/u2q8r5w7a9r5q8e6_robotnik-sonic-1-eggman-sprites/  

class Enemy1 {

  int x;
  int y;
  int counter;
  float xPosition;
  float yPosition;
    float speed;

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
    
    
    //  //Remove Enemy type 1 once out of bounds    CURRENTLY NOT WORKING
    //if (yPosition > width) {
    //  enemy1.remove(this);
    //} else {
    //  //Else add speed
    //  this.yPosition += speed;
    //}
  }

  void move() {
    x -= random(2, 5);
  }

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
