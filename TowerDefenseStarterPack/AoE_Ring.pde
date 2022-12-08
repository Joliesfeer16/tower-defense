//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AoeRing extends Bullet {
  //float x, y;
  int timer;

  AoeRing(float _x, float _y) {
    super(_x, _y, 0, 0);//has same as bullet
    hp= 1;
    d= 200;
    timer = 5;
  }

  void act() {
    timer= timer -1;
    if (timer==0) {
      hp= 0;
    }
  }

  void show() {
    fill (100);
    circle(x, y, d);
  }
}
