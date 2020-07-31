class Ball { //<>//
  int x = height/2;
  int y = height-300;
  float velx = 0;
  float vely = 0;
  boolean grounded;
  int ballSize = 20;
  int red = 0;
  int blue = 255;
  long timer = Instant.now().toEpochMilli();
  boolean contact = true;
  final int NOCLIPTIME = 1000;

  Ball() {
  }
  //next/previous level switching
  void changeLevel() {
    if (y <= 0) {
      screenNum++;
      currentScreen = world[screenNum];
      y += height;
    }
    if (y >= height-20) {
      screenNum--;
      currentScreen = world[screenNum];
      y -= height;
    }
  }

  void dBall() {
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
    if (Instant.now().toEpochMilli() - timer >= NOCLIPTIME) {
      blue = 255;
      red = 0;
      contact = true;
    }
    if (x > (screen_dimension*blockx)) {
      velx *= -1;
      x = screen_dimension*blockx;
      indexX = x/blockx;
    }
    int currentBlock = stateOfIndex(indexX, indexY);
    //side colisions
    //if (stateOfIndex(indexX+1, indexY) == 1 && (distRight-velx) <= 5 && contact) {
    //  velx *= -1;
    //  x = ((indexX+1)*blockx);
    //  print(contact + "right");
    //} else if (stateOfIndex(indexX-1, indexY) == 1 && (distLeft+velx) <= 5 && contact) {
    //  velx *= -1;
    //  x = ((indexX)*blockx);
    //  print(contact + "left");
    //}
    //if (stateOfIndex(indexX+1, indexY) == 2 &&(distRight-velx) <= 5) {
    //  blue = 0;
    //  red = 255;
    //  contact = false;
    //  timer = Instant.now().toEpochMilli();
    //} 

    ////bottom collisions
    //if (stateOfIndex(indexX, indexY-1) == 1 && (distTop+vely) <= 5 && contact) {
    //  vely *= -1;
    //  y = ((indexY+1)*blockx);
    //  print(contact + "bottom");
    //}
    //top collisions
    if (currentBlock == 0) { 
      print(contact + "top");
      grounded = false;
      vely++;
    } else {
      print(contact + "top");
      vely = 0;
      velx = 0;
      y = indexY*blockx;
      grounded = true;
      //teleports player
      if (contact) {
        player.x = x;
        player.y = y;
        ball = null;
      }
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
