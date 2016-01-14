/*
HKU - Kevin van Breemaat 2015
*/

//imports
import gazetrack.*;
import oscP5.*;
import netP5.*;


//tobii settings
float x_;
float y_;

//sketch settings
boolean tobii = true;         //enable EyeX and EyeY locations (Tobii Eye X Requirments.

//init tobii  
GazeTrack gt;
//init OSC
OscP5 oscP5;
NetAddress myRemoteLocation;
float wy;

int tcount = 0;   // count tiles
int tcountOld= 1 ;// first if.

void setup() {
  size(displayWidth, displayHeight);
  frameRate(60);
  /* start oscP5, listening for incoming messages on port 12000 */
  oscP5 = new OscP5(this,12000);
  // send to phone address
  myRemoteLocation = new NetAddress("192.168.2.17",12001);
  
  //setup Tobii
  if(tobii){
    gt = new GazeTrack(this);
  }
}


void draw() {
  background(0);

  //draw eye/mouse pointer
  if(tobii){
    x_ = gt.getGazeX();
    y_ = gt.getGazeY(); 
  }else{
    x_ = mouseX;
    y_ = mouseY;
  }

  //draw 9 squares for visual feedback
  for (int r = 0; r < 3; r++){ // row
    for (int t  = 0; t < 3; t++){ // tile
      float w = displayWidth/3;
      float h = displayHeight/3;
      fill( (255/9)*(r+t) );
      rect(t*w, r*h, w,h);
      tcount ++; // tcount cause we cant rely on the order of R and T;
      
      if(x_ > t*w && x_ < t*w+w && y_ > r*h && y_ < r*h+h && tcount != tcountOld){
       tcountOld = tcount; // prevent multiple messages with the same content
       sendMessage(tcount);
      }
    }
  }
  tcount =0;
  fill(255,0,0);
  ellipse(x_, y_,20,20);

}

void sendMessage(int message_) {
  OscMessage myMessage = new OscMessage("/test");
  myMessage.add(message_);
  oscP5.send(myMessage, myRemoteLocation); 
  println("standard sketch, sending to "+myRemoteLocation + "message: " + message_);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
  //background(random(255));  
  if (theOscMessage.checkAddrPattern("/wy")==true) {
    wy = theOscMessage.get(0).floatValue();
    //println(" med : "+ med);
    return;
  }
}
