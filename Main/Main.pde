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
ArrayList<Coin> myCoins;  
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
  myCoins = new ArrayList<Coin>();
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
  coinGenerator();
  splashScreen.update();

  if (player.crash(enemy1) || player.crash(enemy2) ) { // || player.crash(enemy3) || player.crash(enemy4))
    splashScreen.gameOver();

    resetGame();
  }


  //run through all coins,  attempt to collect each coin and then update
  for (int numCoins = myCoins.size()-1; numCoins >= 0; numCoins--) { 
    Coin currentCoin= myCoins.get(numCoins);
    collectCoin(currentCoin);
    currentCoin.update();
  }
  scorePlayer.update();
}

//create a Collect Coin procedure with a parameter collectCoin
void collectCoin(Coin collectCoin) {

  //Local variables
  float coinX= collectCoin.getXPosition(); 
  float coinY = collectCoin.getYPosition(); 

  float relativeX = coinX - player.x;
  float relativeY = coinY - player.y;
  float radius = collectCoin.getDiameter()/2;

  //Coin collection boundary
  if (
    (relativeX > 0 - radius && relativeX < player.width() + radius)
    && (relativeY > 0 - radius && relativeY < player.height() + radius)
    ) {

    //remove coin from array list so that it will not be updated and will disappear when collected
    myCoins.remove(collectCoin);
    if (gameTimer.timeRemaining() > 0) {

      //add coin value to the player's score
      score += collectCoin.getValue();
    }
  }
}

//Method: Generating the good and bad coins. 
void coinGenerator() {
  //Adds coins until game ends
  if (gameTimer.timeRemaining() > 0) {

    //and if the elapsed time is greater than how long program waits to generate coins, add coins
    if (millis() - time >= wait) {
      myCoins.add(new Gold());
      myCoins.add(new MinusCoin());
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
