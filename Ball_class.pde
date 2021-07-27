class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float friction;
  int r;
  color c;

  Ball(int tempR,color tempC) {
    position=new PVector(width/2,height-tempR*2);
    velocity=new PVector(random(-25,10),random(-15,-10));
    acceleration=new PVector(0,0.3);
    friction=random(0.65,0.75);
    r=tempR;
    c=tempC;
  }

  void move() {
    position.add(velocity);
    velocity.add(acceleration);
  }

  void bounce() {
    if (position.x+r>width) {
      position.x=width-r;
      velocity.x*=-1;
      velocity.mult(friction);
    } else if (position.x-r<0) {
      position.x=r;
      velocity.x*=-1;
      velocity.mult(friction);
    }
    if (position.y+r>height) {
      position.y=height-r;
      velocity.y*=-1;
      velocity.mult(friction);
    } else if (position.y-r<0) {
      position.y=r;
      velocity.y*=-1;
      velocity.mult(friction);
    }
  }

  void display() {
    fill(c);
    ellipse(position.x, position.y, r*2, r*2);
  }
  
  void mouse(){
    float distX,distY,dist;
    if (mousePressed){
    distX=mouseX-position.x;
    distY=mouseY-position.y;
    dist=sqrt(distX*distX+distY*distY);
    velocity=new PVector(distX,distY);
    velocity.normalize().mult(map(dist,1,sqrt(height*height+width*width)-r*2,20,0.5));
    }
  }
}
