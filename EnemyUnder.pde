class EnemyUnder extends Enemy {

  EnemyUnder() {
    super();
    vy = 2.5;
    r = 2;
    y = height;
  }

  void update() {
    y = y - vy;

    fill(#FAFF03);
    rect(x, y, w, h, r);
    if (y < 0) {
      println("Enemy Under.x <0");
      scr.score --;
    }
  }

  void fire() {

    if (frameCount % 50 == 0) { 
      Bullet b = new Bullet(x, y, 90, 5, false);
      bulletManager.add(b);
    }
  }
}
