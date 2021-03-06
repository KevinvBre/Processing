


import oscP5.*;
import netP5.*;
  
boolean background = true;
float x,
      y;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400,400);
  frameRate(25);
  
  oscP5 = new OscP5(this,7400); // talking too
  myRemoteLocation = new NetAddress("127.0.0.1",7401); // listening too
}


void draw() {
 
  if(background)
  background(0);  
  else
  background(200);  
  
}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/te2st");
  
  myMessage.add(123); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print( theOscMessage.addrPattern() );


 if(theOscMessage.checkAddrPattern("/COG/LEFT") == true) {
   println("left");
 }
  
   background = !background;

  
}