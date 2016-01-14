class circle_body {
  void display(float size, float param_x, float param_y, int nioIndex) {
    imageMode(CENTER);

    //Set color set
    color[] mycolours = {
      color(120, 120, 120), 
      color(110, 110, 110), 
      color(100, 100, 100), 
      color(90, 90, 90), 
      color(80, 80, 80), 
      color(70, 70, 70), 
      color(60, 60, 60)
    };
    //get nioIndex and use that for the color
    color fillkleur = mycolours[nioIndex] ;

    fill(fillkleur);
    noStroke();

    ellipse(param_x, param_y, size, size);
  }
}

