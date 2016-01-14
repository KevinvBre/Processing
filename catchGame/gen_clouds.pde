class gen_clouds {
  // variabelen
  int x_loc; 
  int y_loc;
  int x_speed;
  int y_speed;
  int body_h;
  int body_w;
  int valkapot;
  int scale_param;

  cloud_body wolk; // geheugenruimte inruimen voor Nio_body-vorm 


  gen_clouds() {
    wolk = new cloud_body(); // ingeruimde geheugenruimte vullen met Nio_body vorm


    //Values
    x_loc = -100; 
    y_loc = int(random (height-200)); 

    x_speed = int(random(1, 3));

    body_h = 15; // for inmpact
    body_w = 15; 
  }

  void display() {  
    //display values and pass on to limb
    wolk.display(x_loc, y_loc);
  }

  void beweeg(int nioIndex) { 
    // Set speed 
    x_loc = x_loc + x_speed;         
        
    if (y_loc>width) {
      Wolk_in_beeld.remove(nioIndex);
    }
    
    
  }
}

