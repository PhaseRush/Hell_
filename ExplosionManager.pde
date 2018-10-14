class ExplosionManager {


  ArrayList<Explosion> explosions;


  ExplosionManager() {
    explosions = new ArrayList<Explosion>();
  }

  void update() {
    int i = explosions.size()-1;
    while (i >= 0) {
      Explosion exp = explosions.get(i);      
      if (exp.hasPerished()) {
        explosions.remove(i);
      } else {
        exp.update();
      }
      i = i-1;
    }
  }
  void add(Explosion exp) {
    explosions.add(exp);
  }
}
