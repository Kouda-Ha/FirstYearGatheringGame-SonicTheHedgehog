// Timer class: The Timer is in black text, top left, and 60 second intervals.
class Timer {

  // Attributes 
  int startTime;
  int timeUsed;
  int totalTime;

  // Score box's width, height, x and y position
  int boxWidth;
  int boxHeight;
  int x;
  int y;


  // Constructor
  Timer() {

    // Time in milliseconds
    this.startTime = millis();
    this.totalTime= 60000; // 60000ms = 60s
    this.timeUsed = this.totalTime;
  }

  void update() {

    // If the time used is less than the total, update it
    if (this.totalTime > this.timeUsed) {
      this.timeUsed = millis() - this.startTime;
    }

    // Timer displayed bottom screen, text colour, text size.
    fill(0);
    textSize(50);

    // Attributes
    this.boxWidth = 100;
    this.boxHeight = 100;
    this.x = this.boxWidth;
    this.y = this.boxHeight; 
    text(round(this.timeRemaining()/1000), x, y);
  }

  // Return remaining Time
  float timeRemaining() {  
    //remaining time is how long the timer should run minus how long it has run
    return this.totalTime - this.timeUsed;
  }

  // Reset time
  void reset() {
    this.startTime = millis();
    this.timeUsed = 0;
  }
}
