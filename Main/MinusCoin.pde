//MinusCoin is an enemy in coin form, it inherits from Class Coin and takes money away from total, instead of adding to the total.

class MinusCoin extends Coin {
  MinusCoin() {
    //call constructor of Class Coin
    super();
    
    //Enemy size, speed, colour, value
    diameter = 50;
    speed = 9;
    coinColour = color(255, 0, 0);
    value = -1; // Removes money, instead of adding. Making it a bad collectable rather than good collectable.
  
  }
}
