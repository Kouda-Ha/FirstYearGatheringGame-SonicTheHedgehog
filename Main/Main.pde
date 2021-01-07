// Owen Park (ID: 19095713)
// Coursework 70%,(2020/21): Gathering game

//declare global variables and references that point to objects
int x, y;
SplashScreen splashScreen;
PImage background;
Player player;
Background drawBackground;
Enemy1 enemy1, enemy2; 
Enemy2 enemy3, enemy4;
Timer gameTimer;
int time; 
int wait;
ArrayList<Ring> myRings;  
int score;
Score scorePlayer;

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
  enemy3 = new Enemy2(850, (int)random(380));
  enemy4 = new Enemy2(850, (int)random(380));
  gameTimer = new Timer();
  time = millis();
  wait = 1000;
  //polymorphism example, coins added to list as they are created
  myRings = new ArrayList<Ring>();
  scorePlayer = new Score();
}  

void draw() {

  drawBackground.drawBackground();
  player.render();
  player.keyPressed();
  enemy1.update();
  enemy2.update();
  enemy3.update();
  enemy4.update();
  gameTimer.update();
  ringGeneration();
  splashScreen.update();

  if (player.crash(enemy1) || player.crash(enemy2) ) { // || player.crash(enemy3) || player.crash(enemy4))
    splashScreen.gameOver();

    resetGame();
  }


  //run through all coins,  attempt to collect each coin and then update
  for (int numOfRings = myRings.size()-1; numOfRings >= 0; numOfRings--) { 
    Ring currentRing= myRings.get(numOfRings);
    collectRing(currentRing);
    currentRing.update();
  }
  scorePlayer.update();
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

    //remove coin from array list so that it will not be updated and will disappear when collected
    myRings.remove(collectRing);
    if (gameTimer.timeRemaining() > 0) {

      //add coin value to the player's score
      score += collectRing.getValue();
    }
  }
}

//Method: Generating the good and bad coins. 
void ringGeneration() {
  //Adds coins until game ends
  if (gameTimer.timeRemaining() > 0) {

    //and if the elapsed time is greater than how long program waits to generate coins, add coins
    if (millis() - time >= wait) {
      myRings.add(new GoldRing());
      myRings.add(new MinusRing());
      time = millis();
    }
  } 

  //Display game over once timer hits zero
  else {
    splashScreen.gameOver();
  }
}

//Starts game, removes overlay splash screen
void startGame() {
  splashScreen.remove();
}

//Reset game: Reset timer and score
void resetGame() {
  gameTimer.reset();
  score = 0;
}

//Clicking will start and/or restart the timer/game score/game
void mouseClicked() {
  startGame();
  resetGame();
}
