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
Enemy1 enemy1, enemy2; 
ArrayList<Ring> myRings = new ArrayList();
ArrayList<Enemy2> enemy2List = new ArrayList();
int time; 
int wait;
int speed;


//Setting up game
void setup() {
  size (900, 900);

  //capped framerate to 60fps to stop lag
  frameRate(60);

  //create new objects; player, enemies, etc
  splashScreen = new SplashScreen();
  drawBackground = new Background();
  player = new Player(width/2, height-50);  
  // enemy1 = new Enemy1((int)random(600), (int)random(600));
  // enemy2 = new Enemy1((int)random(600), (int)random(600));

  //loops 3 times = 3 iterations
  for (int i = 0; i < 3; i++) {
    enemy2List.add(new Enemy2(width, (int)random(300))); //so int rand is casting, we're adding Ladybirds to level
  }

  print(enemy2List.size()); // will show size of enemy2 ladybird lists
  gameTimer = new Timer();
  time = millis();
  wait = 1000;

  //polymorphism example, Rings (Gold OR Minus) added to list as they are created
  myRings = new ArrayList<Ring>();
  scorePlayer = new Score();
}  

void draw() {
  splashScreen.update();
  if (gameMode == PLAYING) {
    if (spawnTimer <= 0) {
      spawnTimer++; //add 1 to spawn timer
    }
    if (spawnTimer%60 == 0) { //% modulator
      enemy2List.add(new Enemy2(width, (int)random(380))); //so random int is casting, adding Ladybird enemy to game
    }
    drawBackground.drawBackground();
    player.render();
    player.keyPressed();
    enemy1.update();
    enemy2.update(); 
    gameTimer.update();
    ringGeneration();


    for (int i=0; i<enemy2List.size(); i++) {
      Enemy2 currentEnemy2 = enemy2List.get(i);
      text(i, currentEnemy2.x, currentEnemy2.y-30); // For TESTING, this shows the spawn number of the ladybirds (enemy2)
      currentEnemy2.update();
    }
    splashScreen.update();

    //IF you touch Eggman clones, game will end
    if (player.crash(enemy1) || player.crash(enemy2)) {
      splashScreen.gameOver();
    }
  }

  //run through all coins,  attempt to collect each coin and then update
  for (int numOfRings = myRings.size()-1; numOfRings >= 0; numOfRings--) { 
    Ring currentRing= myRings.get(numOfRings);
    collectRing(currentRing);
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
  enemy1 = new Enemy1((int)random(600), (int)random(600));
  enemy2 = new Enemy1((int)random(600), (int)random(600));
}
