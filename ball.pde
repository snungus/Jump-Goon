class Ball {
  int x = height/2;
  int y = height-300;
  int xvel = 10;
  int yvel = 0;
  boolean grounded;
  int ballSize = 10;



  Ball() {
  }

  void dBall() {
    fill(0, 0, 255);
    ellipse(x, y, ballSize, ballSize);
  }

  int stateOfIndex(int indexX, int indexY) {
    if (indexX >= 25 || indexX < 0 || indexY >= 25 || indexY < 0) {
      return -1;
    }
    return currentScreen.screen[indexX][indexY];
  }

  void ballPhys() {
    y = y+yvel;
    x = x+xvel;
    int indexX = x/blockx;
    int indexY = y/blocky;
    if (x > (screen_dimension*blockx)) {
      xvel *= -1;
      x = screen_dimension*blockx;
      indexX = x/blockx;
    }
    int currentBlock = stateOfIndex(indexX, indexY);
    int bottomBlock = stateOfIndex(indexX, indexY-1);
    //bottom collision
    if (currentBlock == 0) {
      grounded = false;
      yvel++;
    } else {
      yvel = 0;
      y = indexY*blockx;
      grounded = true;
    }
    if (bottomBlock == 1) {
      xvel*=-0.5;
      x = (indexX+1)*blockx;
    } else if (bottomBlock == 1) {
      if (x % blockx == 0 && x > (indexX*blockx) && x < ((indexX+1)*blockx)) {
        xvel*=-0.5;
        println("kill me");
      }
    }
  }
}
