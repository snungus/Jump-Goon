class Ball {
  int x = height/2;
  int y = height-300;
  float velx = 0;
  float vely = 0;
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
    y = int(y+vely);
    x = int(x+velx);
    int indexX = x/blockx;
    int indexY = y/blocky;
    int distRight = ((indexX+1)*blockx)-x;
    int distLeft = x-((indexX+1)*blockx);
    if (x > (screen_dimension*blockx)) {
      velx *= -1;
      x = screen_dimension*blockx;
      indexX = x/blockx;
    }
    int currentBlock = stateOfIndex(indexX, indexY);
    //bottom collision
    if (currentBlock == 0) {
      grounded = false;
      vely++;
    } else {
      vely = 0;
      velx = 0;
      y = indexY*blockx;
      grounded = true;
      ball = null;
    }
    if (stateOfIndex(indexX+1, indexY-1) == 1 && distRight <= 5) {
      velx *= -1;
    } else if (stateOfIndex(indexX, indexY) == 1 && distLeft <= 5) {
      velx *= -1;
    }
  }
  
  void normalize() {
    PVector vector = new PVector(velx, vely);
    vector.normalize();
    vector.mult(dist(x, y, mouseX, mouseY)/30); //fix this for tomorrow
    velx = vector.x;
    vely = vector.y;
  }
}
