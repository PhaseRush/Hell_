class Asteroid extends Star {

  float w, h, r, g, b, alpha;
  
  Asteroid() {
    y = random(height);    
    x = random(width);
    w = random(10, 25);
    h = w;
    
    speed = random(0.1, 10);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    alpha = random(50, 255);
  }

  void update () {
    noTint();
    image(planet, x, y, w, h);
    //fill(r, g, b, alpha);
    //ellipse(x, y, w, h);
    y = y + speed;
    if (y > height) {
      y = 0;  
      x = random(width);
    }
  }
}
