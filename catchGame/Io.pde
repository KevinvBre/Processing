class Io {
  // variabelen
  int x_loc;
  int y_loc;
  int x_speed;
  int body_h;
  int body_w;
  int setspeed;

  //color 
  float c; 
  Io(float c_parameter) {
    c = color(c_parameter);

    //Values
    body_h = 10;
    body_w = int(random(50, 175));
    setspeed= 10;
  }

  void display() {  
    y_loc = height-90; //Start height from bottom
    rectMode(CENTER);
    rect(x_loc, y_loc, body_w, body_h); // Draw a square with vars
  }

  void beweeg() { 
    int afstand; // Var for distance
    afstand = mouseX  - x_loc; // Find the value between afstand and mouseX
    x_loc = x_loc + afstand/setspeed; // Create awesome  movement with the given values
  } 
  int GetX () {
    return x_loc;
  }
}

