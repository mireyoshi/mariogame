void Start(){
  pushStyle();
  image(background,0,0,width,height);
  rectMode(CENTER);
  fill(255);
  textSize(30);
  text("Select a Level",250,235);
  textSize(70);
  text("Mario Game",140,170);
  strokeWeight(5);
  stroke(255);
  line(100,190,600,190);
  rect(width/4,300,200,80);
  rect(width*3/4,300,200,80);
  fill(25,0,135);
  text("easy",width/4 - 75,320);
  text("hard",width*3/4 - 75,325);
  popStyle();
}

void End(){
  pushStyle();
  background(0);
  rectMode(CENTER);
  fill(255);
  textSize(70);
  text("GAME OVER",140,170);
  popStyle();
}

void Clear(){
  pushStyle();
  textSize(70);
  text("GAME CLEAR",140,170);
  popStyle();
}
