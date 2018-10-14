class Explosion {
  float x, y, w, h, vx, vy, r, g, b, alpha;
  boolean hasPerished;

  Explosion(float _x, float _y) {
    x = _x;
    y = _y;
    w = random (2, 4);
    h = w;
    vx = random (-6, 6);
    vy = random (-6, 6);

    r= random (10, 250);
    b= random (10, 250);
    b= random (10, 250);
    alpha = 255;
  }

  void update() {
    fill(r, g, b, alpha);
    rect(x, y, w, h);

    alpha = alpha - 5;
    x =x + vx;
    y =y + vy;
  }

  boolean hasPerished() {
    if (x>width|| x <0|| y<0 ||y>height) { //add lifespan
      return true;
    } else {
      return false;
    }
  }
}
