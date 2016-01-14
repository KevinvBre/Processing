/*
HKU - Kevin van Breemaat 2015
*/
import oscP5.*;
import netP5.*;  
OscP5 oscP5;
NetAddress myRemoteLocation;

float x;
int tcount = 0;   // count tiles
int tcountActie = 0;   // count tiles

void setup() {
  size(1280,800);
  frameRate(60);
  /* start listening on port 12001, incoming messages must be sent to port 12001 */
  oscP5 = new OscP5(this,12001);
  // send to computer address
  myRemoteLocation = new NetAddress("77.172.232.120",12000);
}

void draw() {  
  background(100,0,0);   
  
  //draw visual tiles for user feedback
  for (int r = 0; r < 3; r++){ // row
    for (int t  = 0; t < 3; t++){ // tile
      float w = 1280/3;
      float h = 800/3;
      tcount ++; // tcount cause we cant rely on the order of R and T;        
      if(tcount == tcountActie) {
        fill(0,255,0,125);
        rect(t*w, r*h, w,h); 
      }else{
        fill( 0,0,0,125 );
      }
        
    }
  }
  tcount =0; 
  rect(x,tcountActie,20,20);
}

void mousePressed() {
  /* send a message to your remote location on mouse (touch) click */
  //unneeded for this proto
  /*
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(123);
  oscP5.send(myMessage, myRemoteLocation); 
  println("android sketch, sending to "+myRemoteLocation);
  */
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) { 
  // get the second value as a float  
  int messageTile = theOscMessage.get(0).intValue();
  tcountActie = messageTile;
  x+=tcountActie;
}
