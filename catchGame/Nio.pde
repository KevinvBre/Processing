class Nio {
  // variabelen
  int x_loc; 
  int y_loc;
  int x_speed;
  int y_speed;
  int body_h;
  int body_w;
  int valkapot;
  int scale_param;

  Nio_body Lichaam; // geheugenruimte inruimen voor Nio_body-vorm 
  Nio_limb Vleugel; // geheugenruimte inruimen voor vleugel1-vorm 

  Nio() {
    Lichaam = new Nio_body(); // ingeruimde geheugenruimte vullen met Nio_body vorm
    Vleugel = new Nio_limb(); // ingeruimde geheugenruimte vullen met vleugel1 vorm


    //Values
    x_loc = int(random (width)); 
    y_loc = 30;

    x_speed = int(random(1, 10));
    y_speed = int(random(1, 10));

    body_h = 15; // for inmpact
    body_w = 15; 

    valkapot = 30;
  }

  void display() { 
   if(x_loc < width/2){
        scale_param = int(1.0);
   }else{
        scale_param = int(-1.0);
   }
    
    //display values and pass on to limb
    Vleugel.display(x_loc, y_loc, body_w, body_h, scale_param); 
    Lichaam.display(x_loc, y_loc+35, body_w, body_h, scale_param);
  }

  void beweeg(int nioIndex ) { 
    //contain with in screen
    if (x_loc<0 || x_loc>width) {
      x_speed = x_speed * -1;
    }
    if (y_loc<0) {
      y_speed = y_speed * -1;
    }

    // Set speed 
    x_loc = x_loc + x_speed;        
    y_loc = y_loc + y_speed;

    //Set draai
    Vleugel.draai(0.3); 

    //Hit test
    if (y_loc > height -100) {
      raakmis(x_loc, nioIndex);
    }
  }
}

