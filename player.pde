boolean[] keys = new boolean[1024];

class Player {
  int x = height/2;
  int y = height-300;
  int xvel = 0;
  int yvel = 0;
  boolean grounded;



  Player() {
  }

  void dPlayer() {
    fill(255, 0, 0);
    rect(x, y-blocky, blockx, blocky);
  }

  void playerPhys() {
    y = y+yvel;
    x = x+xvel;
    int indexX = x/blockx;
    int indexY = y/blocky;
    
    if (xvel < 0 && grounded == true) {
      xvel += 1;
    } else if (xvel > 0 && grounded == true) {
      xvel -= 1;
    }
    if (currentScreen.screen[indexX][indexY] == 0) {
      grounded = false;
      yvel++;
    } else {
      yvel = 0;
      y = indexY*blocky;
      grounded = true;
    }
    if (currentScreen.screen[indexX  ][indexY-1] == 1) {
      xvel = 0;
      x = (indexX+1)*blockx;
    } else if (currentScreen.screen[indexX+1][indexY-1] == 1) {
      xvel = 0;
      x = indexX*blockx;
    }
  }

  void playerCtrl() {
    if (keys[65] == true && grounded == true) {    
      xvel -= 2;
    }
    if (keys[68] == true && grounded == true) {
      xvel += 2;
    }
  }
}

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
