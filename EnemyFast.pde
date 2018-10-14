class EnemyFast extends Enemy {

  EnemyFast() {
    super();
    vy = 7.5;
    r = 7;
  }

  void update() {
    y = y + vy;

    fill(#AFFA12);
    rect(x, y, w, h, r);


    if (sft.x > x) {
      x = x + 1.75;
    } else {
      x = x - 1.75 ;
    }
    if (y > height && scr.score >=0) {
      scr.score --;
    }
  }

  void fire() {

    if (frameCount % 5 == 0) { 
      Bullet b = new Bullet(x, y, 270, 15, false);
      bulletManager.add(b);
    }
  }
}
