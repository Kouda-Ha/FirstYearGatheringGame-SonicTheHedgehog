//Class Gold Coin extends Class Coin 
//GoldCoin is an collectable in coin form, it inherits from Class Coin and adds money to the total, instead of taking away to the total.
//Gold Coin inherits the attributes of abstract class Coin
class Gold extends Coin {
  Gold() {

    super();

    //Gold coind's size, speed, colour, value
    diameter = 50;
    speed = 9;
    coinColour = color(250, 157, 8);
    value = 1;
   
  }
}
