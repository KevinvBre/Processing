class cloud_body {
  PImage img;
  cloud_body() {
    img = loadImage("wolkje.png");
  }


  //Retrieve var values and use them to draw 
  void display(int x_loc_param, int y_loc_param) {
    imageMode(CENTER);
    image(img, x_loc_param, y_loc_param);
  }
}

