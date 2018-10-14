class EnemyManager {

  ArrayList<Enemy> enemies;


  EnemyManager() {
    enemies = new ArrayList<Enemy>();
  }

  void update() {
    int i = enemies.size()-1;
    while (i >= 0) {
      Enemy b = enemies.get(i);
      if (b.hasPerished()) {
        enemies.remove(i);
      }
      b.update();
      b.fire();
      i = i-1;
    }
  }


  void add(Enemy b) {
    enemies.add(b);
  }


  void checkCollisons(Bullet b) {
    int i = enemies.size() - 1;
    while (i >= 0) {
      Enemy e = enemies.get(i); 
      if ((rectBall(e.x, e.y, 25, 25, b.x, b.y, b.w) && b.good == true) ) {
        e.alive = false;
        for (int j = 0; j < 10; j++) {
          Explosion exp = new Explosion(e.x, e.y);
          explosionManager.add(exp);
          scr.score ++;
        }
      }
      i--;
    }
  }
}
