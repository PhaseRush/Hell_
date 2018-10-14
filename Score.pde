class Score {

  int x, y, w, h, score;

  Score() {
    rectMode(CORNER);

    x = 25;
    y = 30;
    w = 90;
    h = 50;

    score = 0;
  }


  void update() {
    fill(#F5A23B);
    text(score, x-10, y+10);
  }
}
