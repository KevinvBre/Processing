void setup() {
  size(750, 250);
  background(0);   
  stroke(100);

  //weergeven van colors deze zat er zo al standaard in natuurlijk handig maar wilde hem eigenlijk net zo maken als bij de zwart wit..
  noStroke();
  colorMode(HSB, 100);
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      stroke(i, j, 100);
      point(i, j);
    }
  }
  //weergeven black and white
  int x_loc = 100;
  for (int tint = 0; tint < 255; tint++) {
    println(tint);
    noStroke();
    fill(tint);
    x_loc++; //Schuif pixel op
    rect(x_loc, 0, 1, 100); //plak volgende tint erin.
  }
}

void draw() {



  //Vars color picker
  color c;
  c = 0;
  //Afbankenen van colorpicker
  if (mousePressed && (mouseX < 200) && (mouseY < 100)) {
    c = get(pmouseX, pmouseY);
    fill(c);
    noStroke();
    rect(0, 100, 50, 50);
  }
  else if (mousePressed) {
    //Tekenen met de gekozen kleur
    c = get(10, 110);
    stroke(c);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void keyReleased() {
  if (key == 's') save("test.png") ;
  if (key == 'w') stroke(255);
  if (key == '+') strokeWeight(100);
  if (key == '-') strokeWeight(1);
}

