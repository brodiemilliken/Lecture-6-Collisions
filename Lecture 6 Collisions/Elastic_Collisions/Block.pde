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
  
  boolean collision(Block o){
    if (x + w >= o.x && o.x + o.w >= x){
        float vf1 = (2*m)/(m+o.m)*v+(o.m-m)/(m+o.m)*o.v;
        float vf2 = (m-o.m)/(m + o.m)*v+(2*o.m)/(m+o.m)*o.v;
        
        v = vf2;
        o.v = vf1;
        return true;
    }
    return false;
  }
}
