class Starfighter {
  float x, y, w, h, r, vx, vy, j;
  float clock;

  boolean hasPerished;
  int Cnum;

  Starfighter() {
    w = 25;
    h = 25;
    r = 7;
    x = width/2;
    y = height  /2;
    hasPerished = false;

    clock = 0;
  }

  void clockUpdate() {
    if (frameCount % 1 == 0) {
      clock++;
    }
  }

  //Make my ship die AND GAMESTATE == GAMEOVER
  void checkCollisions(Bullet b) {
    if (rectBall(x, y, w, h, b.x, b.y, b.w) && b.good == false) {

      //println("Sft_Hit");
      b.alive = false;


      //HealthBar stuff
      hlbr.w = hlbr.w - 22;


      if (hlbr.w <= 155) {
        hlbr.colour = #FF0000;
      } 

      Explosion exp = new Explosion(sft.x, sft.y);
      explosionManager.add(exp);

      j++;
    }
    if (j == 25) {
      //println("SHOULD GO TO GAMEOVER SCREEN");
      gamestate = GAMEOVER;
      j = 0;
      clock = 0;
      hlbr.w = 550;
    }
  }

  void show() {
    fill(#C14286);
    rectMode(CENTER);
    rect(x, y, w, h, r);
  }

  void move() {

    x = x+1.2*vx;
    y = y+1.2*vy;

    vx = vx * 0.95;
    vy = vy * 0.95;

    //println(vx);
  }
  void handleImput() {
    if (kbd.holdingLeft || kbd.holdingA ) {

      // println("L");
      vx--;
      vx = max(vx, -3);

      if (x <=0) {
        x = width;
      }
    }

    if (kbd.holdingRight || kbd.holdingD) {
      // println("R");
      vx++;
      vx = min(vx, 3);
      if (x >= width) {
        x =0;
      }
    }

    if (kbd.holdingUp || kbd.holdingW ) {

      // println("U");
      vy--;
      vy = max(vy, -3);

      if (y <=0) {
        y = height;
      }
    }

    if (kbd.holdingDown || kbd.holdingS) {
      //println("D");
      vy++;
      vy = min(vy, 3);
      if (y >=height) {
        y = 0;
      }
    }

    if (kbd.holdingSpace || mousePressed) {

      if (frameCount % 5 == 0) {
        float bearing = -atan2(mouseY - y, mouseX - x);

        bearing = map(bearing, 0, TWO_PI, 0, 360);
        Bullet b = new Bullet(x, y, bearing, 20, true);

        bulletManager.add(b);

        Pewpew.rewind();
        Pewpew.play();
      }
    }
    if (kbd.holdingE) {
      if (frameCount %25 ==0) {
        Bullet b = new Bullet (sin(y) + sft.x, y, 90, 20, true);
        bulletManager.add(b);
      }
    }

    if (kbd.holdingQ) {

      for (int i = 0; i <360; i = i + 1) {
        if (frameCount %150 ==0) {
          Bullet b = new Bullet(x, y, i, 15, true);
          bulletManager.add(b);


          PewpewQ.rewind();
          PewpewQ.play();
        }
      }
    }

    if (kbd.holdingP) {
      gamestate = PAUSE;
      println("PAUSED");
    }
    //    if (kbd.holdingR) {
    //      gamestate = PLAYING;
    //      println("PLAYING");
    //    }
  }
}
