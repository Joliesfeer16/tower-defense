void mapSpace() {
  drawMapSpace();// map same as play map
  animateThings(); //mobs, tower, animated things are same as play
  drawSpaceInterface(); //interface (tool bar, buttons must be different)
  handleSpaceButtonClicks();//the buttons and functions are different
}

void drawMapSpace() {
  //draw map
  image(planet, width/2, height/2);

  //road lines
  stroke(neonblue);
  strokeWeight(35);
  line(0, 600, 700, 600);
  line(700, 600, 700, 100);
  line(700, 100, 100, 100);
  line(100, 100, 100, 500);
  line(100, 500, 600, 500);
  line(600, 500, 600, 200);
  line(600, 200, 200, 200);
  line(200, 200, 200, 350);
  line(200, 350, 800, 350);

  strokeWeight(5);
  //temporary draw node
  int j=0;
  while (j<8) {
    nodes[j].show();
    j++;
  }
}

void drawSpaceInterface() {

  fill(white);
  textSize(60);
  textFont(mapsfont);
  text("Space Map", 425, 30);

  //sidebar
  textFont(normalF);
  strokeWeight(4);
  stroke(black);
  fill(black);
  pushMatrix();
  rectMode(CORNER);
  rect(800, 0, 200, height);
  popMatrix();

  //next wave button (draw)
  textSize(30);
  fill(white);
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

  textSize(30);
  fill(white);
  text("Lives: " + lives, 890, 30);

  home.show();
}

void handleSpaceButtonClicks() {

  //if mobs.size>0, can click on button ADD mob.size==0

  if (wave.clicked && mobs.size()==0 ) {
    int i=0;
    int x= 0;
    while (i< nextwave) {
      print("*");
      mobs.add (0, new Mob(x, 600, 1, 0));
      x= x-50;
      i++;
    }
    
      i=0;
      x= 50;
      while (i< nextwave) {
        print("*");
        mobs.add (0, new ChonkyMob(x, 600, 1, 0));
        x= x-100;
        i++;
      }
    
     i=0;
      x= 50;
      while (i< nextwave) {
        print("*");
        mobs.add (0, new SpeedyMob(x, 600, 1, 0));
        x= x-100;
        i++;
      }
    nextwave++;
  }

  if (build.clicked) {
    mode= BUILDSPACE;
    building = false;
  }

  if (home.clicked) {
    mode= INTRO;
    setup();
  }
}
