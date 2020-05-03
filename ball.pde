class Ball {
  int x = height/2;
  int y = height-300;
  float velx = 0;
  float vely = 0;
  boolean grounded;
  int ballSize = 20;



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
    int distRight = x-((indexX)*blockx);
    int distLeft = ((indexX)*blockx)-x;
    println("distLeft: "+distLeft);
    println("distRight: "+distRight);
    if (x > (screen_dimension*blockx)) {
      velx *= -1;
      x = screen_dimension*blockx;
      indexX = x/blockx;
    }
    int currentBlock = stateOfIndex(indexX, indexY);
    //side colisions
    if (stateOfIndex(indexX+1, indexY) == 1 && distRight <= 5) {
      velx *= -1; //<>//
    } else if (stateOfIndex(indexX-1, indexY) == 1 && distLeft <= 5) {
      velx *= -1;
    }
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
  }

  void normalize() {
    PVector vector = new PVector(velx, vely);
    vector.normalize();
    vector.mult(dist(x, y, (mouseX-(width-height)/2), mouseY)/30);
    velx = vector.x;
    vely = vector.y;
  }
}
