class game_setup {

  void display() {
    size(780, 420);

    maakvogels = new gen_birds();
    maakontploffing = new gen_explosie();
    items = new static_items();

    RaakMis = new ArrayList();
    nest = new Io(150);
    img = loadImage("bg.jpg");
    imgend = loadImage("bgend.jpg");
    raakofmis = new raakmis();
    font = loadFont("Verdana-48.vlw");



    Wolk_in_beeld = new ArrayList();
    for (int i=0;i<1;i++) { // loop om ArrayList te vullen
      Wolk_in_beeld.add(new gen_clouds()); // Nieuwe Nio in ArrayList stoppen
    }

    hoeveelPlaatjes = 90;
    welkPlaatjeIsZichtbaar = 0;
   
    //Nio arraylist
    Nios_in_beeld = new ArrayList();   
    explosies_in_beeld = new ArrayList();
    for (int i=0;i<1;i++) {
      Nios_in_beeld.add(new Nio());
      hoeveelPlaatjes= 50;
      ExplosiePlaatjes_main = new PImage[hoeveelPlaatjes];
    }
    for (int i=0;i<hoeveelPlaatjes;i++) {
      String filenaam = "explosie/explosion1_" + nf(i+1, 4) + ".png";
      ExplosiePlaatjes_main[i] = loadImage(filenaam);
    }
  }
}

