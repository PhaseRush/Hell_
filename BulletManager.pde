class BulletManager {

  ArrayList<Bullet> bullets;
  //Bullet[] bullets;

  BulletManager() {
    bullets = new ArrayList<Bullet>();
    //bullets = new Bullet[n];
  }

  void update() {
    int i = bullets.size()-1;
    while (i >= 0) {

      Bullet b = bullets.get(i);

      if ( b.hasPerished()) {
        bullets.remove(i);
      }
      enemyManager.checkCollisons(b);
      sft.checkCollisions(b);
      //bullets[i] 
      b.show();
      b.move();
      i = i-1;
    }
  }

  void add(Bullet b) {
    bullets.add(b);
  }
}
