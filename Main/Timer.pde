//Timer class: The Timer is in black text, top left, and 60 second intervals.
class Timer {
  //attributes 
  int startTime;
  int timeUsed;
  int totalTime;
  int boxWidth; //score box width
  int boxHeight; //score box height
  int xPosition; //x position ofs score box
  int yPosition; //y position of box


  Timer() {
    //time in milliseconds
    this.startTime = millis();
    this.totalTime= 15000; // 6000ms = 60s        //CHANGE BACK TO 60 ECT AFTER TEST FINAL TEST 
    this.timeUsed = this.totalTime;
  }

  void update() {
    //if the elapsed time is less than the total time, update the elapsed time
    if (this.totalTime > this.timeUsed) {
      //elapsed time is difference between current millis and start time
      this.timeUsed = millis() - this.startTime;
    }
    //Timer displayed bottom screen, text colour, text size.
    fill(0);
    textSize(50);
    //initialize attributes
    this.boxWidth = 100;
    this.boxHeight = 100;
    this.xPosition = this.boxWidth;
    this.yPosition = this.boxHeight; 
    text(round(this.timeRemaining()/1000), xPosition, yPosition);
  }

  //Function:Return remaining Time
  float timeRemaining() {  
    //remaining time is how long the timer should run minus how long it has run
    return this.totalTime - this.timeUsed;
  }

  //method: Reset timer
  void reset() {
    this.startTime = millis();
    this.timeUsed = 0;
  }
}
