class Character{
  int x, y, r, w, h;
  int a = 0;
  PImage img, img2;
  Character(){
    
  }

  Character(PImage img, int x, int y, int w, int h){
   this.img = img;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
  }
  Character(PImage img,PImage img2,  int x, int y, int w, int h){
   this.img = img;
   this.img2 = img2;
   this.x = x;
   this.y = y;
   this.w = w;
   this.h = h;
   a++;
  }
  
  void show(){
    if(w == h){
    pushStyle();
    imageMode(CENTER);
    image(img,x,y,w,h);
    popStyle();
    }
    else if(a == 0){
      image(img, x,  y, w, h);
    }
    else{
      image(img2, x + 5,  y - 40, w - 10, h - 15);
      image(img, x,  y, w, h);
    }
  }
}
