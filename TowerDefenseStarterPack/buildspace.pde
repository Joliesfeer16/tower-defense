//This function draws the BUILD screen
//how to make the build mode go to chosen map when you click back
//make a back button, so after you place the gun, you can click back and it will take you to the chosen mode/ previous mode

void buildspace() {

  drawMapSpace();// map same as play map
  animateThings(); //mobs, tower, animated things are same as play
  drawBuildPlay(); //interface (tool bar, buttons must be different)
  handleBuildSpace();//the buttons and functions are different
}



void handleBuildSpace() {
  if (back.clicked ) {
    mode= MAPSPACE;
  }
  if (gun.clicked && money>=price && building==false) {
    towers.add (new Tower(GUN)); //it will follow the mouse so x and y doesnt matter
    building = true;
  }

  if (aoe.clicked && money>=price && building==false) {
    towers.add (new Tower(AOE)); //it will follow the mouse so x and y doesnt matter
    building = true;
  }

  if (sniper.clicked && money>=price && building==false) {
    towers.add (new Tower(SNIPER)); //it will follow the mouse so x and y doesnt matter
    building = true;
  }
}
