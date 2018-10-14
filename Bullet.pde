class Bullet {

  float x, y, vx, vy, w, h, v, colour;
  boolean good;
  boolean rectBall;

  boolean alive;

  Bullet(float x, float y, boolean g) {
    //this.x/y is the instance var
    alive = true;
    good = g;
    this.x = x;
    this.y = y;
    vx = 0;
    vy = -10;
    w = random(3, 15);
    h = random(3, 15);
  }

  //  Bullet(float x, float y, float angle, float v, boolean g) {
  //    this.x = x;
  //    this.y = y;
  //    good = g;
  //    w = 15;
  //    h = 15;
  //    fill(colour);
  //    angle = map(angle, 0, 360, 0, TWO_PI);
  //    alive = true;
  //
  //    vx = cos(angle) * v;
  //    vy = -sin(angle) * v;
  //  }

  Bullet(float x, float y, float angle, float v, boolean g) {
    noTint();
    image(laser, x, y, w, h);
    this.x = x;
    this.y = y;
    w = 10;
    h = 15;
    alive = true;
    good = g;

    angle = map(angle, 0, 360, 0, TWO_PI);

    vx = cos(angle) * v;
    vy = -sin(angle) * v;
  }

  void show() {
    if (good) {
      fill(#1EA227);
    } else {
      fill(255);
    }
    ellipse(x, y, w, h);
  }


  void move() {
    x = x+vx;
    y = y+vy;
  }

  boolean hasPerished() {
    if (!alive || x>width|| x <0|| y<0 ||y>height) {
      return true;
    } else {
      return false;
    }
  }
}
