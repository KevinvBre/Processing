class game_end {

  void display() {
    background(imgend);
    for (int i=0;i<RaakMis.size();i++) {
      String woord = (String)RaakMis.get(i);
      if (woord=="mis") {
        Spelverloop += "mis\n";
      }
      else if (woord == "raak") {
        Spelverloop += "raak\n";
        volume++;
      }
      //hoogte van volume bepalen
      volume = (volume*2)-10;              
      ApplauseSound.play();
      textFont(font, 16);
    }
    //tekst weergeven
    text(Spelverloop, 100, 50);
    ApplauseSound.setGain(4);
  }
}

