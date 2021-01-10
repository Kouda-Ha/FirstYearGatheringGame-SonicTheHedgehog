class EnemyBase extends Collidable {
  Explosion explosion;

  EnemyBase(float x, float y, int radius) {
    explosion = new Explosion(x, y, radius);
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  void explode() {
    explosion.start();
  }


  boolean exploding() {
    return explosion.exploding;
  }

  boolean destructive() {
    return true;
  }

  boolean cull() {
    return false;
  }

  void update() {
    move();
    render();
  }
  // X and Y declared so it apears to be wiggling randomly across the level
  // The ladybirds will get to the bottom of the screen then teleport back to the top of the screen
  // giving the appearance of despawning and respawning but it is always the same 5 ladybirds enemies.
  void move() {
    explosion.position(x, y);
  }


  //Render to screen, play images every 10 frames to make ladybird appear to blink and become wide-eyed
  void render() {
    super.render();
    explosion.render();
  }
}
