//Minus Ring extends class Ring
//MinusRing is an enemy in Ring form, it inherits from Class Ring and takes a ring away from total, instead of adding to the total.

class MinusRing extends Ring {
  MinusRing() {

    //Constructor of Ring
    super();

    //Enemy size, speed, colour, value
    radius = 30;
    speed = 2; //Enemy rings move twice as fast as the Gold rings/good collactable
    ringColour = color(255, 0, 0);
    value = -1; // Removes ring from total collected, instead of adding. Making it a bad collectable rather than good collectable.
  }
}
