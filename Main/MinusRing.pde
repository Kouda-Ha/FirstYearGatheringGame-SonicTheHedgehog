//MinusRing is an enemy in Ring form, it inherits from Class Ring and takes a ring away from total, instead of adding to the total.

class MinusRing extends Ring {
  MinusRing() {
    //call constructor of Class Coin
    super();
    
    //Enemy size, speed, colour, value
    diameter = 50;
    speed = 9;
    ringColour = color(255, 0, 0);
    value = -1; // Removes ring, instead of adding. Making it a bad collectable rather than good collectable.
  
  }
}