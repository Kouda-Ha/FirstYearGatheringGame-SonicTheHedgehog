// Minus Ring inherits from class Ring
// MinusRing is an enemy in Ring form, it inherits from Class Ring and takes a ring away from total, instead of adding to the total.

class MinusRing extends Ring {

  // Constructor
  MinusRing() {

    super();

    // Enemy ring's size, speed, colour, value
    radius = 30;
    
    // Enemy rings move twice as fast as the Gold rings/good collactable
    speed = 2; 
    
    ringColour = color(255, 0, 0);
    
   // Removes ring from total collected, instead of adding. Making it a bad collectable rather than good collectable.
    value = -1; 
  }
}
