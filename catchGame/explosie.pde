class explosie {
  int welkplaatjeIsZichtBaar;
  int x_loc;
  explosie(int x_locNio) {
    x_loc = x_locNio;
  }
  void display() {
    welkplaatjeIsZichtBaar++;
    imageMode(CORNER);

    image(ExplosiePlaatjes_main[round(welkplaatjeIsZichtBaar)], x_loc, height-50);
    if (welkplaatjeIsZichtBaar<hoeveelPlaatjes-1) {
      welkplaatjeIsZichtBaar+= 0.01;
    }
    else {
      welkplaatjeIsZichtBaar = 0;
      ExplosieKlaar();
    }
  }
}

