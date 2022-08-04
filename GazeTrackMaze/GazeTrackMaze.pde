import processing.sound.*;
import gazetrack.*;
import java.awt.Rectangle;

int TYPE_GAZE = 0; // 視線でゲーム
int TYPE_MOUSE = 1; // マウスでゲーム

// ゲームタイプを選択
int game_type = TYPE_MOUSE;

// 視線検出
GazeTrack gazeTrack;

// スクリーンのサイズ
int screenWidth = 2256;
int screenHeight = 1504;

// 初期座標
int start_x = screenWidth / 2;
int start_y = screenHeight / 2;
int goal_x = start_x + 100;
int goal_y = start_y + 100;
int ball_x = start_x;
int ball_y = start_y;

// パラメータ
int ball_radius = 50; // キャラクタの大きさ
int speed = 10; // キャラクタの速度
int stage = 0; // ステージの初期値
int max_stage = 4; // ステージの数

// UFO
PImage ufo;

// 地球
PImage earth;

// 障害物
ArrayList<Rectangle> obstacles = new ArrayList<Rectangle>();

// サウンドファイル
SoundFile bgm_sound;
SoundFile clear_sound;

// 初期時間
int start_time;

// 経過時間
float elapsed_time;

// サウンドの初期化
void setSound(){
  
  // 再生中なら停止
  if(bgm_sound != null){
    bgm_sound.stop();
  }
  
  // BGM
  bgm_sound = new SoundFile(this, "sound/bgm.mp3");
  bgm_sound.loop();
  
  // クリアの効果音
  clear_sound = new SoundFile(this, "sound/clear.mp3");
}

// コースの初期化
void setCourse(int stage){
  
  obstacles.clear();
  
  if(stage == 1){
    
    // 滝本
    
    start_x = 100;
    start_y = 100;
    goal_x = 2150;
    goal_y = 1400;
    
    Rectangle obstacle4 = new Rectangle(210, 217, 204, 1);
    Rectangle obstacle5 = new Rectangle(1434, 217, 408, 1);
    Rectangle obstacle6 = new Rectangle(1026, 431, 204, 1);
    Rectangle obstacle7 = new Rectangle(1434, 431, 408, 1);
    Rectangle obstacle8 = new Rectangle(618, 645, 204, 1);
    Rectangle obstacle9 = new Rectangle(1026, 645, 816, 1);
    Rectangle obstacle10 = new Rectangle(414, 859, 612, 1);
    Rectangle obstacle11 = new Rectangle(1230, 859, 612, 1); 
    Rectangle obstacle12 = new Rectangle(414, 1073, 1632, 1); 
    Rectangle obstacle13 = new Rectangle(414, 1287, 204, 1);  
    Rectangle obstacle14 = new Rectangle(822, 1287, 816, 1);
    Rectangle obstacle15 = new Rectangle(414, 217, 1, 642);
    Rectangle obstacle16 = new Rectangle(414, 1073, 1, 214);
    Rectangle obstacle17 = new Rectangle(618, 3, 1, 642);
    Rectangle obstacle18 = new Rectangle(822, 217, 1, 428);
    Rectangle obstacle19 = new Rectangle(1026, 217, 1, 214);
    Rectangle obstacle20 = new Rectangle(1026, 645, 1, 214);
    Rectangle obstacle21 = new Rectangle(1230, 3, 1, 428); 
    Rectangle obstacle22 = new Rectangle(1230, 859, 1, 214); 
    Rectangle obstacle23 = new Rectangle(1434, 217, 1, 214);  
    Rectangle obstacle24 = new Rectangle(1638, 1073, 1, 214);
    Rectangle obstacle25 = new Rectangle(1842, 431, 1, 214);
    Rectangle obstacle26 = new Rectangle(1842, 1289, 1, 214);
    Rectangle obstacle27 = new Rectangle(210, 0, 2046, 1);
    Rectangle obstacle28 = new Rectangle(0, 217, 210, 1287);
    Rectangle obstacle29 = new Rectangle(210, 1501, 1839, 1);
    Rectangle obstacle30 = new Rectangle(2046, 3, 210, 1284);
    obstacles.add(obstacle4);
    obstacles.add(obstacle5);
    obstacles.add(obstacle6);
    obstacles.add(obstacle7);
    obstacles.add(obstacle8);
    obstacles.add(obstacle9);
    obstacles.add(obstacle10);
    obstacles.add(obstacle11);
    obstacles.add(obstacle12);
    obstacles.add(obstacle13);
    obstacles.add(obstacle14);
    obstacles.add(obstacle15);
    obstacles.add(obstacle16);
    obstacles.add(obstacle17);
    obstacles.add(obstacle18);
    obstacles.add(obstacle19);
    obstacles.add(obstacle20);
    obstacles.add(obstacle21);
    obstacles.add(obstacle22);
    obstacles.add(obstacle23);
    obstacles.add(obstacle24);
    obstacles.add(obstacle25);
    obstacles.add(obstacle26);
    obstacles.add(obstacle27);
    obstacles.add(obstacle28);
    obstacles.add(obstacle29);
    obstacles.add(obstacle30);
  }
  else if(stage == 2){
    
    // 松岡
    
    start_x = 100;
    start_y = 1400;
    goal_x = 2150;
    goal_y = 90;
    
    Rectangle obstacle1= new Rectangle(187,0,1,167);
    Rectangle obstacle2= new Rectangle(0,334,375,1);
    Rectangle obstacle3= new Rectangle(375,167,187,1);
    Rectangle obstacle4= new Rectangle(562,167,1,334);
    Rectangle obstacle5= new Rectangle(0,501,562,1);
    Rectangle obstacle6= new Rectangle(0,668,187,1);
    Rectangle obstacle7= new Rectangle(187,1002,1,561);
    Rectangle obstacle8= new Rectangle(750,334,187,1);
    Rectangle obstacle9= new Rectangle(937,167,187,1);
    Rectangle obstacle10= new Rectangle(1125,167,1,334);
    Rectangle obstacle11= new Rectangle(937,167,1,835);
    Rectangle obstacle12= new Rectangle(750,668,187,1);
    Rectangle obstacle13= new Rectangle(750,501,1,334);
    Rectangle obstacle14= new Rectangle(562,835,187,1);
    Rectangle obstacle15= new Rectangle(562,668,1,167);
    Rectangle obstacle16= new Rectangle(375,668,187,1);
    Rectangle obstacle17= new Rectangle(375,668,1,668);
    Rectangle obstacle18= new Rectangle(562,1002,1,334);
    Rectangle obstacle19= new Rectangle(562,1336,375,1);
    Rectangle obstacle20= new Rectangle(750,1002,1,167);
    Rectangle obstacle21= new Rectangle(750,1169,375,1);
    Rectangle obstacle22= new Rectangle(937,1169,1,167);
    Rectangle obstacle23= new Rectangle(1125,1169,1,334);
    Rectangle obstacle24= new Rectangle(937,835,187,1);
    Rectangle obstacle25= new Rectangle(937,1002,375,1);
    Rectangle obstacle26= new Rectangle(1125,668,187,1);
    Rectangle obstacle27= new Rectangle(1312,167,1,1169);
    Rectangle obstacle28= new Rectangle(1312,167,187,1);
    Rectangle obstacle29= new Rectangle(1500,167,1,1169);
    Rectangle obstacle30= new Rectangle(1500,668,187,1);
    Rectangle obstacle31= new Rectangle(1687,501,1,167);
    Rectangle obstacle32= new Rectangle(1687,501,187,1);
    Rectangle obstacle33= new Rectangle(1875,501,1,167);
    Rectangle obstacle34= new Rectangle(1875,668,187,1);
    Rectangle obstacle35= new Rectangle(2062,0,1,668);
    Rectangle obstacle36= new Rectangle(1687,0,1,167);
    Rectangle obstacle37= new Rectangle(1875,0,1,334);
    Rectangle obstacle38= new Rectangle(1687,334,187,1);
    Rectangle obstacle39= new Rectangle(1687,835,1,668);
    Rectangle obstacle40= new Rectangle(1875,835,1,501);
    Rectangle obstacle41= new Rectangle(1875,835,375,1);
    Rectangle obstacle42= new Rectangle(2062,1002,1,501);
    Rectangle obstacle60 = new Rectangle( 0, 0, 1, 1504);
    Rectangle obstacle61 = new Rectangle(0,0,2256,1);
    Rectangle obstacle62 = new Rectangle(2256,0,1,1504);
    Rectangle obstacle63 = new Rectangle(0,1504,2256,1);
    obstacles.add(obstacle1);
    obstacles.add(obstacle2);
    obstacles.add(obstacle3);
    obstacles.add(obstacle4);
    obstacles.add(obstacle5);
    obstacles.add(obstacle6);
    obstacles.add(obstacle7);
    obstacles.add(obstacle8);
    obstacles.add(obstacle9);
    obstacles.add(obstacle10);
    obstacles.add(obstacle11);
    obstacles.add(obstacle12);
    obstacles.add(obstacle13);
    obstacles.add(obstacle14);
    obstacles.add(obstacle15);
    obstacles.add(obstacle16);
    obstacles.add(obstacle17);
    obstacles.add(obstacle18);
    obstacles.add(obstacle19);
    obstacles.add(obstacle20);
    obstacles.add(obstacle21);
    obstacles.add(obstacle22);
    obstacles.add(obstacle23);
    obstacles.add(obstacle24);
    obstacles.add(obstacle25);
    obstacles.add(obstacle26);
    obstacles.add(obstacle27);
    obstacles.add(obstacle28);
    obstacles.add(obstacle29);
    obstacles.add(obstacle30);
    obstacles.add(obstacle31);
    obstacles.add(obstacle32);
    obstacles.add(obstacle33);
    obstacles.add(obstacle34);
    obstacles.add(obstacle35);
    obstacles.add(obstacle36);
    obstacles.add(obstacle37);
    obstacles.add(obstacle38);
    obstacles.add(obstacle39);
    obstacles.add(obstacle40);
    obstacles.add(obstacle41);
    obstacles.add(obstacle42);
    obstacles.add(obstacle60);
    obstacles.add(obstacle61);
    obstacles.add(obstacle62);
    obstacles.add(obstacle63);
    
  }
  else if(stage == 3){
    
    // 久保
    
    start_x = 75;
    start_y = 62;
    goal_x = 2175;
    goal_y = 687;
    
    Rectangle obstacle1 = new Rectangle(0, 127, 150, 1);
    Rectangle obstacle2 = new Rectangle(0, 1002, 150, 1);
    Rectangle obstacle3 = new Rectangle(150, 502, 450, 1);
    Rectangle obstacle4 = new Rectangle(150, 627, 450, 1);
    Rectangle obstacle5 = new Rectangle(150, 877, 150, 1);
    Rectangle obstacle6 = new Rectangle(150, 1252, 300, 1);
    //Rectangle obstacle7 = new Rectangle(300, 502, 450, 1);//
    Rectangle obstacle8 = new Rectangle(300, 752, 150, 1);
    Rectangle obstacle9 = new Rectangle(300, 1127,300, 1);
    Rectangle obstacle10 = new Rectangle(450, 127, 900, 1);
    Rectangle obstacle11 = new Rectangle(450, 252, 600, 1);
    Rectangle obstacle12 = new Rectangle(450, 1002, 300, 1);
    Rectangle obstacle13 = new Rectangle(900, 1377, 300, 1);
    Rectangle obstacle14 = new Rectangle(1050, 502, 450, 1);
    Rectangle obstacle15 = new Rectangle(1050, 752, 300, 1);
    Rectangle obstacle16 = new Rectangle(1050, 877, 450, 1);
    Rectangle obstacle17 = new Rectangle(1200, 627, 450, 1);
    Rectangle obstacle18 = new Rectangle(1200, 1002, 600, 1);
    Rectangle obstacle19 = new Rectangle(1200, 1127, 450, 1);
    Rectangle obstacle20 = new Rectangle(1800, 127, 150, 1);
    Rectangle obstacle21 = new Rectangle(1800, 502, 300, 1);
    Rectangle obstacle22 = new Rectangle(1800, 752, 150, 1);
    Rectangle obstacle23 = new Rectangle(1800, 1377,300, 1);
    Rectangle obstacle24 = new Rectangle(1950, 377, 150, 1);
    Rectangle obstacle25 = new Rectangle(1950, 877, 150, 1);
    Rectangle obstacle26 = new Rectangle(1950, 1252, 150, 1);
    Rectangle obstacle27 = new Rectangle(2100, 752, 150, 1);
    Rectangle obstacle28 = new Rectangle(2100, 1002, 150, 1);
    Rectangle obstacle29 = new Rectangle(300, 2, 1, 375);
    Rectangle obstacle30 = new Rectangle(1500, 2, 1, 500);
    Rectangle obstacle31 = new Rectangle(1650, 2, 1, 625);
    Rectangle obstacle32 = new Rectangle(150, 127, 1, 375 );
    Rectangle obstacle33 = new Rectangle(450, 127, 1 , 125);
    Rectangle obstacle34 = new Rectangle(1350, 127, 1, 250);
    Rectangle obstacle35 = new Rectangle(1800, 127, 1, 375);
    Rectangle obstacle36 = new Rectangle(1950, 127, 1, 250);
    Rectangle obstacle37 = new Rectangle(1050, 252, 1, 500);
    Rectangle obstacle38 = new Rectangle(900, 377, 1, 625);
    Rectangle obstacle39 = new Rectangle(600, 502, 1, 375);
    Rectangle obstacle40 = new Rectangle(2100, 502, 1, 250);
    Rectangle obstacle41 = new Rectangle(150, 627, 1, 125);
    Rectangle obstacle42 = new Rectangle(1500, 627, 1, 375);
    Rectangle obstacle43 = new Rectangle(300, 752, 1, 375);
    Rectangle obstacle44 = new Rectangle(450, 752, 1, 250);
    Rectangle obstacle45 = new Rectangle(1950, 752,1,125);
    Rectangle obstacle46 = new Rectangle(900, 875, 1, 500);
    Rectangle obstacle47 = new Rectangle(1050, 875,1,375);
    Rectangle obstacle48 = new Rectangle(2100, 875,1,125);
    Rectangle obstacle49 = new Rectangle(150, 1002,1,250);
    Rectangle obstacle50 = new Rectangle(1950, 1002,1,250);
    Rectangle obstacle51 = new Rectangle(600, 1127,1,250);
    Rectangle obstacle52 = new Rectangle(1200, 1127,1,250);
    Rectangle obstacle53 = new Rectangle(1650, 1127,1,375);
    Rectangle obstacle54 = new Rectangle(1500, 1252,1,250);
    Rectangle obstacle55 = new Rectangle(1800, 1002,1,375);
    Rectangle obstacle56 = new Rectangle(300, 377, 450, 1);
    Rectangle obstacle57 = new Rectangle(2100, 127, 1, 250 );
    Rectangle obstacle58 = new Rectangle(750, 377,1,625);
    Rectangle obstacle59 = new Rectangle(2100, 1252,1,125);
    Rectangle obstacle60 = new Rectangle( 0, 0, 1, 1504);
    Rectangle obstacle61 = new Rectangle(0,0,2256,1);
    Rectangle obstacle62 = new Rectangle(2256,0,1,1504);
    Rectangle obstacle63 = new Rectangle(0,1504,2256,1);
        
    obstacles.add(obstacle1);
    obstacles.add(obstacle2);
    obstacles.add(obstacle3);
    obstacles.add(obstacle4);
    obstacles.add(obstacle5);
    obstacles.add(obstacle6);
    //obstacles.add(obstacle7);//
    obstacles.add(obstacle8);
    obstacles.add(obstacle9);
    obstacles.add(obstacle10);
    obstacles.add(obstacle11);
    obstacles.add(obstacle12);
    obstacles.add(obstacle13);
    obstacles.add(obstacle14);
    obstacles.add(obstacle15);
    obstacles.add(obstacle16);
    obstacles.add(obstacle17);
    obstacles.add(obstacle18);
    obstacles.add(obstacle19);
    obstacles.add(obstacle20);
    obstacles.add(obstacle21);
    obstacles.add(obstacle22);
    obstacles.add(obstacle23);
    obstacles.add(obstacle24);
    obstacles.add(obstacle25);
    obstacles.add(obstacle26);
    obstacles.add(obstacle27);
    obstacles.add(obstacle28);
    obstacles.add(obstacle29);
    obstacles.add(obstacle30);
    obstacles.add(obstacle31);
    obstacles.add(obstacle32);
    obstacles.add(obstacle33);
    obstacles.add(obstacle34);
    obstacles.add(obstacle35);
    obstacles.add(obstacle36);
    obstacles.add(obstacle37);
    obstacles.add(obstacle38);
    obstacles.add(obstacle39);
    obstacles.add(obstacle40);
    obstacles.add(obstacle41);
    obstacles.add(obstacle42);
    obstacles.add(obstacle43);
    obstacles.add(obstacle44);
    obstacles.add(obstacle45);
    obstacles.add(obstacle46);
    obstacles.add(obstacle47);
    obstacles.add(obstacle48);
    obstacles.add(obstacle49);
    obstacles.add(obstacle50);
    obstacles.add(obstacle51);
    obstacles.add(obstacle52);
    obstacles.add(obstacle53);
    obstacles.add(obstacle54);
    obstacles.add(obstacle55);
    obstacles.add(obstacle56);
    obstacles.add(obstacle57);
    obstacles.add(obstacle58);
    obstacles.add(obstacle59);
    obstacles.add(obstacle60);
    obstacles.add(obstacle61);
    obstacles.add(obstacle62);
    obstacles.add(obstacle63);
  }
  else if(stage == 0){
    
    //鈴木
    
    start_x = 300;
    start_y = 100;
    goal_x = 2000;
    goal_y = 250;
    
    Rectangle obstacle1 = new Rectangle(250, 250, 250, 1);
    Rectangle obstacle2 = new Rectangle(250, 700, 500, 1);
    Rectangle obstacle3 = new Rectangle(350, 1160, 650, 1);
    Rectangle obstacle4 = new Rectangle(500, 0, 1, 700);
    Rectangle obstacle5 = new Rectangle(750, 1160, 1, 370);
    Rectangle obstacle6 = new Rectangle(1000, 760, 1, 400);
    Rectangle obstacle7 = new Rectangle(850, 0, 1, 250);
    Rectangle obstacle8 = new Rectangle(850, 250, 500, 1);
    Rectangle obstacle9 = new Rectangle(1250, 250, 1, 500);
    Rectangle obstacle10 = new Rectangle(1450, 1150, 550, 1);
    Rectangle obstacle11 = new Rectangle(1250, 500, 200, 1);
    Rectangle obstacle12 = new Rectangle(1700, 0, 1, 1150);
    Rectangle obstacle13 = new Rectangle(1700, 450, 300, 1);
    Rectangle obstacle14 = new Rectangle(2000, 200, 1, 250);
    Rectangle obstacle60 = new Rectangle( 0, 0, 1, 1504);
    Rectangle obstacle61 = new Rectangle(0,0,2256,1);
    Rectangle obstacle62 = new Rectangle(2256,0,1,1504);
    Rectangle obstacle63 = new Rectangle(0,1504,2256,1);
    obstacles.add(obstacle1);
    obstacles.add(obstacle2);
    obstacles.add(obstacle3);
    obstacles.add(obstacle4);
    obstacles.add(obstacle5);
    obstacles.add(obstacle6);
    obstacles.add(obstacle7);
    obstacles.add(obstacle8);
    obstacles.add(obstacle9);
    obstacles.add(obstacle10);
    obstacles.add(obstacle11);
    obstacles.add(obstacle12);
    obstacles.add(obstacle13); 
    obstacles.add(obstacle60);
    obstacles.add(obstacle61);
    obstacles.add(obstacle62);
    obstacles.add(obstacle63);
  }
  
  ball_x = start_x;
  ball_y = start_y;
}


boolean collide(int x, int y, int w, int h){
  
  Rectangle target = new Rectangle(x, y, w, h);
  
  for(int i=0; i<obstacles.size(); i++){
    Rectangle obstacle = obstacles.get(i);
    if(obstacle.intersects(target)){
      return true;
    }
  }
  
  return false;
    
}

// ゴールの到達判定
boolean reachGoal(int x, int y){
  
  float d = dist(x, y, goal_x, goal_y);
  if(d < ball_radius * 1.5){
    return true;
  }
  else{
    return false;
  }
}

void setup(){
  fullScreen();
  
  if(game_type == TYPE_GAZE){
    gazeTrack = new GazeTrack(this);
  }
  
  ufo = loadImage("img/ufo.png");
  earth = loadImage("img/earth.png");
  
  setCourse(stage);
  setSound();
  
  start_time = millis();
}

void draw(){
  
  // 背景色
  background(#797979);
  
  // ゲーム領域
  fill(#000000);
  stroke(#00FF00);
  rect(0, 0, screenWidth, screenHeight);
  
  // ゴール
  image(earth, goal_x-ball_radius, goal_y-ball_radius, ball_radius*2, ball_radius*2);
  
  // 障害物
  for(int i=0; i<obstacles.size(); i++){
    Rectangle obstacle = obstacles.get(i);
    fill(#FFFFFF);
    stroke(#FFFFFF);
    strokeWeight(3);
    rect(obstacle.x, obstacle.y, obstacle.width, obstacle.height);
  }
  
  // ゲーム枠線
  noFill();
  stroke(#6699CC);
  strokeWeight(10);
  rect(0, 0, screenWidth, screenHeight);
  
  // キャラクターの表示
  image(ufo, ball_x-ball_radius, ball_y-ball_radius, ball_radius*2, ball_radius*2);

  //経過時間の表示
  noStroke();
  fill(#0000ff);
  rect(30, screenHeight-130, 450, 100);
  elapsed_time = (float)(millis() - start_time) / 1000;
  textSize(64);
  fill(#ffff00);
  text("TIME:" + Float.toString(elapsed_time), 50, screenHeight-50);
 
  // ボールの位置の更新  
  float x = start_x;
  float y = start_y;
  if(game_type == TYPE_GAZE){
    if(gazeTrack.gazePresent()){
      x = gazeTrack.getGazeX();
      y = gazeTrack.getGazeY();
    }
  }
  else if(game_type == TYPE_MOUSE){
    x = mouseX;
    y = mouseY;
  }
  
  // 注視点の表示
  fill(#FFFF00);
  noStroke();
  circle(x, y, 30);
  
  // println("X:" + x + " Y:" + y);
  
  // 注視点とボールの角度
  float angle = atan2(y - ball_y, x - ball_x);
  float diff_x = speed * cos(angle);
  float diff_y = speed * sin(angle);
  
  // X座標の更新
  int old_ball_x = ball_x;
  ball_x += diff_x;
  
  // ボールが障害物に衝突したとき
  if(collide(ball_x-ball_radius, ball_y-ball_radius, ball_radius*2, ball_radius*2)){
    ball_x = old_ball_x;
  }
  
  // Y座標の更新
  int old_ball_y = ball_y;
  ball_y += diff_y;
  
  // ボールが障害物に衝突したとき
  if(collide(ball_x-ball_radius, ball_y-ball_radius, ball_radius*2, ball_radius*2)){
    ball_y = old_ball_y;
  }
 
  // ボールがゴールに到達したとき
  if(reachGoal(ball_x, ball_y)){
    stage = (stage + 1) % max_stage;
    bgm_sound.stop();
    clear_sound.play();
    delay(2000);
    setCourse(stage);
    setSound();
    start_time = millis();
  }
}
