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
int gameMode = PLAYING; //current state recorded
int spawnTimer = 0;
int score;
Score scorePlayer;

Player player;
Enemy1 enemy1, enemy2; 
//Enemy2 enemy3, enemy4;

ArrayList<Ring> myRings = new ArrayList();
ArrayList<Enemy2> enemy2List = new ArrayList();

int time; 
int wait;


//Setting up game
void setup() {
  size (900, 900);
  //capped framerate to 60fps to stop lag
  frameRate(60);
  //create new objects; player, enemies, etc
  splashScreen = new SplashScreen();
  drawBackground = new Background();
  player = new Player(width/2, height-25);  
  enemy1 = new Enemy1(850, (int)random(380));
  enemy2 = new Enemy1(875, (int)random(380));
  //  enemy3 = new Enemy2(850, (int)random(380));
  //  enemy4 = new Enemy2(850, (int)random(380));

  //loops 5 times = 5 iterations
  for (int i = 0; i < 5; i++) {
    enemy2List.add(new Enemy2(width, (int)random(380))); //so int rand is casting, we're adding Ladybirds to thingy
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
  if (gameMode == PLAYING) {
    spawnTimer++; //add 1 to spawn timer
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
    splashScreen.update();


    for (int i=0; i<enemy2List.size(); i++) {
      Enemy2 currentEnemy2 = enemy2List.get(i);
      text(i, currentEnemy2.x, currentEnemy2.y-30);
      currentEnemy2.update();

      //IF you touch Eggman clones, game will end
      if (player.crash(enemy1) || player.crash(enemy2) ) {
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
}
//create a Collect Coin procedure with a parameter collectCoin
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

//Method: Starts game, removes overlay splash screen
void startGame() {
  splashScreen.remove();
}

//Method: Reset timer and score
void resetGame() {
  gameTimer.reset();
  score = 0;
}

//Method: Game over
void gameOver() {
  gameMode = FINISHED;
  splashScreen.gameOver();
  
}

//Clicking will start and/or restart the timer/game score/game
void mouseClicked() {
  startGame();
  resetGame();
}
