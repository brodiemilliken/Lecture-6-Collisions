class Block{
  float x,v,m,w,r,g,b;
  public Block(float xPos, float velocity, float mass, float red, float green, float blue){
    x = xPos;
    v = velocity;
    m = mass;
    r = red;
    g = green;
    b = blue;
    w = sqrt(mass) * 10;
  }
  
  void show(){
    fill(color(r,g,b));
    stroke(255);
    rect(x,height-20,w,-w);
  }
  
  void move(){
    x += v;
  }
  
  boolean collision(Block o){
    if (x + w >= o.x && o.x + o.w >= x){
      v = (m*v + o.m*o.v)/(m + o.m); //New velocity is inelastic
      x = (x + o.x)/2; //Set x position to a point inbetween the two old blocks
      
      float mP = m/(m+o.m); //percentage of color belonging to first block
      float omP = o.m/(m+o.m); //percentage of color belonging to second block
      
      //New rgb colors
      r = (mP*r + omP*o.r); 
      g = (mP*g + omP*o.g);
      b = (mP*b + omP*o.b);
      
      //add mass of blocks together
      m += o.m;
      
      //set new width value
      w = sqrt(m) * 10;

      //delete second block
      blocks.remove(o);
      return true;
    }
    return false;
  }
}
