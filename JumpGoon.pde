int screenNum = 1; //which screen to load
Screen currentScreen; //screen player is currently on
Player player;
Ball ball;
final int screen_dimension = 25;
int blockx;
int blocky;

Screen[] world = new Screen[1024];

void setup() {
  size(1920, 1080);
  blockx = height/screen_dimension;
  blocky = height/screen_dimension;
  for (int i = 0; i < 1; i++) {
    world[i] = new Screen("stages\\"+screenNum+".png");
  }
  currentScreen = world[0];
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
  player.dPlayer();
  player.playerPhys();
  player.playerCtrl();
  ball.dBall();
  ball.ballPhys();
}
