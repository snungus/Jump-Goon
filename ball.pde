class Ball {
  int x = height/2;
  int y = height-300;
  int xvel = 10;
  int yvel = 10;
  boolean grounded;
  int ballSize = 10;



  Ball() {
  }

  void dBall() {
    fill(0, 0, 255);
    ellipse(x, y, ballSize, ballSize);
  }

  void ballPhys() {
    y = y+yvel;
    x = x+xvel;
    int indexX = x/blockx;
    int indexY = y/blocky;
    
    if (currentScreen.screen[indexX][indexY] == 0) {
      grounded = false;
      yvel++;
    } else {
      yvel = 0;
      y = indexY*blockx;
      grounded = true;
    }
    if (currentScreen.screen[indexX][indexY-1] == 1) {
      xvel*=-0.5;
      x = (indexX+1)*blockx;
    } else if (currentScreen.screen[indexX+1][indexY-1] == 1) {
      xvel*=-0.5;
      x = indexX*blockx;
    }
  }
}
