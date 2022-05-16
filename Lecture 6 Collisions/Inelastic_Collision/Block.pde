class Block{
  float x,v,m,w;
  color c;
  public Block(float xPos, float velocity, float mass, color col){
    x = xPos;
    v = velocity;
    m = mass;
    c = col;
    w = sqrt(mass) * 10;
  }
  
  void show(){
    fill(c);
    stroke(255);
    rect(x,height-20,w,-w);
  }
  
  void move(){
    x += v;
  }
  
  void collision(Block o){
    if (x + w >= o.x && o.x + o.w >= x){
      v = (m*v + o.m*o.v)/(m + o.m);
      o.v = v;
    }
  }
}
