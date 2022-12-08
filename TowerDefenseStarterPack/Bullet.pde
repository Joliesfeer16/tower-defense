//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {

  //instance
  float x, y, vx, vy, d;
  int hp;

  //constructor
  Bullet (float _x, float _y, float _vx, float _vy) {
    x= _x;
    y= _y;
    vx= _vx;
    vy= _vy;
    d= 15;
    hp=1;
  }

  void act() {
    x= x+vx;
    y= y+vy;
    //if bullet goes off scree, lives =0
    if (x>width && y>height && x<0 && y<0){
      hp=0;
    }
  }

  void show() {
    stroke(black);
    fill(green);
    circle(x,y,d);
  }
  
}
