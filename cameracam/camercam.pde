import processing.video.*;

Capture video;
float selectedHue = 0;
void setup() {
  size(320, 240); 
  frameRate(60);

  video = new Capture(this, width, height);
  video.start();
  
}

void draw() {
  if (video.available()) {
    video.read();
    image(video, 0, 0); 
    background(0);
  }


  for (int x = 0; x < width; x = x=x+1) {
    for (int y = 0; y < height; y = y=y+1) {

      color kleur = video.get(width-x, y);

      float bri = brightness(kleur);
      float hue = hue(kleur);

      if (selectedHue == 0) {
        if (hue<10 || hue> 240) {
          set(x, y, kleur);
        }
      }
      else if (hue > selectedHue-20 && hue<selectedHue + 20) {
        set(x, y, kleur);
      }
    }
  }
}


void mousePressed() {
  color kleur = video.get(width-mouseX, mouseY);
  float hue = hue(kleur);
  selectedHue = hue(kleur);
  println(hue);
}

