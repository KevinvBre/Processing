class raakmis {

  void display(int nioX, int nioIndex) {
   
  int IOX = nest.GetX();
  if (abs (IOX - nioX) < 50) { 
    RaakMis.add("raak");
  }
  else {
    RaakMis.add("mis");
    explosies_in_beeld.add(new explosie(nioX));
    ExplosieSound.trigger();
  } 
  println(RaakMis);//String weergeven wat raak of mis was
  Nios_in_beeld.remove(nioIndex);
}

}

