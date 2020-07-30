class Ball {
  int x = height/2;
  int y = height-300;
  float velx = 0;
  float vely = 0;
  boolean grounded;
  int ballSize = 20;

  Ball() {
  }
//next/previous level switching
  void changeLevel() {
    if(y <= 0) {
      screenNum++;
      currentScreen = world[screenNum];
      y += height;
    }
    if(y >= height-20) {
      screenNum--;
      currentScreen = world[screenNum];
      y -= height;
    }
  }

  void dBall() {
    int red = 0;
    int blue = 255;
    fill(red, 0, blue);
    ellipse(x, y, ballSize, ballSize);
  }

  void ballPhys() {
    y = int(y+vely);
    x = int(x+velx);
    int indexX = x/blockx;
    int indexY = y/blocky;
    int distRight = abs(x-((indexX+1)*blockx));
    int distLeft = abs(x-((indexX)*blockx));
    int distTop = abs(y-((indexY)*blockx));
    //println("distLeft: "+distLeft);
    //println("distRight: "+distRight);
    if (x > (screen_dimension*blockx)) {
      velx *= -1;
      x = screen_dimension*blockx;
      indexX = x/blockx;
    }
    int currentBlock = stateOfIndex(indexX, indexY);
    //side colisions
    boolean contact = true;
    if (stateOfIndex(indexX+1, indexY) == 1 && (distRight-velx) <= 5 && contact == true) {
      velx *= -1; //<>//
      x = ((indexX+1)*blockx);
    } else if (stateOfIndex(indexX-1, indexY) == 1 && (distLeft+velx) <= 5 && contact == true) {
      velx *= -1;
      x = ((indexX)*blockx);      
    }
    //if (stateOfIndex(indexX+1, indexY) == 1 &&(distRight-velx) <= 5) {
    //  dBall.blue = 0;
    //  dBall.red = 255;
    //  contact = false;
    //  sleep 1000;
    //  dBall.blue = 255;
    //  dBall.red = 0;
    //  contact = true;
    //} 
      
    //bottom collisions
    if(stateOfIndex(indexX, indexY-1) == 1 && (distTop+vely) <= 5) {
      vely *= -1;
      y = ((indexY+1)*blockx);
    }
    //top collisions
    if(currentBlock == 0) { 
      grounded = false;
      vely++;
    } else {
      vely = 0;
      velx = 0;
      y = indexY*blockx;
      grounded = true;
      //treleports player
      player.x = x;
      player.y = y;
      ball = null;
    }
    //rect(indexX*blockx, indexY*blockx, blockx, blockx);
  }

  void normalize() {
    PVector vector = new PVector(velx, vely);
    vector.normalize();
    //calculates power
    vector.mult(power);
    velx = vector.x;
    vely = vector.y;
  }
}
