class Screen {
//array for level grid
  int[][] screen = new int[screen_dimension][screen_dimension];
//gets the paint file
  Screen(String p) {
    PImage data = loadImage(p);
    for (int i = 0; i < screen_dimension; i++) {
      for (int j = 0; j < screen_dimension; j++) {

        //////////////
        // 0 = nothing
        // 1 = thing
        // 2 = death
        //////////////

        if (data.get(i, j) == color(0, 0, 0)) {
          screen[i][j] = 1;
        } else if (data.get(i, j) == color(255, 0, 0)) {
          screen[i][j] = 2;
        }
      }
    }
  }
//drawing the blocks
  void d() {
    for (int i = 0; i < screen_dimension; i++) {
      for (int j = 0; j < screen_dimension; j++) {
        if (screen[i][j] == 1) {
          fill(0);
          rect(i*(blockx), j*(blocky), (blockx), (blocky));
        } else if (screen[i][j] == 2) {
          fill(255, 0, 0);
          rect(i*(blockx), j*(blocky), (blockx), (blocky));
        }
      }
    }
  }
}
