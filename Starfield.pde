class Starfield {

  Star[] stars;
  int n= 100;

  Starfield() {
    stars = new Star[n];
    int i = 0;
    int p = 0;

    while (i < n) {
      float  rng = random(1,100);
      if (rng > 10) {
        stars [i] = new Star();
      }
      else {
        stars [i] = new StarBig();
      }
      i = i+1;
    }
  }

  void show() {
    for (int i = 0; i<n; i++) {
      stars[i].update();
    }
  }
}
