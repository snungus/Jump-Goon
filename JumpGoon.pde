int screenNum = 0; //which screen to load
Screen currentScreen; //screen player is currently on
Player player;
Ball ball;
final int screen_dimension = 25;
int blockx;
int blocky;
int power;

Screen[] world = new Screen[1024];

void setup() {
  //frameRate(10);
  size(1920, 1080);
  blockx = height/screen_dimension;
  blocky = height/screen_dimension;
  for (int i = 0; i < 2; i++) {
    world[i] = new Screen("stages\\"+i+".png");
  }
  currentScreen = world[screenNum];
  player = new Player();
  ball = new Ball();
}

void draw() {
  background(255);
  fill(0);
  rect(0, 0, (width-height)/2, height);
  rect((width-(width-height)/2)-5, 0, (width-height)/2, height); 
  translate((width-height)/2, 0);
  currentScreen.d();
  devSkips();
  player.playerCtrl();
  player.dPlayer();
  player.playerPhys();
  player.playerCtrl();
  player.fall();
  if (ball != null) {
    ball.dBall();
    ball.changeLevel();
    ball.ballPhys();
  }
  //delay(100);
  fill(255);
  rect(9, 9, 12, 120);
  fill(235, 0, 0);
  rect(10, 10, 10, (power*4));
  fill(255);
  textSize(24);
  text((int)(power*(100.d/30.d)), -35, 30);
}

void mousePressed() {
  if (ball == null) {
    ball = new Ball();
    ball.x = player.x+(blockx/2);
    ball.y = player.y-(blockx/2);
    //aim
    ball.velx = ((mouseX-(width-height)/2)-ball.x);
    ball.vely = (mouseY-ball.y);
    ball.normalize();
  }
}
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if(e > 0 && power > 0) {
    power--;
  }
  if(e < 0 && power < 30) {
    power++;
  }
}

int stateOfIndex(int indexX, int indexY) {
  if (indexX >= 25 || indexX < 0 || indexY >= 25 || indexY < 0) {
      return -1;
    }
    return currentScreen.screen[indexX][indexY];
  }
  
void devSkips() {
  if(keys[49] == true) {
    screenNum = 0;
    currentScreen = world[screenNum];
  }
  if(keys[50] == true) {
    screenNum = 1;
    currentScreen = world[screenNum];
  }
}
  
  
  
  
  
