// Owen Park (ID: 19095713)
// Coursework 70%,(2020/21): Gathering game

//declare global variables and references that point to objects
int x, y;
SplashScreen splashScreen;
PImage background;
Background drawBackground;
Timer gameTimer;
final int PLAYING = 0; //playing state
final int FINISHED = 1; //finished state
int gameMode = FINISHED;
int spawnTimer = 0;
int score;
Score scorePlayer;
Player player;
EnemyEggman eggman1, eggman2; 
ArrayList<Ring> myRings = new ArrayList();
ArrayList<EnemyLadybird> enemyLadybirdList = new ArrayList();
int time;
int wait;
int globalSpeed;
boolean drawHitBoxes = false;

float frameTime;
int frameTimeOld;

ArrayList<Bird> birbs = new ArrayList();
int birdCount = 0;

//Setting up game
void setup() {
  size (900, 900);

  globalSpeed = 300;
  frameTimeOld = millis();

  //create new objects; player, enemies, etc
  splashScreen = new SplashScreen();
  drawBackground = new Background();
  player = new Player(width/2, height-50);  


  //loops 3 times = 3 iterations
  for (int i = 0; i < 3; i++) {
    enemyLadybirdList.add(new EnemyLadybird(width, (int)random(300))); //so int rand is casting, we're adding Ladybirds to level
  }


  gameTimer = new Timer();
  time = millis();
  wait = 1000;

  //polymorphism example, Rings (Gold OR Minus) added to list as they are created
  myRings = new ArrayList<Ring>();
  scorePlayer = new Score();
}  

void draw() {
  int frameTimeNew = millis();
  frameTime = (frameTimeNew - frameTimeOld)/1000.0f;
  frameTimeOld = frameTimeNew;

  splashScreen.update();
  if (gameMode == PLAYING) {
    if (spawnTimer <= 0) {
      spawnTimer++; //add 1 to spawn timer
    }
    if (spawnTimer%60 == 0) { //% modulator
      enemyLadybirdList.add(new EnemyLadybird(width, (int)random(380))); //so random int is casting, adding Ladybird enemy to game
    }
    drawBackground.drawBackground();
    player.render();
    eggman1.update();
    eggman2.update(); 
    gameTimer.update();
    ringGeneration();

    for (int i=0; i<birbs.size(); i++) {
      Bird currentBirb = birbs.get(i);
      currentBirb.update(i);
      if (eggman1.exploding() == false && eggman1.collisionTest(currentBirb)) {
        eggman1.explode();
      }
      if (eggman2.exploding() == false && eggman2.collisionTest(currentBirb)) {
        eggman2.explode();
      }
    }
    for (int i=0; i<enemyLadybirdList.size(); i++) {
      EnemyLadybird currentLadybird = enemyLadybirdList.get(i);
      //   text(i, currentEnemy2.x, currentEnemy2.y-30); // For TESTING, this shows the spawn number of the ladybirds (enemy2)
      if (currentLadybird.collisionTest(player) == true) {
        currentLadybird.explode();
      }
      currentLadybird.update();
      if (currentLadybird.cull() == true) {
        birbs.add(new Bird(currentLadybird.x, currentLadybird.y));
        birdCount = birbs.size();

        enemyLadybirdList.remove(currentLadybird);
      }
    }
    splashScreen.update();

    //IF you touch Eggman clones, game will end
    if (eggman1.exploding() == false && eggman1.collisionTest(player) || eggman2.exploding() == false && eggman2.collisionTest(player)) {
      splashScreen.gameOver();
    }
  }

  //run through all coins,  attempt to collect each coin and then update
  for (int numOfRings = myRings.size()-1; numOfRings >= 0; numOfRings--) { 
    Ring currentRing= myRings.get(numOfRings);
    //  collectRing(currentRing);
    if (currentRing.collisionTest(player) == true) {
      myRings.remove(currentRing);
      if (gameTimer.timeRemaining() > 0) {

        //add ring value to the player's score
        score += currentRing.getValue();
      }
    }
    currentRing.update();
  }
  scorePlayer.update();
}


//Method: Generating the good and bad rings. 
void ringGeneration() {
  //Adds rings until game ends
  if (gameTimer.timeRemaining() > 0) {
    if (millis() - time >= wait) {
      myRings.add(new GoldRing());
      myRings.add(new MinusRing());
      time = millis();
    }
  } 

  //Display game over once timer hits zero
  else {
    splashScreen.timesUp();
  }
}

//Procedure: Collecting a Ring (good or bad)
void collectRing(Ring collectRing) {

  //Local variables
  float ringX= collectRing.getXPosition(); 
  float ringY = collectRing.getYPosition(); 
  float relativeX = ringX - player.x;
  float relativeY = ringY - player.y;
  float radius = collectRing.getDiameter()/2;

  //Coin collection boundary
  if (
    (relativeX > 0 - radius && relativeX < player.width() + radius)
    && (relativeY > 0 - radius && relativeY < player.height() + radius)
    ) {

    //remove ring from array list so that it will not be updated and will disappear when collected
    myRings.remove(collectRing);
    if (gameTimer.timeRemaining() > 0) {

      //add ring value to the player's score
      score += collectRing.getValue();
    }
  }
}

//Method: Clicking will start and/or restart the timer/game score/game
void mouseClicked() {
  splashScreen.startGame();
  splashScreen.resetGame();
  player.render();
  player.x = width/2;
  player.y = height-50;
  eggman1 = new EnemyEggman((int)random(width), (int)random(height/3*2));
  eggman2 = new EnemyEggman((int)random(width), (int)random(height/3*2));
  birbs = new ArrayList();
  birbs.add(new Bird(width/2, height+50));
  birdCount = birbs.size();
}

//Gets called by processing whenever a key is pressed
void keyPressed(KeyEvent e) {
  //passes it to player
  player.keyPressed(e);
  if (e.getKey()== 'b' ) { 
    birbs.add(new Bird(width/2, height+50));
    birdCount = birbs.size();
  }
}

//Gets called by processing whenever a key is released
void keyReleased(KeyEvent e) {
  //passes it to player
  player.keyReleased(e);
}
