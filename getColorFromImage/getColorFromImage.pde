PImage img;

void setup() {
  size(680, 680);
  img = loadImage("mondriaan-victoryboogiewoogie.jpg");
}



void draw() {
  color c;
  c = 0;
  c = get(pmouseX, pmouseY);
  fill(c);


  image(img, 0, 0);  
 // filter(GRAY);
  
  
  //Z-index boven houden
  rect(0, 0, 50, 50);
}
