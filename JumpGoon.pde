int screenNum = 1;
Screen currentScreen;
Player player;
final int screen_dimension = 25;
int blockx;
int blocky;

Screen[] world = new Screen[1024];

void setup() {
  size(1920, 1080);
  blockx = width/screen_dimension;
  blocky = height/screen_dimension;
  for (int i = 0; i < 1; i++) {
    world[i] = new Screen("stages\\"+screenNum+".png");
  }
  currentScreen = world[0];
  player = new Player();
}

void draw() {
  background(255);
  currentScreen.d();
  player.dPlayer();
  player.playerPhys();
}
