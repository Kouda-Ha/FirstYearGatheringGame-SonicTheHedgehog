// Owen Park (ID: 19095713)
// Coursework 70%,(2020/21): Gathering game

//declare global variables and references that point to objects
int x, y;
// Backgrounds
SplashScreen splashScreen;
Background drawBackground;
// Time related 
Timer gameTimer;
int time;
int wait;
float frameTime;
int frameTimeOld;
float timeSinceLastLadybird;
// Game mode/game play related
final int PLAYING = 0; //playing state
final int FINISHED = 1; //finished state
int gameMode = FINISHED;
int globalSpeed;
boolean drawHitBoxes = false;
int score;
Score scorePlayer;
//Characters and item(s)
Player player;
ArrayList<Ring> myRings = new ArrayList();
ArrayList<EnemyBase> enemyBaseList;
ArrayList<Bird> birbs = new ArrayList();
int birdCount = 0;

//Setting up the game
void setup() {
  size (900, 900);

  globalSpeed = 300;
  frameTimeOld = millis();

  //create new objects; player, enemies, etc
  splashScreen = new SplashScreen();
  drawBackground = new Background();
  player = new Player(width/2, height-50);  

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

    drawBackground.drawBackground();
    player.render();
    gameTimer.update();
    ringGeneration();

    // Update all enemies 
    for (int i = enemyBaseList.size()-1; i >=0; i--) {
      EnemyBase currentEnemy = enemyBaseList.get(i);
      currentEnemy.update();
      if (currentEnemy.destructive() == false && currentEnemy.collisionTest(player) == true) {
        currentEnemy.explode();
      }
      // Removes the culled enemy (Ladybirds) and spawns birds in their place
      if (currentEnemy.cull() == true) {
        birbs.add(new Bird(currentEnemy.x, currentEnemy.y));
        birdCount = birbs.size();

        enemyBaseList.remove(currentEnemy);
      }
    }
    // Spawn new Ladybirds if less than 5 enemies on screen, including eggmen && if fewer than 5 birds
    if (millis()/1000.0 > timeSinceLastLadybird + 8 && enemyBaseList.size() < 5 && birdCount <= 4) {
      enemyBaseList.add(new EnemyLadybird(width, (int)random(300))); //so int rand is casting, we're adding Ladybirds to level
      timeSinceLastLadybird = millis()/1000.0;
    }

    // Collision of bird friends on enemies, removing a bird if it hits an enemy
    for (int i=0; i<birbs.size(); i++) {
      Bird currentBirb = birbs.get(i);
      currentBirb.update(i);
      for (int enemyNum = enemyBaseList.size()-1; enemyNum >=0; enemyNum--) {
        EnemyBase currentEnemy = enemyBaseList.get(enemyNum);
        if (currentEnemy.exploding() == false && currentEnemy.collisionTest(currentBirb)) {
          currentEnemy.explode();
          if (currentEnemy.destructive() == true) {
            birbs.remove(currentBirb);
            birdCount = birbs.size();
          }
        }
      }
    }
    splashScreen.update();

    // If you touch destructive enemies (Eggmen), game will end
    for (int i = enemyBaseList.size()-1; i >= 0; i--) {
      EnemyBase currentEnemy = enemyBaseList.get(i);

      // If it is a destructive enemy (eggman) and he isn't exploding and goes into player hitbox, it is a hit so game over 
      if (currentEnemy.destructive() == true && currentEnemy.exploding() == false && currentEnemy.collisionTest(player)) {
        splashScreen.gameOver();
      }
    }
  }

  // Run through coins, collected coin removed and then score updates
  for (int numOfRings = myRings.size()-1; numOfRings >= 0; numOfRings--) { 
    Ring currentRing= myRings.get(numOfRings);
    if (currentRing.collisionTest(player) == true) {
      myRings.remove(currentRing);
      if (gameTimer.timeRemaining() > 0) {

        // Add ring value to the player's score
        score += currentRing.getValue();
      }
    }
    currentRing.update();
  }
  scorePlayer.update();
}


// Generating the good and bad rings. 
void ringGeneration() {
  //Adds rings until game ends
  if (gameTimer.timeRemaining() > 0) {
    if (millis() - time >= wait) {
      myRings.add(new GoldRing());
      myRings.add(new MinusRing());
      time = millis();
    }
  } 

  // Display game over once timer hits zero
  else {
    splashScreen.timesUp();
  }
}

// Collecting a Ring (good or bad)
void collectRing(Ring collectRing) {

  // Local variables
  float ringX= collectRing.getXPosition(); 
  float ringY = collectRing.getYPosition(); 
  float relativeX = ringX - player.x;
  float relativeY = ringY - player.y;
  float radius = collectRing.getDiameter()/2;

  // Coin collection boundary
  if (
    (relativeX > 0 - radius && relativeX < player.width() + radius)
    && (relativeY > 0 - radius && relativeY < player.height() + radius)
    ) {

    // Remove ring from array list so that it will not be updated and will disappear when collected
    myRings.remove(collectRing);
    if (gameTimer.timeRemaining() > 0) {

      // Add ring value to the player's score
      score += collectRing.getValue();
    }
  }
}

// Clicking will start and/or restart entire game (score, player, enemies, etc)
void reset() {
  splashScreen.startGame();
  splashScreen.resetGame();
  player.render();
  player.x = width/2;
  player.y = height-50;
  birbs = new ArrayList();
  birbs.add(new Bird(width/2, height+50));
  birdCount = birbs.size();

  timeSinceLastLadybird = millis()/1000.0;

  //Polymorphism: List of Eggmen and Ladybirds 
  enemyBaseList = new ArrayList();
  enemyBaseList.add(new EnemyEggman((int)random(width), (int)random(height/3*2)));
  enemyBaseList.add(new EnemyEggman((int)random(width), (int)random(height/3*2)));
}

void mouseClicked() {
  reset();
}

// Gets called by processing whenever a key is pressed
void keyPressed(KeyEvent e) {

  // Passes it to player
  player.keyPressed(e);
  if (e.getKey()== 'b' ) { 
    birbs.add(new Bird(width/2, height+50));
    birdCount = birbs.size();
  }
}

// Gets called by processing whenever a key is released
void keyReleased(KeyEvent e) {

  // Passes it to player
  player.keyReleased(e);
}
