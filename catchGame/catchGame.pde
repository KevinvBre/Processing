//Var voor geluid import
import ddf.minim.*;
Minim minim;
AudioSample ExplosieSound;
AudioPlayer ApplauseSound;

//Game control
Boolean ShowEnd = false;

//Var voor nios
ArrayList RaakMis, Nios_in_beeld, Wolk_in_beeld;
int nieuwe_Nio_timer = int (random(1, 180)), revspeed, teller = 0;
int nieuwe_Cloud_timer = int (random(1, 180)), tellerCloud = 0;

//Var voor explosie
ArrayList explosies_in_beeld;
PImage img;
PImage imgend;
PImage[] explosieArray;
PImage[] ExplosiePlaatjes_main;
float welkPlaatjeIsZichtbaar, volume;
int x_loc, hoeveelPlaatjes, nioIndex;

//Var voor game end
PFont font;
String Spelverloop = "";

//TABS
game_setup game_instelingen;
Io nest; 
game_end speleinde; 
explosie knal;
gen_birds maakvogels;
gen_explosie maakontploffing;
raakmis raakofmis;
static_items items;

void setup() {
  game_instelingen = new game_setup();// instellingen inladen
  game_instelingen.display();  //instellingen weergeven
  
  //Sound vullen
  minim = new Minim(this);
  ExplosieSound = minim.loadSample("bomb.mp3", 1024);
  ApplauseSound = minim.loadFile("eindbliep.mp3", 1024);
}

void draw() { // Render game
  if (RaakMis.size()<10) {
    background(img);//achtergrond plaatje
    maakvogels.display();//De vogels
    maakontploffing.display();//De explosies
    nest.display();//Het vang geval weergeven
    nest.beweeg();//Het vang geval bewegen
    items.displayrij();
    items.displayborder();
    items.displaypubliek1();
    items.displaypubliek2();
    items.displaypubliek3(); 
    items.beweeg();
    items.displaylight();
 }
  else {
    if (speleinde == null) {          //Spel eind heeft alleen nog ruimte met NULL
      speleinde = new game_end();     //Spel ruimte is nu 1..
      speleinde.display();            //Dus dit komt maar 1x
    }
  }
}


void raakmis(int nioX, int nioIndex) {
  raakofmis.display(nioX, nioIndex); //posities doorgeven voor bepalen raakmis
}

void ExplosieKlaar() {
  explosies_in_beeld.remove(nioIndex); // Als ontploffing klaar is remove het
}

void stop()
{
  ApplauseSound.close();
  ExplosieSound.close();
  minim.stop();
  super.stop();
}
