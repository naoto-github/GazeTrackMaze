import gazetrack.*;
import java.awt.Rectangle;

GazeTrack gazeTrack;

int screenWidth = 2256;
int screenHeight = 1504;

int start_x = screenWidth / 2;
int start_y = screenHeight / 2;
int goal_x = start_x + 100;
int goal_y = start_y + 100;

int ball_x = start_x;
int ball_y = start_y;
int ball_radius = 25;
int speed = 10;
float angle = 0;

int stage = 0;
int max_stage = 2;

ArrayList<Rectangle> obstacles = new ArrayList<Rectangle>();

void setCourse(int stage){
  
  obstacles.clear();
  
  if(stage == 0){
    
    start_x = 2256/2;
    start_y = 1504/2;
    goal_x = start_x;
    goal_y = start_y + 100;
    
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
    Rectangle obstacle27 = new Rectangle(210, 0, 2046, 3);
    Rectangle obstacle28 = new Rectangle(0, 217, 210, 1287);
    Rectangle obstacle29 = new Rectangle(210, 1501, 1839, 3);
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
  else if(stage == 1){
    
    start_x = 2256/2;
    start_y = 1504/2;
    goal_x = start_x + 100;
    goal_y = start_y;
    
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
  }
  else if(stage == 2){
  }
  else if(stage == 3){
    
  }
  
  ball_x = start_x;
  ball_y = start_y;
}

boolean inside(int x, int y, int width, int height){
  for(int i=0; i<obstacles.size(); i++){
    Rectangle obstacle = obstacles.get(i);
    if(obstacle.intersects(x, y, width, height)){
      return true;
    }
  }
  return false;
}

boolean reachGoal(int x, int y){
  
  float d = dist(x, y, goal_x, goal_y);
  if(d < ball_radius * 3){
    return true;
  }
  else{
    return false;
  }
}

void setup(){
  fullScreen();
  
  gazeTrack = new GazeTrack(this);
  
  setCourse(1);
}

void draw(){
  
  // 背景色
  background(#FFFFFF);
  
  // ゲーム領域
  fill(#000000);
  stroke(#00FF00);
  rect(0, 0, screenWidth, screenHeight);
  
  // ゴール
  fill(#FF0000);
  noStroke();
  circle(goal_x, goal_y, ball_radius * 4);
  
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
  stroke(#00FF00);
  strokeWeight(10);
  rect(0, 0, screenWidth, screenHeight);
  
  // ボールの表示
  fill(#FFFF00);
  noStroke();
  circle(ball_x, ball_y, ball_radius*2);
 
  // ボールの位置の更新
  if(gazeTrack.gazePresent()){
    
    float x = gazeTrack.getGazeX();
    float y = gazeTrack.getGazeY();
    
    // 注視点の表示
    fill(#FFFFFF);
    circle(x, y, 30);
    
    // println("X:" + x + " Y:" + y);
    
    // 注視点とボールの角度
    angle = atan2(y - ball_y, x - ball_x);
    float diff_x = speed * cos(angle);
    float diff_y = speed * sin(angle);
    
    // ボールの位置の更新
    int old_ball_x = ball_x;
    int old_ball_y = ball_y;
    ball_x += diff_x;
    ball_y += diff_y;
    
    // ボールが障害物に含まれるとき
    if(inside(ball_x - ball_radius, ball_y - ball_radius, ball_radius*2, ball_radius*2)){
      ball_x = old_ball_x;
      ball_y = old_ball_y;
    }
    
  } 
  
  if(reachGoal(ball_x, ball_y)){
    stage = (stage + 1) % max_stage;
    setCourse(stage);
  }
}
