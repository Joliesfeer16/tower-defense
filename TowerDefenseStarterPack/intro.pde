//This function draws the INTRO screen.

void intro() {
  IntroAnimation.show();
  fill(white);
  textSize(120);
  text("TOWER DEFENSE", width/2, 200);

  select.show();
  
  if (select.clicked)mode=SELECT;
  
}
