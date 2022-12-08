class SniperBullet extends Bullet {

  SniperBullet(float _x, float _y) {
    super( _x, _y, 0, 0);
    hp= 1;
  }


  void show() {
    stroke(red);
    if (mobs.size() > 0) {
      Mob myMob = mobs.get(0);
      myMob.hp--;
      hp = 0;
      line( x, y, myMob.x, myMob.y);
    }
  }
}
