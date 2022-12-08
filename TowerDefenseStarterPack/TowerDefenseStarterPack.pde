//TO do:
//ASK: ask abt not being able to add guns after clicking on home
// hp of mobs not getting accounted for?
//-make new types of towers, with diff bullets
//-make make types of nodes
//- make types of bullets
//set everything back to default when you change the map
//cant clikc on bulid if boolean building is true, can only do it if false, if building==false, in build mobs
//why so slow
//the how many rounds you won?

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int BASICMAP = 1;
final int BUILDSPACE= 2;
final int GAMEOVER = 3;
final int MAPS     = 4;
final int MAPSPACE = 5;
final int BUILDMAP = 6;
final int SELECT   = 7;
int mode;
int selectivemode;

//tower types
final int GUN = 0;
final int AOE = 1;
final int SNIPER =2;
int price;

PImage basic;
PImage planet;
PImage dark;

PImage map1, map2;

PFont mapsfont;
PFont normalF;


//Pallette
color white    = #ffffff;
color black    = #000000;
color pink     = #ff595e;
color orange   = #ffca3a;
color green    = #8ac926;
color blue     = #1982c4;
color purple   = #6a4c93;
color red      = #D32409;
color neonblue = #50FFFB;
color lightPink= #F09DC1;



//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button wave;
Button build;
Button playgame;
Button gun;
Button maps;
Button mapspace;
Button basicmap;
Button back;
Button mapfire;
Button options;
Button home;
Button aoe;
Button sniper;
Button restart;
Button select; 
//Button map2;

//Collections of objects
Node[] nodes; //node for basic play map
//arrays cannot change their sizes, if you want to change their size, can make arraylist
Node[] nodespace;

//NODES COULD DO ARRAY
//Node[] nodes;
//int n= 8;

//Mob mobby;
ArrayList <Mob> mobs; //arraylist, put type of thing contained in arraylist in brakcets
ArrayList <Tower> towers;
ArrayList <Bullet> bullets;
ArrayList <Explosion> explosions;
//ArrayList <AoeRing> aoes;


//Images and Gifs
Gif IntroAnimation;

//Fonts
PFont font1;

//next wave counter
int nextwave;
int lives;
int money;
int value;

int m;
int win;

boolean building;


// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  
  makeNodes();
  basic = loadImage("blue.jpeg");
  basic.resize( 1000, 900);
  planet = loadImage("galaxyy.jpeg");
  planet.resize( 1000, 900);
  mapsfont= createFont("Games.ttf", 70);
  normalF= createFont("arial_narrow_7.ttf", 40);
  map1 = loadImage("map1.png");
  map2 = loadImage("map2.png");
  win=0;
  dark = loadImage("dark.jpg");
  makeButtons();
}



void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
  nextwave= 1;
  lives= 3;
  money= 10;
  selectivemode= BASICMAP;
}

void initializeVariables() {

  //Load Images & Gifs
  IntroAnimation = new Gif("mazeGif/frame_", "_delay-0.1s.gif", 42, 1, width/2, height/2, width, height);

  //Load Fonts

  //Create Collections of Objects
  //node array COULD DO:
  //nodes= new Node[n];
  //nodes[0] = new Node(add parameter);
  //...
  //nodes[7] = new Node(add parameter)


  // mobby = new Mob(0, width/2, 1, 0); //x, y, direction the mob should go
  mobs   = new ArrayList <Mob>(); //arraylist mob starts at size 0, we can add mobs as we please
  towers = new ArrayList <Tower>();
  bullets = new ArrayList <Bullet>();
  explosions = new ArrayList <Explosion>();
  //aoes = new ArrayList <AoeRing>();
}

void makeButtons() {

  //INTRO - Start
  start = new Button("START", 400, 550, 200, 100, white, black);
  select = new Button("Select", width/2, 400, 200, 100, white, black);

  //home button
  home = new Button ("Home", 900, 650, 150, 100, lightPink, white);
  restart= new Button ("Restart", width/2, height/2, 150, 100, black, white);


  //PLAY - Next Wave, To Build Mode
  wave  = new Button("Next", 900, 250, 150, 100, blue, white);

  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  build    = new Button("Build", 900, 400, 150, 100, blue, white);
  playgame = new Button ("Play", 900, 250, 150, 100, orange, white);
  gun      = new Button ("Gun: 5$", 900, 400, 150, 100, green, white);
  back     = new Button ("Back", 900, 250, 150, 100, orange, white);
  aoe      = new Button ("AOE: 10$", 900, 525, 150, 100, red, white);
  sniper   = new Button ("Snip:15$", 900, 650, 150, 100, blue, white);

  //MAPS options
  maps       = new Button("Maps", 900, 450, 150, 100, blue, white);
  mapspace   = new Button(map2, 700, 550, 350, 350, purple, white);
  basicmap   = new Button(map1, 300, 550, 350, 350, orange, white);
  // mapfire    = new Button("Fire", 750, 550, 150, 100, red, white);

  //OPTIONS
  options  = new Button ("Options", 650, 550, 200, 100, white, black);

  //GAMEOVER - Reset
}

void makeNodes() {
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == BASICMAP) {
    basicmap();
  } ///else if (mode == MAPS) {
  // maps();
  else if (mode == BUILDSPACE) {
    buildspace();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == MAPSPACE) {
    mapSpace();
  } //else if (mode == MAPFIRE) {
  //mapFire();
  //else if (mode == OPTIONS) {
  //options();
  else if (mode == BUILDMAP) {
    buildmap();
  } else if (mode == SELECT){
    select();
  }
}
