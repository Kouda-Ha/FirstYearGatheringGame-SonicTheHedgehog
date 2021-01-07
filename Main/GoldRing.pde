//Class Gold Ring extends Class Ring 
//GoldRing is an collectable in ring form, it inherits from Class Ring and adds a ring to the total, instead of taking away to the total.
//Gold Ring inherits the attributes of abstract class Ring
class GoldRing extends Ring {
  GoldRing() {

    super();

    //Gold coind's size, speed, colour, value
    diameter = 50;
    speed = 9;
    ringColour = color(250, 157, 8);
    value = 1;
   
  }
}
