Ball [] balls;
int nBalls=500;

//FIXES TO DO : Weird jitter at the end of the simulation.
void setup(){
  balls = new Ball[nBalls];
  for (int i=0; i<nBalls;i++){
    balls[i]=new Ball(5,color(random(255),random(255),random(255)));
  }
  //size(800,600);
  fullScreen();
}

void draw(){
  background(127);
   for (int i=0; i<nBalls;i++){
    balls[i].move();
    balls[i].bounce();
    balls[i].display();
    balls[i].mouse();
  }
}
