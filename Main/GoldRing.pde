//Class Gold Ring extends Class Ring 
//GoldRing is an collectable in ring form, it inherits from Class Ring and adds a ring to the total, instead of taking away to the total.

class GoldRing extends Ring {
  GoldRing() {

    super();

    //Gold rings's size, speed, colour, value
    radius = 30;
    speed = 1;
    ringColour = color(250, 157, 8);
    value = 1; //Adds a ring to your collected amount, making it a good collectable.
  }
}
