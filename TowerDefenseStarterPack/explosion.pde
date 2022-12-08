class Explosion {
  float x, y, vx, vy, size;
  color c;
  int hp;
  
  Explosion(float _x, float _y, float _vx, float _vy, float _s, color _c) {
    x= _x;
    y= _y;
    vx= _vx;
    vy= _vy;
    size= _s;
    c= _c;
    hp= 1;
  }

  void act() {
    x += vx;
    y += vy;
  }
  
  void show() {
    fill(c);
    //stroke(c);
    circle(x, y, size);
    size--;
    if (size<0) {
      hp = 0;
    }
  }
}
