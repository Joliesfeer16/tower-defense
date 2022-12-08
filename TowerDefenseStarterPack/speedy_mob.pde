class SpeedyMob extends Mob { //mob is the super class to chony mob

  SpeedyMob(float _x, float _y, float _vx, float _vy) {
    super (_x, _y, _vx, _vy);
    d= 35;
    speed = 1.5;
    hp = 3;
    fillColor = black;
    value = 2;
  }
}
