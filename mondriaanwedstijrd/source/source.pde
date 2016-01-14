//Kevin van Breemaat - Inzending Call For Code - www.kevinvanbreemaat.nl
PImage img;

void setup() {
  size(500, 500);
  img = loadImage("bron.jpg");
  colorMode(RGB, 255);
  noStroke();
  background(220, 220, 220);
}

//Random waardes voor snelheid en start positie(het leven is ook nooit hetzelfde)
int x_loc = int(random(0, width));
int y_loc = int(random(0, height));
int y_speed = int(random(21, 25));
int x_speed = int(random(15, 20));

void draw() {
  //Beweging in gang zetten
  if (x_loc<0 || x_loc>width) {
    x_speed = x_speed * -1;
  }
  if (y_loc<0 || y_loc>height) {

    y_speed = y_speed * -1;
  }
  x_loc += x_speed;        
  y_loc += y_speed;        

  //Kleur zoeken
  color c;
  c = img.get(x_loc, y_loc);           //Zoek kleur op x en y in img
  fill(c);


  //Grid maken
  int x_loc_pos = 0;                     //var voor x positie
  int y_loc_pos = 0;                     //var voor x positie 
  if (x_loc > 0 && y_loc > 0) {          //x/y meer dan 0 niet nodig om af te ronden want het is al 0
    int x_loc_param = (int)x_loc/25;     //x_loc delen door 25 output een tiental vanwege de int
    x_loc_pos = 25*x_loc_param;          //tiental * 25 geeft 25,50,75 etc
    int y_loc_param = (int)y_loc/25;    
    y_loc_pos = 25*y_loc_param;
  }

  int groote = int(random(1, 5));        // 20% kans op een groot blok
  int blokmaat;
  if (groote == 1) {
    blokmaat = 50;
  }else{
    blokmaat = 25;
  }

  //blokken tekenen
  rect(x_loc_pos, y_loc_pos, blokmaat, blokmaat);

  //kader/mask
  fill(255, 255, 255);
  triangle(0, 0, width/2, 0, 0, height/2);
  triangle(width/2, height, 0, height/2, 0, height);
  triangle(width, height, width, height/2, width/2, height);
  triangle(width, 0, width/2, 0, width, height/2);
}

