class Nio_body {
  //vars
  color c;
  PImage img;
  Nio_body() {
    img = loadImage("benen.png");
  }


  //Retrieve var values and use them to draw 
  void display(int x_loc_param, int y_loc_param, int body_w_param, int body_h_param, int scale_param) {
    imageMode(CENTER); 
   image(img, x_loc_param, y_loc_param);

   
  }
}

