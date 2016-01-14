class gen_cirkel {
  float size = 45;
  circle_body circle; // geheugenruimte inruimen voor Nio_body-vorm 

  gen_cirkel() {
    circle = new circle_body(); // ingeruimde geheugenruimte vullen met Nio_body vorm
  }

  void display(int nioIndex, float dx, float dy) {      
    //snelheid van vergroten
    size = size*1.05;      

   
    //Weergeven
    circle.display(size, dx, dy, nioIndex);
   //Verwijder alles wat te groot word
    if (size > width + afstand) {
      tunnel_cirkels.remove(nioIndex);
    }
  }
}
