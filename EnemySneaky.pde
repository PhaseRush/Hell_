class EnemySneaky extends Enemy {

  EnemySneaky() {
    super();
    speed = 2;
  }

  void update() {
    y = y + vy;

    fill(#11F2F0);   
    ellipse(x, y, w, h);


    if (sft.x > x) {
      x = x + 0.5;
    } else {
      x = x - 0.5 ;
    }
    if (y > height) {
      scr.score --;
    }
  }

  void fire() {
    if (frameCount % 75 ==0) {

      if (sft.y < y) {
        Bullet b = new Bullet(x, y, 90, 10, false);
        bulletManager.add(b);
      } else {
        Bullet b = new Bullet(x, y, 270, 10, false);
        bulletManager.add(b);
      }
    }
  }
}
