class Player {
  int x = width/2;
  int y = height-300;
  int xvel = 0;
  int yvel = 0;



  Player() {
  }

  void dPlayer() {
    fill(255, 0, 0);
    rect(x, y-blocky, 20, 20);
  }

  void playerPhys() {
    y = y+yvel;
    x = x+xvel;
    int indexX = x/blockx;
    int indexY = y/blocky;
    if (currentScreen.screen[indexX][indexY] == 0) {
      yvel++;
    } else {
      yvel = 0;
      y = indexY*blocky;
      ellipse(indexX*blockx, indexY*blocky, 5, 5);
    }
  }
}
