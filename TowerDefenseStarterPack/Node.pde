//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to 
//the node's instructions. 

class Node {
  //instance
  float x, y, dx, dy;
  color fill;
  
  //constructor
  Node(float _x, float _y, float _dx, float _dy, color f){
    x=  _x;
    y=  _y;
    dx= _dx;
    dy= _dy;
    fill= f;
  }
  
  void show(){
    fill(fill);
    stroke(fill);
    circle(x,y,30);
    line(x, y, x+dx*50, y+dy*50);
    
  }
}