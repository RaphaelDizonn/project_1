// Raphael Dizon #218038464
// Project 1: Bedsheet Monster 
 
// Cute game starring the Bedsheet Monster. Click and hold to collect the souls. Every 5 souls increases the size of the Bedsheet Monster. Touch the Bedsheet Monster to make him smile. 
 
boolean debug = false;
PVector position, target;
PImage ghostCurrent, ghost01, faxman, ghost02, ghost03, ghost04; 
float margin = 50;

float size = 0;
float x;
float velocity = 5;
int souls = 0;
char boo;

boolean isBothered = false;
int botheredMarkTime = 0;
int botheredTimeout = 3000; // Processing measures time in milliseconds
float botheredSpread = 5;

float triggerDistance1 = 100; // distance for the interaction to actuate
float triggerDistance2 = 5; // distance for the image to touch the object
float movementSpeed = 0.05; // movement speed

float targetpoints = 10; 

PImage back;
int bx = 0, bx2 = 600;
PImage mid;
int mx = 0, mx2 = 600;
PImage mid2;
int ox = 0, ox2 = 600;
PImage front;
int fx = 0, fx2 = 600;
PImage mainback;
int lx = 0, lx2 = 600;
PImage bushes;
int nx = 0, nx2 = 600;

import processing.sound.*;
SoundFile song;

void setup() { 
  size(800, 600, P2D);
  
  position = new PVector(width/2, height/2);
  pickTarget();
  
  // loadImages 
 ghost01 = loadImage("ghost01.png");
 ghost01.resize(ghost01.width/2, ghost01.height/2);
 ghost02 = loadImage("ghost02.png");
 ghost02.resize(ghost02.width/2, ghost02.height/2);
faxman = loadImage("heart.png");
faxman.resize(200, 100);
back = loadImage ("09_Forest.png");
back.resize (800,600);
mid = loadImage ("07_Forest.png");
mid.resize (800,600);
front = loadImage ("04_Forest.png"); 
front.resize (800,600);
mainback = loadImage ("10_Sky.png");
mainback.resize (800,600);
bushes = loadImage ("02_Bushes.png");
bushes.resize (800,600);
  ghost04 = loadImage ("smilingghost.png"); 
   ghost04.resize(ghost02.width, ghost02.height);


 song = new SoundFile(this, "ghostduet.wav");
song.loop();

  
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void pickTarget() {
  target = new PVector(random(margin, width-margin), random(margin, height-margin));
}


void draw() {
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isBothered = position.dist(mousePos) < triggerDistance1; 
  
    if (isBothered) {
            botheredMarkTime = millis(); 
    ghostCurrent = ghost04; // interaction expression;
    }
  if (mousePressed) {
            botheredMarkTime = millis(); 
    ghostCurrent = ghost02; // interaction expression
    position = position.lerp(target, movementSpeed);
    if (position.dist(target) < triggerDistance2) {
      pickTarget();
 souls = souls + 1;
// size = size + 50; 

 }
 
  } else if (!isBothered && millis() > botheredMarkTime + botheredTimeout/6) {
    ghostCurrent = ghost01; // neutral expression
  }



 position.y += sin(millis()) / 0.5; // weird y shake

// IMAGES
image(mainback,lx,0); image(mainback,lx,0);
image(back,bx,0); image(back,bx2,0);
image(mid,mx,0); image(mid,mx2,0);
image(front,fx,0); image(front,fx2,0);
image(bushes,nx,0); image(bushes,nx2,0);
image(faxman, target.x, target.y, 100, 100); 
image(ghostCurrent, position.x , position.y, ghostCurrent.width + size, ghostCurrent.width + size);


// Text
textSize(30);
fill(149, 0, 0);
text("Souls: " + souls, 50, 550);
   
  if (4 < souls) {
  size = 0 + 20;
}

   if (9 < souls) {
  size = 0 + 40;
}
   
    if (14 < souls) {
  size = 0 + 60;
}
   if (19 < souls) {
  size = 0 + 80;
}
   
    if (24 < souls) {
  size = 0 + 100;
}
  

   
   
   if (souls < 29) {
} else {
 fill(255, 255, 255);
  textSize(50);
  text("boo " + boo, random(800), random(600));
  System.out.println("boo.");

}


// IMAGES

// PARALLAX
bx--; bx2--;
mx-=1; mx2-=1;
ox-=1.5; ox2-=1.5;
fx-=2; fx2-=2;
nx-=3; nx2-=3; 

if(bx<-600) {bx = 600;} if(bx2<-600) {bx2 = 600;}
if(mx<-600) {mx = 600;} if(mx2<-600) {mx2 = 600;}
if(fx<-600) {fx = 600;} if(fx2<-600) {fx2 = 600;}
if(nx<-600) {nx = 600;} if(nx2<-600) {nx2 = 600;}
// PARALLAX

  if (debug) { // DEBUG TEST
    noFill();
    stroke(0, 255, 0);
    ellipse(position.x, position.y, triggerDistance1*2, triggerDistance1*2);
    ellipse(position.x, position.y, triggerDistance2*2, triggerDistance2*2);
    line(target.x, target.y, position.x, position.y);
    stroke(255, 0, 0);
    image(faxman, target.x, target.y, 100, 100);
 

}
}
