class Screen {

  int[][] screen = new int[screen_dimension][screen_dimension];

  Screen(String p) {

    PImage data = loadImage(p);

    for (int i = 0; i < screen_dimension; i++) {

      for (int j = 0; j < screen_dimension; j++) {

        //////////////
        // 0 = nothing
        // 1 = thing
        //////////////

        if (data.get(i, j) == color(0, 0, 0)) {
          screen[i][j] = 1;
        }
      }
    }
  }

  void d() {
    for (int i = 0; i < screen_dimension; i++) {

      for (int j = 0; j < screen_dimension; j++) {

        if (screen[i][j] == 1) {
          fill(0);
          rect(i*(width/screen_dimension), j*(height/screen_dimension), (width/screen_dimension), (height/screen_dimension));
        }
      }
    }
  }
}
