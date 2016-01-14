class static_items {
  int y_loc, x_loc, x_speed, y_speed;

  PImage imgrij, imgborder, imgpubliek1, imgpubliek2, imgpubliek3, imglight;
  static_items() {
    imgrij = loadImage("wachtrij-1.png");
    imgborder = loadImage("donkererand.png");
    imgpubliek1 = loadImage("publiek1.png");
    imgpubliek2 = loadImage("publiek2.png");
    imgpubliek3 = loadImage("publiek3.png");
    imglight = loadImage("light.png");
    
    x_loc = int(random (295, 310)); 
    y_loc = int(random (105, 115)); 

    x_speed = int(random(1, 2));
    y_speed = int(random(1, 2));
    
  }
  //Hier in staan alle items voor de game die eigenlijks niets doen behalve mooi zijn.
  void displayrij() {
    imageMode(CENTER);
    image(imgrij, 400, height-67);
  }
  void displayborder() {
    imageMode(CORNER);
    image(imgborder, 0, 24);
  }
  void displaylight() {
    imageMode(CORNER);
    image(imglight, 295, 10);
  }  
  
  void displaypubliek1() {
    imageMode(CORNER);
    image(imgpubliek1, 295, 105);
  } 
  void displaypubliek2() {
    imageMode(CORNER);
    image(imgpubliek2, x_loc, y_loc);
  } 
  void displaypubliek3() {
    imageMode(CORNER);
    image(imgpubliek3, 295, 115);
  }   
  
  void beweeg() { 
    if (x_loc<295 || x_loc>310) {
      x_speed = x_speed * -1;
    }
    if (y_loc<105 || y_loc>115) {
      y_speed = y_speed * -1;
    }
    
    x_loc = x_loc + x_speed;        
    y_loc = y_loc + y_speed;  
  }
  
}

