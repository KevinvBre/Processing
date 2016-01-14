class Nio_limb {
  //Vars
  color c;
  float x_loc;
  float y_loc;
  float hoek;
  float rotatie;
  PImage img;

  Nio_limb() {
    //Set Values
    hoek = 120;
    rotatie = 1.5;
    img = loadImage("hoofd.png");
  }
  //Retrieve values from Nio so code can be used for both Limbs.
  void display(int x_loc_param, int y_loc_param, int body_w_param, int body_h_param, int scale_param) {
    body_h_param = 10;
    rectMode(CENTER);// Fix corner
    pushMatrix();//Set rotate
    translate(x_loc_param, y_loc_param);
    rotate(hoek);
    scale(scale_param, 1.0);
    imageMode(CENTER);
    image(img, body_w_param, body_h_param);

    popMatrix();//End Set rotate
  }   

  void draai(float rotatie_speed_param) {
    rotatie += rotatie_speed_param; //Get speed from Nio
    hoek = sin(rotatie)*0.3;
  }
}


