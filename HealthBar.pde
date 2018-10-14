class HealthBar {
  //"hlbr"

  float x, y, w, h, score, r, g, b, alpha;
  color colour;

  HealthBar() {
    rectMode(CENTER);
    x = width/2;
    y = height - 75;
    w = 550;
    h = 25;
    colour = #FFFFFF;
    alpha = 255;

    
  }

  void update() {
  
    
    if (gamestate == PLAYING) {
      fill(colour, alpha);
      rect(x, y, w, h);
    } else {
      println("gamestate ≠ PLAYING");
    }
    
    
  }
}
