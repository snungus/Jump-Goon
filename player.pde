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
//falling mechanics  
  void fall() {
    if(y >= height-20) {
      screenNum--;
      currentScreen = world[screenNum];
      y -= height;
    }
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
    if (stateOfIndex(indexX, indexY) == 0) {
      grounded = false;
      vely++;
    } else {
      vely = 0;
      y = indexY*blocky;
      grounded = true;
    }
    if (stateOfIndex(indexX, indexY-1) == 1 || stateOfIndex(indexX, indexY-1) == 2) {
      velx = 0;
      x = (indexX+1)*blockx;
    } else if (stateOfIndex(indexX+1, indexY-1) == 1 || stateOfIndex(indexX+1, indexY-1) == 2) {
      velx = 0;
      x = indexX*blockx;
    }
  }
//controls
  void playerCtrl() {
    if (keys[65] == true && grounded == true) { 
      if(velx >= -10){
        velx -= 2;
      }
    }
    if (keys[68] == true && grounded == true) {
      if(velx <= 10){
        velx += 2;
      }
    }
  }
}

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
