//All the classes and things to do with the explosion
// Please check README.txt and 'Picture References' in the Zip folder for the references to the sprites/pictures used (Explosion reference: 4)

class Explosion {

  float x, y, range;

  // Animation for explosion
  PImage explosionImg1 = loadImage("explosion1.png");
  PImage explosionImg2 = loadImage("explosion2.png");
  PImage explosionImg3 = loadImage("explosion3.png");
  PImage explosionImg4 = loadImage("explosion4.png");

  boolean exploding = false;
  ArrayList<ExplosionBits> explosionBitsList = new ArrayList();
  float lastStartTime;
  float explodingStart;

  final int totalBits = 10;
  final float interval = 0.1f;

  // Constructor
  Explosion(float x, float y, float range) {
    this.x = x+ range;
    this.y = y + range;
    this.range = range;
    for (int i = 0; i<totalBits; i++) {
      explosionBitsList.add(new ExplosionBits());
    }
  }
  void position(float x, float y) {
    this.x = x +range;
    this.y = y +range;
  }

  void start() {
    exploding = true;
    explodingStart = millis()/1000.0;
  }

  void stop() {
    exploding = false;
  }

  float timeExploding() {
    return (millis()/1000.0) - explodingStart;
  }

  void render() {

    float time = millis() / 1000.0;
    for (int bit = explosionBitsList.size()-1; bit >= 0; bit--) {
      ExplosionBits explosionBit = explosionBitsList.get(bit);

      // if available, reset a bit once every interval
      if (exploding == true && explosionBit.done == true && time > lastStartTime + interval) {
        explosionBit.reset(random(x-range, x+range), random(y-range, y+range));
        lastStartTime = time;
      }

      explosionBit.render();
    }
  }


  // Define how the little bits of the explosion behave
  class ExplosionBits {
    float x, y;
    float startTime;
    boolean done = true;

    void reset(float x, float y) {
      done = false;
      startTime = millis();
      this.x = x;
      this.y = y;
    }

    void render() {
      if (done == true) {
        return;
      }
      float age = (millis()-startTime)/1000.0;
      if (age < 0.1) {
        image(explosionImg1, x, y);
      } else if (age < 0.2) {
        image(explosionImg2, x, y);
      } else if (age < 0.3) {
        image(explosionImg3, x, y);
      } else if (age < 0.4) {
        image(explosionImg4, x, y);
      } else if (age < 0.5) {
        done = true;
      }
      age++;
    }
  }
}
