
PImage start,bg,monster_back,monster_front,exit,walk,hide,charge,hurt,thoughtr,thoughtm, thoughtl, claw,
h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,m0,m1,m2,m3,m4,m5,m6,m7,m8,m9,m10, escape, spell, gameOver;
boolean start_game=false;
boolean attack=false;
int hp=10;
int magic=0;
int distance=40;

import ddf.minim.*;
Minim minim;
AudioSample attack_sfx;
AudioSample hide_sfx;
AudioSample magic_sfx; 
AudioSample walk_sfx;
AudioPlayer theme; 


void setup(){
  size(1280,720);

//audio
  minim = new Minim(this);
  attack_sfx = minim.loadSample("attack.mp3",512);
  hide_sfx = minim.loadSample("hide.mp3",512);
  magic_sfx= minim.loadSample("magic.mp3",512);
  walk_sfx = minim.loadSample("walk.mp3",512);
  
  theme = minim.loadFile("theme.mp3");
  theme.loop();
  
  //images
  start=loadImage("start.png");
  bg=loadImage("bg2.jpg");
  monster_back=loadImage("monster_back.png");
  monster_front=loadImage("monster_front.png");
  exit=loadImage("exit.png");
  walk=loadImage("walk.png");
  hide=loadImage("hide.png");
  charge=loadImage("charge.png");
  hurt=loadImage("hurt.png");
  thoughtl=loadImage("thought_left.png");
  thoughtm=loadImage("thought_mid.png");
  thoughtr=loadImage("thought_right.png");
  claw=loadImage("claw.png");
  escape=loadImage("escape.png");
  spell=loadImage("spell.png");
  gameOver=loadImage("gameOver.png");
  
  //hp bar
  h0=loadImage("h0.png");
  h1=loadImage("h1.png");
  h2=loadImage("h2.png");
  h3=loadImage("h3.png");
  h4=loadImage("h4.png");
  h5=loadImage("h5.png");
  h6=loadImage("h6.png");
  h7=loadImage("h7.png");
  h8=loadImage("h8.png");
  h9=loadImage("h9.png");
  h10=loadImage("h10.png");
  //mp bar
  m0=loadImage("m0.png");
  m1=loadImage("m1.png");
  m2=loadImage("m2.png");
  m3=loadImage("m3.png");
  m4=loadImage("m4.png");
  m5=loadImage("m5.png");
  m6=loadImage("m6.png");
  m7=loadImage("m7.png");
  m8=loadImage("m8.png");
  m9=loadImage("m9.png");
  m10=loadImage("m10.png");
}

void draw(){
  background(start);
  if (key==' '){
    start_game=true;
  }
  
  if(start_game){
    turn();
  }
}

void stats(){
    //VARIABLE STATS
  if(hp==10){
     image(h10,170,580,320,140);
  }
  if(hp==9){
     image(h9,170,580,320,140);
  }
  if(hp==8){
     image(h8,170,580,320,140);
  }
  if(hp==7){
     image(h7,170,580,320,140);
  }
  if(hp==6){
     image(h6,170,580,320,140);
  }
  if(hp==5){
     image(h5,170,580,320,140);
  }
  if(hp==4){
     image(h4,170,580,320,140);
  }
  if(hp==3){
     image(h3,170,580,320,140);
  }
  if(hp==2){
     image(h2,170,580,320,140);
  }
    if(hp==1){
     image(h1,170,580,320,140);
  }
    if(hp==0){
     image(h0,170,580,320,140);
  }
  
  if(magic==0){
     image(m0,810,580,320,140);
  }
   if(magic==1){
     image(m1,810,580,320,140);
  }
   if(magic==2){
     image(m2,810,580,320,140);
  }
   if(magic==3){
     image(m3,810,580,320,140);
  }
   if(magic==4){
     image(m4,810,580,320,140);
  }
   if(magic==5){
     image(m5,810,580,320,140);
  }
   if(magic==6){
     image(m6,810,580,320,140);
  }
   if(magic==7){
     image(m7,810,580,320,140);
  }
   if(magic==8){
     image(m8,810,580,320,140);
  }
   if(magic==9){
     image(m9,810,580,320,140);
  }
   if(magic==10){
     image(m10,810,580,320,140);
  }
  
  if(distance==40){
     image(exit,950,0,333,179);
    text("40 ft",1050,135);
    textSize(50);
  }
  if(distance==35){
     image(exit,950,0,333,179);
    text("35 ft",1050,135);
    textSize(50);
  }
  if(distance==30){
     image(exit,950,0,333,179);
    text("30 ft",1050,135);
    textSize(50);
  }
  if(distance==25){
     image(exit,950,0,333,179);
    text("25 ft",1050,135);
    textSize(50);
  }
  if(distance==20){
     image(exit,950,0,333,179);
    text("20 ft",1050,135);
    textSize(50);
  }
  if(distance==15){
     image(exit,950,0,333,179);
    text("15 ft",1050,135);
    textSize(50);
  }
  if(distance==10){
     image(exit,950,0,333,179);
    text("10 ft",1050,135);
    textSize(50);
  }
   if(distance==5){
     image(exit,950,0,333,179);
    text("5 ft",1050,135);
    textSize(45);
  }
   if(distance==0){
     image(exit,950,0,333,179);
    text("0 ft",1050,135);
    textSize(50);
  }
}


void turn(){
  background(bg);
  image(monster_back,630,240,136,273);
  image(walk,320,230,482,759);
  image(thoughtl,200,120,200,200);
  image(thoughtm,450,50,200,220);
  image(thoughtr,700,120,200,200);
  stats();

//attack true/false
  if(random(1)<0.5){
     attack=true; 
    }
    else{
      attack=false;
    }
  }
  
  void keyPressed(){
  //choices
  if(key=='a'&& attack==true){
    hide_true();
  }
    if(key=='a'&& attack==false){
    hide_false();
    }
  if(key=='s'&& attack==true){
    charge_true();
  }
    if(key=='s'&& attack==false){
    charge_false();
  }
  
   if(key=='d'&& attack==true){
    walk_true();
  }
   if(key=='d'&& attack==false){
    walk_false();
  }
  if(key==' '){
    check();
  }
  }

//OUTCOMES
void hide_false(){
  frameRate(1);
  hide_sfx.trigger();
  background(bg);
  image(monster_back,630,240,136,273);
  image(hide,30,330,203,360);
  stats();
   //check death
   if(hp<=0){
      
    background(gameOver); //PUT LOSE SCREEN HERE
    noLoop();
  }

}

void hide_true(){
   attack_sfx.trigger();
   frameRate(1);
  background(bg);
  image(monster_front,630,240,136,273);
  image(hide,30,330,203,360);
  stats();
   //check death
   if(hp<=0){
     
    background(gameOver); //PUT LOSE SCREEN HERE
    noLoop();
  }
}

void charge_false(){
  magic_sfx.trigger();
   frameRate(1);
   background(bg);
  image(monster_back,630,240,136,273);
  image(charge,330,250,691,725);
  magic++;
  stats();
   //check death
   if(hp<=0){
      
     background(gameOver); //PUT LOSE SCREEN HERE
    noLoop();
  }
}

void charge_true(){
   frameRate(1);
    attack_sfx.trigger();
   background(bg);
  image(monster_front,630,240,136,273);
  image(hurt,320,230,524,766);
  image(claw,250,140,500,500);
  hp--;
  stats();
   //check death
   if(hp<=0){
      
     background(gameOver);//PUT LOSE SCREEN HERE
    noLoop();
  }
}

void walk_false(){
   frameRate(1);
    walk_sfx.trigger();
   background(bg);
  image(monster_back,630,240,136,273);
  image(walk,320,230,482,759);
  distance-=5;
  stats();
   //check death
   if(hp<=0){
     
    background(gameOver);//PUT LOSE SCREEN HERE
    noLoop();
  }
}

void walk_true(){
   frameRate(1);
    attack_sfx.trigger();
   background(bg);
  image(monster_front,630,240,136,273);
  image(hurt,320,230,524,766);
  image(claw,250,140,500,500);
  hp--;
   stats();
   //check death
    if(hp<=0){
       
    background(gameOver);//PUT LOSE SCREEN HERE
    noLoop();
  }
}

void check(){
  if(hp>0&&distance<=0){
 
    background(escape); //escape win screen
    noLoop();
  }
  else if(hp>0&&magic>=10){
    
    background(spell); //spell win screen
    noLoop();
  }
  else{
    turn();
  }
}
