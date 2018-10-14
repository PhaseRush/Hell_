class Enemy {


  float x, y, w, h, vx, vy, r, speed;
  boolean alive;
  Enemy() {
    y = 0;
    x = random(width);
    w = 25;
    h = w;
    vx = 2;
    vy = 2;
    speed = random(2, 4);
    alive = true;
  }

  void update () {
    fill(#D65959);
    rect(x, y, w, h);
    y = y + vy;


    //Take away score if enemy not killed!
    if (y > height) {
      scr.score  --;
    }
  }

  void fire() {
    if (frameCount % 75 ==0) {
      //      Bullet b = new Bullet(x, y, 270, 5, false);
      //      bulletManager.add(b);

      float bearing = -atan2 (sft.y - y, sft.x - x);
      bearing = map (bearing, 0, TWO_PI, 0, 360);

      Bullet b = new Bullet(x, y, bearing, 10, false);
      bulletManager.add(b);
    }
  }


  boolean hasPerished() {
    if (!alive) {
      return true;
    }
    if (x>width|| x <0||y>height) {
      return true;
    } else {
      return false;
    }
  }
}
