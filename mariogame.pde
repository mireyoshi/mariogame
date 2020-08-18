int hero_r, hero_x, hero_y;
int x, y, dx, dy;
int[] h = new int[10];
Character hero;
Character enemy[] = new Character[20];
PImage background,img0, img1, img2, img3, img4;
int stage = 0;
int dokan_num = 10;
int killer_num = dokan_num +10;

void setup(){
  size(700, 400);
  hero_r = 40;
  hero_x = hero_r;
  hero_y = (int)(height * 0.8 - hero_r/2);
  background = loadImage("background.png");
  img0 = loadImage("mario.png");
  img1 = loadImage("dokan.png");
  img2 = loadImage("killer.png");
  img3 = loadImage("cloud.png");
  img4 = loadImage("flower.png");
  
  hero = new Character(img0,hero_x, hero_y, hero_r,hero_r);
  for(int i = 0; i < dokan_num; i++){
    enemy[i] = new Character(img1, img4, width + 300*i,  250, 50, 70);
  }
  for(int i = dokan_num; i < killer_num; i++){
     int r = (int)random(4);
     h[i - dokan_num] = 100 + 40 * r;
     enemy[i] = new Character(img2, (int)(width + 50*i*r*1.5),   h[i - dokan_num], 50, 50);
  }
}

void draw(){

  if(stage == 0){
    Start();
  }else if(stage==2){
    delay(500);
    End();
  }else if(enemy[9].x<0){
    Clear();

  }else if(stage == 1){
  background(120, 248, 254);
  for(int i = 0; i < enemy.length; i++){
    enemy[i].show();
  }    
  
  pushStyle();
  fill(180, 90, 0);
  rect(-1, height * 0.8, width + 1, height * (1 - 0.8));
  popStyle();
  
  hero.show();
  for(int i = 0; i < dokan_num; i++){
    enemy[i].x-=dx;
  }
  for(int i = dokan_num; i < killer_num; i++){
    enemy[i].x-=dy;
  }
  pushStyle();
  for(int i = 0; i < 16; i++){
    if(frameCount == 100) frameCount = 0;
    line(width/14*i - frameCount , height * 0.8, width/14*i - frameCount,  height);
    line(0, 320 + (80/3), width, 320 + (80/3));
    line(0, 320 + (80/3)*2, width, 320 + (80/3)*2);
    if(i % 2 == 0) image(img3, width/7*i - frameCount,  30, 100, 40);
    else{image(img3, width/7*i - frameCount,  70, 100, 40);}
  }
  popStyle();
  check();
}
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == RIGHT ){
      hero.x+= 10;
    }
    if(keyCode == LEFT ){
      hero.x-= 10;
    }
    if(keyCode == UP ){
      if(hero.y > 180){
        hero.y-= 120;
      }
    }
  }
}

void keyReleased(){
    if(key == CODED){
    if(keyCode == UP ){
        hero.y = (int)(height * 0.8 - hero_r/2);
         for(int i = 0; i < dokan_num; i++){
            if(hero.x >enemy[i].x && hero.x < enemy[i].x + enemy[i].w) stage++;
         }
         for(int i = dokan_num; i < killer_num; i++){
            if(hero.x >enemy[i].x && hero.x < enemy[i].x + enemy[i].w && enemy[i].y > 180) stage++;
        }
    }
  }
}

void mousePressed(){
 if(stage == 0){
    if(mouseX>75&&mouseX<275&&mouseY>260&&mouseY<340){
      stage++;
      frameCount = 0;
      dx = 2;
      dy = 3;
  }
  else if(mouseX>425&&mouseX<625&&mouseY>260&&mouseY<340){
      stage++;
      frameCount = 0;
      dx = 4;
      dy = 6;
  }
  }
}

void check(){
  for(int i = 0; i < dokan_num; i++){
     int b = floor(enemy[i].x/10) * 10;
    if(hero.x == b && hero.y > 210) stage++;
  }
  for(int i = dokan_num; i < killer_num; i++){
     int b = floor(enemy[i].x/10) * 10;
    if(hero.x == b && hero.y == enemy[i].y) stage++;
  }
}
