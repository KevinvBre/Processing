class gen_birds {

  void display() {
  //Generate timer for random Birds.
    teller ++;
    if (teller == nieuwe_Nio_timer) {
      teller = 0;
      nieuwe_Nio_timer = int (random(1, 180));
      Nios_in_beeld.add(new Nio());
    }
    // Gebruik de timer en creer new birds
    for (int i=0;i<Nios_in_beeld.size();i++) {
      Nio nio_temp = (Nio) Nios_in_beeld.get(i);
      nio_temp.display();
      nio_temp.beweeg(i);
    }

    tellerCloud ++;
    if (tellerCloud == nieuwe_Cloud_timer) {
      tellerCloud = 0;
      nieuwe_Cloud_timer = int (random(1, 180));
      Wolk_in_beeld.add(new gen_clouds());
    }
    // Gebruik de timer en creer new birds
    for (int i=0;i<Wolk_in_beeld.size();i++) {
      gen_clouds cloud_temp = (gen_clouds) Wolk_in_beeld.get(i);
      cloud_temp.display();
      cloud_temp.beweeg(i);
    }



}

  
}

