class StarBig extends Star {

  float w, h, r, g, b, alpha, rotate, rotAng;

  StarBig() {
    y = random(height);    
    x = random(width);
    w = random(25, 125);
    h = w;

    speed = random(0.1, 10);
    r = random(0, 255);
    g = random(0, 255);
    b = random(0, 255);
    alpha = random(50, 255);
    
    //Rotate stuff
    rotate = 0;
    rotAng = random (0.1, 10);
  }

  void update (){
    noTint();
    
    
    rotate += .01;
    rotate += rotAng;
    
    //Pic of asteroid (rotating)
    imageMode(CENTER);
    pushMatrix();
    translate(x, y);   
    rotate(rotate);
    image(asteroid, 0, 0, w, h);
    popMatrix();
    imageMode(CORNER);





    //Pic of planet(purple)
    //image(planet, x, y, w, h);

    y = y + speed;
    if (y > height) {
      y = 0;  
      x = random(width);
    }
  }
}
