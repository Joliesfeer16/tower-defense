//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING =0; //we are in the proccess of picking a location, so tower follows mouse
  final int PLACED= 1; //we have locked in  position, shouldnt move anymore

  //instance
  float x, y;
  int cooldown;//like timer that counts up to treshold, smaller treshold= faster shoot
  int treshold;
  int towerMode;
  int towerType;


  //constructor
  Tower(int type) {
    x= mouseX;
    y= mouseY;
    cooldown = 0;
    towerMode = PLACING;//when we make a tower, its position must  be placed
    towerType = type;
    if (towerType == GUN) {
      treshold = 40;
      price= 5;
    }
    if (towerType == AOE) {
      price = 10;
      treshold = 40;
    }
    if (towerType == SNIPER) {
      treshold = 90;
      price = 15;
    }
  }


  //behavior function
  void show() {

    if (towerMode == PLACING && money>=price) {
      x= mouseX;
      y= mouseY;
      building = true;
      if (mousePressed && mouseX<750) {
        towerMode= PLACED;
        money=money-price;
        building = false; 
        
      }
    }

    if (towerType == GUN) showGunTower();
    if (towerType == AOE) showAOETower();
    if (towerType == SNIPER) showSniperTower();
  }

  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(green);
    square(x, y, 100);
  }

  void showAOETower() {
    stroke(black);
    strokeWeight(4);
    fill(red);
    circle(x, y, 100);
  }

  void showSniperTower() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    triangle(x, y, x-25, y-50, x+25, y-50);
  }

  void act() {
    cooldown= cooldown+1;
    if (cooldown >= treshold) {
      cooldown=0;
      if (towerType == GUN) {
        bullets.add(new Bullet(x, y, 0, -10));//up (NOTE: it will go to the tower's x and y, since it is in bullet class)
        bullets.add(new Bullet(x, y, 0, 10)); //down
        bullets.add(new Bullet(x, y, -10, 0)); //left
        bullets.add(new Bullet(x, y, 10, 0)); //right
       // explosions.add (new Explosion (x, y, random(-3, 3), random(-3, 3), 25, red));
      }
      if (towerType == AOE) {
        bullets.add( new AoeRing(x, y));
      }
      if (towerType == SNIPER) {
        bullets.add( new SniperBullet(x, y));
      }
    }
  }
}
