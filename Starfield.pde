PImage img;
void setup(){
size(1500,900);
background(51);
img = loadImage("shell.png");
}
double baseX = 750;
double baseY = 550;

class Dust{
  double myY;
  double myX;
  double speed = random(5,8);
  float vector;
  boolean shown = true;
  Dust(){
  vector = random(0,2*PI);
  myY = baseY + 50*sin(vector);
  myX = baseX + 50*cos(vector);
  }
  
  void move(){
  myY +=  speed*sin(vector);
  myX +=  speed*cos(vector);
  if (myY>790 || myY<0 || myX<0 || myX>1500)
    shown =false;
  }
  
  void show(){
  if(shown){
    fill(0,0,0);
    ellipse((float)myX,(float)myY,2,2);
    }
  }
}

class Shrapnel extends Dust{
  Shrapnel(){
  vector = random(0,2*PI);
  myY = baseY + 50*sin(vector);
  myX = baseX + 50*cos(vector);
  speed=speed*1.5;
  }
  
  void show(){
  if(shown){
   fill(147,161,167);
   ellipse((float)myX,(float)myY,15*sin(vector+69),15*sin(vector+420));
    }
  }
}

Shrapnel[] array1= new Shrapnel[80];
Dust[] array2 = new Dust[1000];

boolean justBoom;
int counter = -5;
boolean explosion;

void draw(){
background(183,224,242);
fill(198,198,174);
rect(0,800,1500,100);  
if(counter>=0){
counter-=4;
}

//populate arrays
if (justBoom){
 for(int i = 0; i< array2.length; i++)
 array2[i] = new Dust();
 for(int i = 0; i< array1.length; i++)
 array1[i] = new Shrapnel();
 justBoom = false;
 explosion = true;
}

//move dust and shrapnel
if(explosion){

for(int i = 0; i< array1.length; i++){
 array1[i].move();
 array1[i].show();
}
for(int i = 0; i< array2.length; i++){
 array2[i].move();
 array2[i].show();
}

}

if(counter == 0){
  justBoom = true;
  counter = -5;
  }
else
  if (!(counter == -5))
  image(img, (float)baseX-15+counter, (float)baseY-100-counter, img.width/4, img.height/4);
}

void mousePressed(){
counter = 200;
}
