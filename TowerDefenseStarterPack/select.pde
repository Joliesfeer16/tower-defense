void select() {
  background(0);

  basicmap.show();
  mapspace.show();
  
  fill(red);
  textSize(100);
  text("Select your map", width/2, 200);
  
   int s=3;
  if (basicmap.clicked) {
    mode= BASICMAP;
    nodes = new Node[8];
    nodes[0]= new Node(150, width/2, 0, -s, pink );
    nodes[1]= new Node(150, 200, s, 0, pink);
    nodes[2]= new Node(350, 200, 0, s, pink);
    nodes[3]= new Node(350, 400, s, 0, pink);
    nodes[4]= new Node(650, 400, 0, -s, pink);
    nodes[5]= new Node(650, 100, -s, 0, pink);
    nodes[6]= new Node( 500, 100, 0, s, pink);
    nodes[7]= new Node(500, 650, s, 0, pink);
  }
  if (mapspace.clicked) {
    mode= MAPSPACE;
    nodes = new Node[8];
    nodes[0]= new Node(700, 600, 0, -1, pink );
    nodes[1]= new Node(700, 100, -1, 0, pink);
    nodes[2]= new Node(100, 100, 0, 1, pink);
    nodes[3]= new Node(100, 500, 1, 0, pink);
    nodes[4]= new Node(600, 500, 0, -1, pink);
    nodes[5]= new Node(600, 200, -1, 0, pink);
    nodes[6]= new Node(200, 200, 0, 1, pink);
    nodes[7]= new Node(200, 350, 1, 0, pink);
  }
}
