//This function draws the PLAY screen (BASIC MODE)

void basicmap() {
  drawMap();
  drawPlayInterface();
  animateThings();
  handleButtonClicks();
  println(mobs.size());
}

void drawMap() {
  image(basic, width/2, height/2);

  //if selective mode is something draw the lines (can also change the background here, so in mapspace can put drawMap(), etc.

  //road lines
  stroke(orange);
  strokeWeight(35);
  line(0, width/2, 150, width/2);
  line(150, width/2, 150, 200);
  line(150, 200, 350, 200);
  line(350, 200, 350, 400);
  line(350, 400, 650, 400);
  line(650, 400, 650, 100);
  line(650, 100, 500, 100);
  line(500, 100, 500, 650);
  line(500, 650, 800, 650);

  strokeWeight(5);
  //temporary draw node
  int j=0;
  while (j<8) {
    nodes[j].show();
    j++;
  }
}

void drawPlayInterface() {
  fill(white);
  textFont(mapsfont);
  text("Basic Map", 425, 40);

  //sidebar
  strokeWeight(4);
  stroke(black);
  fill(black);
  pushMatrix();
  rectMode(CORNER);
  rect(800, 0, 200, height);
  popMatrix();

  //next wave button (draw) + lives, money, wave counter
  textFont(normalF);
  fill(white);
  textSize(30);
  text("Lives: " + lives, 890, 30);
  text("Money: " +money, 890, 110);
  text("Next Wave: " + nextwave, 890, 70);
  rectMode(CENTER);
  wave.show();

  //Build button
  textSize(30);
  fill(white);
  // text("BUILD" + nextwave, 890, 70);
  rectMode(CENTER);
  build.show();

  //home button
  home.show();
}

void animateThings() {

  //draw mob (act + show) from class
  int i=0;
  while (i < mobs.size()) { //cannot put a set number because we dont know how much will be destroyed
    Mob myMob= mobs.get(i); //so the code is not too repetitive, myMob is all of the mobs
    myMob.act(); //only gets an exisiting mob
    myMob.show();
    if (myMob.hp <= 0) { //will remove mob if it is hit by bullet, when hhit
      mobs.remove(i);
      money= money + value;
    } else {
      i++;
    }
  }

  //draw towers (act + show)
  int f=0;
  //i=0;
  while (f< towers.size()) {
    Tower myTower = towers.get(f);
    myTower.show();
    if (mobs.size()>0) {
      myTower.act();
    }
    f++;
  }
  
  int j= 0;
  while(j< explosions.size()){
    Explosion myExplosion = explosions.get(j);
    myExplosion.show();
    myExplosion.act();
    if (myExplosion.hp<=0){
      explosions.remove(j);
    } else {
      j++;
    }
  }

  //bullet draw (act + show)
  int h=0;
  while (h< bullets.size()) {
    Bullet myBullet = bullets.get(h);
    myBullet.show();
    myBullet.act();
    //if bullet's lives are 0, remove the bullet
    if (myBullet.hp <= 0) {
      bullets.remove(h);
    } else {
      h++;
    }
  }
  if (lives==0) {
    mode = GAMEOVER;
  }
//  if (mobs.size()==0){ //or mobx is not 800 or when lives= 3
//    win = win+1;
//  }
}

void handleButtonClicks() {
  //if mobs.size>0, can click on button ADD mob.size==0

  if (wave.clicked && mobs.size()==0 ) {
    int i=0;
    int x= 0;
    while (i< nextwave) {
      print("*");
      mobs.add (0, new Mob(x, width/2, 1, 0));
      x= x-50;
      i++;
    }
    
      i=0;
      x= 50;
      while (i< nextwave) {
        print("*");
        mobs.add (0, new ChonkyMob(x, width/2, 1, 0));
        x= x-100;
        i++;
      }
    
     i=0;
      x= 50;
      while (i< nextwave) {
        print("*");
        mobs.add (0, new SpeedyMob(x, width/2, 1, 0));
        x= x-100;
        i++;
      }
    nextwave++;
  }

  if (build.clicked) {
    mode= BUILDMAP;
    building = false;
  }

  if (home.clicked) {
    mode= INTRO;
    setup();
    draw();
  }
}
