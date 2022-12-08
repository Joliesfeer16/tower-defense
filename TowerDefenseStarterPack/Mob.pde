//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  //instance
  float x, y, vx, vy, d;
  int hp; //hit points
  //how much money you get when you kill a mob
  color fillColor;
  float speed;


  //construction
  Mob(float _x, float _y, float _vx, float _vy) {
    x= _x;
    y= _y;
    vx= _vx;
    vy= _vy;
    d=35;
    hp=1;
    speed= 1;
    fillColor= purple;
    value = 1;
  }

  //behavior function
  void show() {
    fill(fillColor);
    strokeWeight(3);
    circle(x, y, d);
  }

  void act() {
    x= x+vx*speed;
    y= y+vy*speed;

    //when mob sees the nodes, it will move in right direction
    int i=0;
    while (i < nodes.length) {
      if ( dist(nodes[i].x, nodes[i].y, x, y)< 4) {
        vx= nodes[i].dx;
        vy= nodes[i].dy;
      }
      i++;
    }

    //if dist btwn bullet and mob is less than sum of radius of 2 obj, we have a collision
    i =0;
    while (i<bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y)<d/2 + myBullet.d/2) {
        hp--; //when bullet hits mob, hp goes down by 1
        if (hp==0) {
          int p= 0;
          while (p<25) {
            explosions.add(new Explosion (x, y, random(-3, 3), random(-3, 3), 25, red)); //enemy bullet parameters are x,y,vx,vy
            p++;
          }
        }
      }
      i++;
    }
    if (x>780) {
      hp=0;
      lives= lives-1;
      money= money-value;
    }
  }
}
