boolean[] keys = new boolean[1024];

class Player {
  int x = height/2;
  int y = height-300;
  int velx = 0;
  int vely = 0;
  boolean grounded;



  Player() {
  }

  void dPlayer() {
    fill(255, 0, 0);
    rect(x, y-blocky, blockx, blocky);
  }

  void playerPhys() {
    y = y+vely;
    x = x+velx;
    int indexX = x/blockx;
    int indexY = y/blocky;
    
    if (velx < 0 && grounded == true) {
      velx += 1;
    } else if (velx > 0 && grounded == true) {
      velx -= 1;
    }
    if (currentScreen.screen[indexX][indexY] == 0) {
      grounded = false;
      vely++;
    } else {
      vely = 0;
      y = indexY*blocky;
      grounded = true;
    }
    if (currentScreen.screen[indexX  ][indexY-1] == 1) {
      velx = 0;
      x = (indexX+1)*blockx;
    } else if (currentScreen.screen[indexX+1][indexY-1] == 1) {
      velx = 0;
      x = indexX*blockx;
    }
  }

  void playerCtrl() {
    if (keys[65] == true && grounded == true) {    
      velx -= 2;
    }
    if (keys[68] == true && grounded == true) {
      velx += 2;
    }
  }
}

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
