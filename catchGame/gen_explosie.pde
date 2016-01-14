class gen_explosie {

  void display() {
   for (int i = 0; i<explosies_in_beeld.size(); i++) {
      explosie explosie_temp= (explosie) explosies_in_beeld.get(i);
      explosie_temp.display();
    }
  }
}

