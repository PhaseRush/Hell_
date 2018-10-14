Bullet bullet;
Starfield starfield;
Keyboard kbd;
BulletManager bulletManager;
Starfighter sft;
AudioPlayer player;
Minim minim;
Enemy e;
Score scr;

HealthBar hlbr;


EnemyManager enemyManager;
ExplosionManager explosionManager;
//Pause pause;

PImage imgINTRO;
PImage imgGAMEOVER;
PImage planet;
PImage asteroid;
PImage laser;


//Audio Player




int rx, ry, rw, rh, bx, by, d, i, gamestate;
int tx, ty, tw, th; //Button vars

String s = "Click to play again";
float j, clock;
boolean rectBall;

//font
PFont f;

final int PAUSE = 0;
final int INTRO = 1;
final int PLAYING = 2;
final int GAMEOVER = 3;
//final int width = 1366; //home comp
//final int height = 768; //home comp
final int width = 1440; // school comp
final int height = 900; // school comp


//AudioPlayer
AudioPlayer Pewpew;
AudioPlayer ActionMusic;
AudioPlayer PewpewQ;

void setup() {
  f = loadFont("Decibel-48.vlw");

  frameRate(60);
  noStroke();
  size(displayWidth, displayHeight, P2D);
  //sketchFullScreen();
  rectMode(CENTER);
  gamestate = INTRO;

  j = 100;

  kbd = new Keyboard();
  starfield = new Starfield();
  bulletManager = new BulletManager();
  sft = new Starfighter();
  enemyManager = new EnemyManager();
  explosionManager = new ExplosionManager();

  scr = new Score();
  hlbr = new HealthBar();

  minim = new Minim(this);

  imgINTRO = loadImage("IntroScreen.png");
  imgGAMEOVER = loadImage("Game over.png");
  planet = loadImage("planet.png");
  asteroid = loadImage("asteroid.png");
  laser = loadImage("laser.png");

  //Button stuff
  tx = width/2;
  ty = height/2 + 250;
  tw = 400;
  th = 100;

  //Audio
  Pewpew = minim.loadFile("Electric.wav");
  ActionMusic = minim.loadFile("Action Music.mp3", 128);
  PewpewQ = minim.loadFile("Laser Gun.mp3");

  ActionMusic.play();
  ActionMusic.loop();

  //CLOCK SETTINGS!!!
  //Now in Starfighter class
}



void draw() {
  if (gamestate == INTRO) {
    drawIntroScreen();
  } else if (gamestate == PLAYING) {
    drawGame();
  } else if (gamestate == GAMEOVER) {
    drawEndScreen();
  } else if (gamestate == PAUSE) {
    drawPauseScreen();
  } else {
    println("Gamestate == BROKEN");
  }
}

void drawIntroScreen() {
  tint(255, 255, 255, 10);
  image(imgINTRO, 0, 0);

  textSize(56);
  textFont(f);
  text("Generik      Name", width/2, height/2);
  textSize(25);
  text("Click   to   play", width/2 + 150, height/2 +50);


  if (mousePressed) {
    gamestate = PLAYING;
    println("mousePressed!");
  }
}


void drawGame() {

  fill(#000000);
  rect(width/2, height/2, width, height); 

  fill(0, 80);
  rect(1000, 1000, 10000, 10000);
  starfield.show();
  bulletManager.update();
  sft.show();
  sft.move();
  sft.handleImput();  
  sft.clockUpdate();  

  //HealthBar
  hlbr.update();

  //Score
  scr.update();



  //Manager Update
  enemyManager.update();
  explosionManager.update();

  //Slowly add number of enemies per time
  if (sft.clock % 25 == 0 && j >0) {
    j = j - 0.5;
    println(j, "frames per enemy");
  }



  if (sft.clock > 180) {

    if (sft.clock % j ==0) { 
      enemyManager.add(new Enemy());
    }
    if (sft.clock % j/2 ==0) {
      enemyManager.add(new EnemySneaky());
    }
    if (sft.clock % j/2 ==0) { 
      enemyManager.add(new EnemyFast());
    }
    if (sft.clock >= 900 && sft.clock % j/5 ==0) { 
      enemyManager.add(new EnemyUnder());
    }
  }
  //println(sft.clock);
  //println(scr.score);
}

void drawPauseScreen() {

  fill(255, 50);
  rect(0, 0, 10000, 10000);


  fill(#1BDE22);
  textFont(f);
  text("PRESS  MOUSE  TO  RESUME", width/2, height/2);
  text("Your score is "+ scr.score, width/2, (height/2)+ 50);
  fill(50);
  if (mousePressed) {
    gamestate = PLAYING;
  }
}


void drawEndScreen() {
  image(imgGAMEOVER, 0, 0, displayWidth, displayHeight);

  //Button for start over

  fill(#2EAD28);
  rect(tx, ty, tw, th);
  fill(#000000);
  textFont(f);
  text(s, tx + 30, ty+10, tw, th);
  text("Your score is "+ scr.score, tx - 160, ty + 40);

  if (mousePressed && mouseX>=(tx-tw/2) && mouseX <=(tx+tw/2) && mouseY>=(ty-th/2) && mouseY <=(ty+th/2)) {
    println("Button pressed!");
    hlbr.w = 550;
    gamestate = PLAYING;
    scr.score = 0;
  }
}

void keyPressed(KeyEvent evt) {
  kbd.pressKey(evt.getKeyCode());
}

void keyReleased(KeyEvent evt) {
  kbd.releaseKey(evt.getKeyCode());
}



boolean rectBall(float rx, float ry, float rw, float rh, float bx, float by, float d) {

  // first test the edges (this is necessary if the rectangle is larger
  // than the ball) - do this with the Pythagorean theorem

  // if ball entire width position is between rect L/R sides
  if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
    return true;
  }
  // if not, check if ball's entire height is between top/bottom of the rect
  else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
    return true;
  }

  // if that doesn't return a hit, find closest corner
  // this is really just a point, so we can test if we've hit it 
  // upper-left
  float xDist = (rx-rw/2) - bx;  // same as ball/ball, but first value defines point, not center
  float yDist = (ry-rh/2) - by;
  float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

  // upper-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry-rh/2) - by;
  float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceUR < shortestDist) {  // if this new distance is shorter...
    shortestDist = distanceUR;      // ... update
  }

  // lower-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLR < shortestDist) {
    shortestDist = distanceLR;
  }

  // lower-left
  xDist = (rx-rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLL < shortestDist) {
    shortestDist = distanceLL;
  }

  // test for collision
  if (shortestDist < d/2) {  // if less than radius
    return true;             // return true
  } else {                     // otherwise, return false
    return false;
  }
}
