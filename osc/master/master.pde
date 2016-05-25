
 
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

boolean background = true;


/*********  Variables and Booleans **********/
boolean debug = true,
        useOpenCvInput = false,
        useTobiiInput = false,
        useKeyboardOutput = false,
        useMouseOuput = false;

// PImage icon = loadImage("myicon.gif");
// frame.setIconImage((Image) icon.getNative());

float x,
      y;

void setup() {
  size(400,400);
  frameRate(25);
  
  
  oscP5 = new OscP5(this,12001); // talking too
  myRemoteLocation = new NetAddress("127.0.0.1",12001); //listening too
}


void draw() {
  
  if(background)
  background(0);  
  else
  background(200);  

}

void mousePressed() {
  /* in the following different ways of creating osc messages are shown by example */
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(123); /* add an int to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 
  
  

}

void keyPressed() {
   println("key");
  // launch("C://Program Files (x86)/Google/Chrome/Application/chrome.exe");
 //  launch("C://Program Files (x86)/Google/Chrome/Application/app/keyboard.exe");

 //  launch("C:\'app\'keyboard.exe");
   //launch();
   
   
   String[] params = { "C:/Users/Kevin/OneDrive/Werk/jan.nl/master_v1/osc/keyboard/application.windows32/keyboard", "-args" };
  //launch(params);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {

  print(" message: "+theOscMessage.addrPattern());
      background = !background;

}