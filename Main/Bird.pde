// The bird is an 'Extra life' type of system, they will destroy enemies so you aren't killed/game over
// They extend collidable as they collide with enemies
// Please check README.txt and 'Picture References' in the Zip folder for the references to the sprites/pictures used (Bird: Reference 5)


class Bird extends Collidable {

  PImage imgL = loadImage("birdLeft.png");
  PImage imgR = loadImage("birdRight.png");

  PVector heading;

  EnemyBase eggmanTarget;

  //constructor
  Bird(float x, float y) {
    radius = 8;
    this.x = x;
    this.y = y;
  }

  void update(int birdNum) {
    if (eggmanTarget == null) {
      //search for new targets

      for (int enemyNum = enemyBaseList.size()-1; enemyNum >=0; enemyNum--) {

        EnemyBase currentEnemy = enemyBaseList.get(enemyNum);
        if (currentEnemy.destructive() == true && currentEnemy.exploding() == false && this.distance(currentEnemy) <200 ) {
          eggmanTarget = currentEnemy;
          break;
        }
      }
    } else if (eggmanTarget.exploding() == true) {
      eggmanTarget = null;
    }

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
    float speed = 0.9;
    if (eggmanTarget == null) {

      // try to have them fly around the player.
      PVector target = new PVector();
      target.x = player.x + player.radius + sin(frameTimeOld/200.0 + (PI*2 / birdCount * birdNum)) * 40 - radius;
      target.y = player.y + player.radius + cos(frameTimeOld/200.0 + (PI*2 / birdCount * birdNum)) * 40 - radius;

      heading = new PVector(target.x-this.x, target.y-this.y);
    } else {
      // chase the target
      heading = new PVector(eggmanTarget.x-this.x, eggmanTarget.y-this.y);
      speed = 1.5;
    }
    heading.normalize();
    this.x += heading.x*globalSpeed*frameTime*speed;
    this.y += heading.y*globalSpeed*frameTime*speed;
  }
}
