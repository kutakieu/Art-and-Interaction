class Mario{
  int X, Y;
  int blockSize = height/16;
  int walkCount, direction;
  boolean jumping;
  int goUp, goDown;
  PImage img;
  PImage blockImg, marioRight, marioLeft, marioJumpRight, marioJumpLeft; 
  PImage marioWalkLeft1, marioWalkLeft2, marioWalkLeft3;
  PImage marioWalkRight1, marioWalkRight2, marioWalkRight3;
  PImage [] walkRight = new PImage[3];
  PImage [] walkLeft = new PImage[3];
  ArrayList<Block> blocks;
  Mario(int x, int y){
    X = x*blockSize;
    Y = y*blockSize;
    walkCount = 0;
    marioLeft = loadImage("img/marioLeft.png");
    marioRight = loadImage("img/marioRight.png");
    marioWalkLeft1 = loadImage("img/marioWalkLeft1.png");
    marioWalkRight1 = loadImage("img/marioWalkRight1.png");
    marioWalkLeft2 = loadImage("img/marioWalkLeft2.png");
    marioWalkRight2 = loadImage("img/marioWalkRight2.png");
    marioWalkLeft3 = loadImage("img/marioWalkLeft3.png");
    marioWalkRight3 = loadImage("img/marioWalkRight3.png");
    marioJumpLeft = loadImage("img/marioJumpLeft.png");
    marioJumpRight = loadImage("img/marioJumpRight.png");
    walkRight[0] = marioWalkRight1;
    walkRight[1] = marioWalkRight2;
    walkRight[2] = marioWalkRight3;
    walkLeft[0] = marioWalkLeft1;
    walkLeft[1] = marioWalkLeft2;
    walkLeft[2] = marioWalkLeft3;
    img = marioRight;
    direction = 1;
    
  }
  
  void setStage(ArrayList<Block> _blocks){
    blocks = _blocks;
  }
  
  void draw(){
    if(jumping)
      jumping();
    image(img, X, Y, blockSize, blockSize);
  }
  
  void update(int x, int y){
    X += x;
    Y -= y;
  }
  void stand(){
    img = direction > 0 ? marioRight : marioLeft;
    walkCount = 0;
  }
  
  void walk(int direction){
    if(jumping)
      update(16*direction, 0);
      
    X += 16*direction;
    img = direction > 0 ? walkRight[walkCount%3] : walkLeft[walkCount%3];
    walkCount++;
    this.direction = direction;
  }
  
  void jump(){
    jumping = true;
    goUp = 100;
    goDown = 1;
    img = direction > 0 ? marioJumpRight : marioJumpLeft;
  }
  void jumping(){
    goUp*=0.6;
    if(goUp>1)
      update(0,goUp);
    else{
      goDown*=7;
      if(blockSize * 14 < Y + goDown){
        update(0, (blockSize*13 - Y)*(-1));
        jumping = false;
      }else
        update(0,goDown*(-1));
    }
      
  }
}