class ChonkyMob extends Mob { //mob is the super class to chony mob

  ChonkyMob(float _x, float _y, float _vx, float _vy) {
    super (_x, _y, _vx, _vy);
    d= 60;
    speed = 0.5;
    hp = 5;
    fillColor = green;
    value = 3;
  }
}
