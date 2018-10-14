class Star {

  float x, y, v, speed;

  Star() {
    y = random(height);    
    x = random(width);
    speed = random(2, 4);
  }

  void update () {

    fill(random(124, 250), random(16, 196), random(6, 88));

    rect(x, y, speed, speed);
    y = y + speed;
    if (y > height) {
      y = 0;  
      x = random(width);
    }
  }
}
