//define position and acceleration variables
float xpos = 100;
int ypos = 100;
float xaccel = 200;
int yaccel = 0;
//define speed variable
float speed = 0;
//define number of collisions variable
int collisions = 0;
//define color variable
int c = 0;
//set canvas size, text size, & color mode
void setup() {
  size(800, 800);
  textSize(20);
  colorMode(HSB);
}
void draw() {
  //draw background every frame
  background(#88DE7D);
  //increase the ball's position using the ball's acceleration
  xpos = xpos+xaccel;
  ypos = ypos+yaccel;
  //draw the ball using new positions
  fill(c, 255, 255);
  ellipse(xpos, ypos, 50, 50);
  //draw instructions
  fill(255);
  text("USE WASD TO HIT THE BALL", 525, 20);
  //calculate speed
  speed = sqrt(sq(xaccel)+(sq(float(yaccel))));
  //draw speed as text
  text("SPEED:", 5, 795);
  text(speed, 70, 795);
  //draw collisions as text
  text("COLLISIONS:", 600, 795);
  text(collisions, 725, 795);
  //decrease horizontal acceleration
  xaccel = xaccel*0.98;
  //increase vertical acceleration (gravity)
  yaccel++;
  //test for and apply wall collisions by inverting acceleration and changing random ball color
  if (xpos>775) {
    xaccel = xaccel*(-1);
    collisions++;
    c = int(random(0, 256));
  }
  if (xpos<25) {
    xaccel = xaccel*(-1);
    collisions++;
    c = int(random(0, 256));
  }
  if (abs(xaccel)<0.1) {
    xaccel = 0;
  }
  if (ypos>775) {
    yaccel = yaccel*(-1)+3;
    ypos = 775;
    if (yaccel<1) {
      collisions++;
      c = int(random(0, 256));
    }
  }
  if (ypos<25) {
    yaccel = yaccel*(-1)-1;
    ypos = 27;
    collisions++;
    c = int(random(0, 256));
  }
}
//hit the ball in the whatever direction is pressed (MUST CLICK INTO THE WINDOW)
void keyPressed() {
  println(key);
  if (key=='w')
  {
    yaccel = yaccel-40;
  }
  if (key=='s') {
    yaccel = yaccel+40;
  }
  if (key=='a') {
    xaccel = xaccel-40;
  }
  if (key=='d') {
    xaccel = xaccel+40;
  }
}
