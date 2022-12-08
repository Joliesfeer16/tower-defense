void buildmap() {

  drawMap();// map same as play map
  animateThings(); //mobs, tower, animated things are same as play
  drawBuildPlay(); //interface (tool bar, buttons must be different)
  handleBuildPlay();//the buttons and functions are different
}

void drawBuildPlay() {
  fill(white);
  textSize(60);
  textFont(mapsfont);
  text("BUILD MODE", 425, 30);
  stroke(black);

  //sidebar
  textFont(normalF);
  strokeWeight(4);
  stroke(black);
  fill(black);
  pushMatrix();
  rectMode(CORNER);
  rect(800, 0, 200, height);
  popMatrix();

  //playgame button
  rectMode(CENTER);

  gun.show();
  back.show();
  aoe.show();
  sniper.show();
}

void handleBuildPlay() {
  if (back.clicked && building==false ) {
    mode= BASICMAP;
  }

  if (gun.clicked && money>price && building==false) {
    towers.add (new Tower(GUN)); //it will follow the mouse so x and y doesnt matter
    building = true;
  }

  if (aoe.clicked && money>price && building==false) {
    towers.add (new Tower(AOE)); //it will follow the mouse so x and y doesnt matter
    building = true;
  }

  if (sniper.clicked && money>price && building==false) {
    towers.add (new Tower(SNIPER)); //it will follow the mouse so x and y doesnt matter
    building = true;
  }
}
