//This function draws the GAMEOVER screen.

void gameOver() {
  //rectMode(CORNER);
  int rounds; 
  rounds = nextwave-1;
  image(dark, width/2, height/2, 1000, 900);
  restart.show();
  if (restart.clicked) {
    mode= INTRO;
    setup();
  }
  textSize(30);
  fill(white);
  text("Winning Rounds: "+ rounds, width/2, 500);
  textSize(150);
  text("GAMEOVER", width/2, 200);
}
