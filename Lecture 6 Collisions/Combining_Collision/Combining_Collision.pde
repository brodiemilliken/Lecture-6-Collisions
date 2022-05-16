ArrayList<Block> blocks;
void setup(){
  size(800,300);
  blocks = new ArrayList<Block>();
  blocks.add(new Block(100,5,50,255,50,50));
  blocks.add(new Block(400,0,200,50,50,255));
  blocks.add(new Block(600,0,400,50,255,50));
}

void draw(){
  background(0);
  stroke(255);
  line(0,height-20,width,height-20);
  for (int i = 0; i < blocks.size(); i++){
    blocks.get(i).move();
    blocks.get(i).show();
    for (int j = 0; j < blocks.size(); j++){
      if (i==j) j++;
      else try{
        if (blocks.get(i).collision(blocks.get(j))) j--;
      } catch (Exception e) {};
    }
  }
}
