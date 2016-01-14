ArrayList tunnel_cirkels;
int counter =  0;
float size = 45; 

//Get window size from
//Credit for J.R. Bergen for putting formule on paper
float ruwafstand = size*size + (height/2)*(height/2);
float afstand = sqrt(ruwafstand);

void setup() {
  size(displayWidth, displayHeight, P3D);
  tunnel_cirkels = new ArrayList();
  for (int i=0;i<1;i++) {
    tunnel_cirkels.add(new gen_cirkel());
  }
}

void draw() {
  //mouse trace for movement
  float dy = dist(0, mouseY, 0, height/2);   //Find distance between mouseY and middle 
  float dx = dist(mouseX, 0, width/2, 0);    //Find distance between mouseX and middle 
  //fix negative nummber for right and bottom
  if (mouseX >= width/2) {dx = (dx*-dx)/dx;}
  if (mouseY >= height/2){dy = (dy*-dy)/dy;}     

  //Camera 
  camera(mouseX, mouseY, (height/4) / tan(PI/6), mouseX, mouseY, 0, 0, 1, 0);
  translate(width/2, height/2, +100);

  //setup basics
  background(110);
  stroke(110);
  noFill();
  
  //Lines
  line(width*2, -height*2, dx+15, dy-15);
  line(-width*2, -height*2, dx-15, dy-15);
  line(-width*2, height*2, dx-15, dy+15);
  line(width*2, height*2, dx+15, dy+15);
  
  counter++; // count frames
  if (counter == 12) { //60frames a sec so fix 5 each sec
    tunnel_cirkels.add(new gen_cirkel()); // Add cirkel to array
    counter = 0; //Reset counter
  }

  for (int i=0;i<tunnel_cirkels.size();i++) {
    gen_cirkel cirkel_temp = (gen_cirkel) tunnel_cirkels.get(i);
    cirkel_temp.display(i, dx, dy);
  }
  println(tunnel_cirkels.size());
}
