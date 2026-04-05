/*

Filename: Defender
Purpose: Create a game where the defender plane should kill enemies (can be planes, asteroids, other flying objects).
The defender can move by WASD keys and shoot the missile by pressing the m key.
If the enemies touch the defender, life is subtracted.
Missile should be moved with the defender plane until launched.
If the enemies are out of the screen on the left, they should appear again from the right.
For each destroyed enemy, the points are added. Add an appropriate background.
Display the points and lives on the top of the screen.
The game is over if life is zero.
Stop the game with the message "Mission Accomplished!" if the points >= 100.

*/


// Image Variables



PImage backgroundImage;
PImage defender;
PImage enemy1;
PImage enemy2;
PImage enemy3;
PImage enemy4;
PImage enemy5;
PImage missile;
PImage start;
PImage back;
PImage help;
PImage mainmenu;
PImage defenderlogo;
PImage warplanebackground;
PImage GameOver;
PImage MissionAccomplished;

   // Defender variables

float defenderX = 0;
float defenderY = 200;

   // Enemies variables

float enemyX1 = 991;
float enemyY1 = random(10, 530);
float enemyX2 = 991;
float enemyY2 = random(10, 530);
float enemyX3 = 991;
float enemyY3 = random(10, 530);
float enemyX4 = 991;
float enemyY4 = random(10, 530);
float enemyX5 = 991;
float enemyY5 = random(10, 530);

     // Missile variables

float missileX;
float missileY;
boolean missileFired;
float missileS = 10;   //  missile speed


    // Initial variables for points, lives and stage

int points = 0;
int lives = 3;
int stage = 0;

void setup() {
  size(991, 584);    // size of the background
  
     // Load images  
  backgroundImage = loadImage("background.jpg");
  defender = loadImage("Defender.png");
  enemy1 = loadImage("Enemy1.png");
  enemy2 = loadImage("Enemy2.png");
  enemy3 = loadImage("Enemy3.png");
  enemy4 = loadImage("Enemy4.png");
  enemy5 = loadImage("Enemy5.png");
  missile = loadImage("missile.png");
  start = loadImage("start.png");
  back = loadImage("back.png");
  help = loadImage("help.png");
  mainmenu = loadImage("mainmenu.png");
  defenderlogo = loadImage("defenderlogo.png");
  warplanebackground = loadImage("warplanebackground.jpg");
  GameOver = loadImage("GameOver.png");
  MissionAccomplished = loadImage("MissionAccomplished.png");
}

void draw() {
  
  background(backgroundImage);
  
  
  //  stage 0 = MainMENUS  
  if(stage == 0){    
  fill(255);
    textSize(50);
    textAlign(CENTER);
    image(warplanebackground,0,0,991,584);     //  main menu background
    image(defenderlogo,width/2-150,height/2-270,300,150);    //  game title 
    image(start,900,500,70,70);     //  start button
    image(help,840,520,50,50);     //  help button
    if((mousePressed == true) && (mouseX > 840 && mouseX < 890 && mouseY > 520 && mouseY < 570)){//changes stage to help screen stage
      stage = 1;    //  if mouse is pressed on that area, stage changes from 0 to 1(help stage)
    }//closing for the button help click
  }//closing for stage 0
  
  
  // stage 1 = help stage 
  
  if(stage == 1){   
    image(back,920,20,50,50);    //  go back button
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("INSTRUCTIONS",width/2,100);    
    //  Instructions in the help stage    
    textSize(21);
    text("The objective of the game is to kill 100 enemies without getting hit by any of the enemies",width/2,150);
    text("or let the enemies pass from the right to the left of the screen.",width/2,180);
    text("The warplane can move by pressing  w, a, s, d keys and shoot the bullet by pressing the m key.",width/2,210);
    text("The player loses the game by getting hit by any of the enemies",width/2,250);
    text("or letting the enemies pass from the right to the left of the screen.",width/2,280);
    text("The player wins the game by achieving scores=100",width/2,320);
    text("which means each enemy worth 4 points",width/2,350);
    text("and the player needs to kill 25  enemies to win the game.",width/2,370);
    if((mousePressed == true) && (mouseX > 920 && mouseX < 975 && mouseY > 20 && mouseY < 70)){//changes stage to main screen using back button
     stage = 0;    // if mouse is pressed on that area, stage changes from 1 to 0(main menu)
     }    //closing for the button go back click
  }//closing for stage 1

if(stage == 0){     // Main menu
  if((mousePressed == true) && (mouseX > 900 && mouseX < 970 && mouseY > 500 && mouseY < 570)){   
  stage = 2;   //changes main menu  to actual game
  }
}


// Poimts>= 100, Mission Accomplished
  if(stage == 2 && points >= 100) {
    stage =4;     //  if points >= 100 go to winning stage
  }
  //  in the winning stage
  if(stage==4){
    image(MissionAccomplished, 0, 0,width,height);    //  shows mission acomplished text in winning stage
   image(mainmenu,900,20,70,70);
       if( mousePressed == true &&(mouseX > 900 && mouseX < 970 && mouseY > 20 && mouseY < 90)){         
       //   after winning rest the intial values      
   points=0;
   lives =3;
   defenderX = 0;
   defenderY = 200;
 enemyX1 = 991;
 enemyY1 = random(10, 530);
 enemyX2 = 991;
 enemyY2 = random(10, 530);
 enemyX3 = 991;
 enemyY3 = random(10, 530);
 enemyX4 = 991;
 enemyY4 = random(10, 530);
 enemyX5 = 991;
 enemyY5 = random(10, 530);    
         stage = 0;   //  go back to main menu
}    //  closing mainmenu button
}    //   closing stage 4

  // You lost if lives = zero
  if(stage == 2 && lives <= 0) {
    stage =3;       //  if livess <= 0 go to losing stage
  }

     //   losing  stage
if(stage == 3){        
    image(GameOver,width/2-175,height/2-175,300,300);    //  shows game over text in winning stage
    image(mainmenu,900,20,70,70);
      if( mousePressed == true &&(mouseX > 900 && mouseX < 970 && mouseY > 20 && mouseY < 90)){  
         //   after losing rest the intial values          
   points=0;
   lives =3;
   defenderX = 0;
   defenderY = 200;
 enemyX1 = 991;
 enemyY1 = random(10, 530);
 enemyX2 = 991;
 enemyY2 = random(10, 530);
 enemyX3 = 991;
 enemyY3 = random(10, 530);
 enemyX4 = 991;
 enemyY4 = random(10, 530);
 enemyX5 = 991;
 enemyY5 = random(10, 530);    
         stage = 0; 
}     //  go back to main menu
}     //  closing stage 3
  


       // actual game stage 

if (stage ==2){ 
  
    // Smooth defender movement
  if (keyPressed) {
    if (key == 'w') {
      defenderY -= 5;
    }
    if (key == 's') {
      defenderY += 5;
    }
    if (key == 'a') {
      defenderX -= 5;
    }
    if (key == 'd') {
      defenderX += 5;
    }
  }

  // Boundary check
  defenderX = constrain(defenderX, 0, width - 100);  // 100 is defender width
  defenderY = constrain(defenderY, 0, height - 100); // 100 is defender height

  

  // Draw defender  
  image(defender, defenderX, defenderY, 100, 100);

  // Draw enemy  
  image(enemy1, enemyX1, enemyY1, 80, 80);
  image(enemy2, enemyX2, enemyY2, 80, 80);
  image(enemy3, enemyX3, enemyY3, 80, 80);
  image(enemy4, enemyX4, enemyY4, 80, 80);
  image(enemy5, enemyX5, enemyY5, 80, 80);

  // Draw missile 
  if (missileFired) {
    image(missile, missileX, missileY, 40, 40);
    missileX = missileX + missileS;

    // Collision (Missile + Enemy) if missile touches each enemy points +4
    
    if (dist(missileX + 10, missileY + 10, enemyX1 + 30, enemyY1 + 30) < 10 + 30) {
      points = points + 4;    
      missileFired = false;
      enemyX1 = 991;
      enemyY1 = random(10, 530);
    }

    if (dist(missileX + 10, missileY + 10, enemyX2 + 30, enemyY2 + 30) < 10 + 30){
      points = points + 4;
      missileFired = false;
      enemyX2 = 991;
      enemyY2 = random(10, 530);
    }

    if (dist(missileX + 10, missileY + 10, enemyX3 + 30, enemyY3 + 30) < 10 + 30) {
      points = points + 4;
      missileFired = false;
      enemyX3 = 991;
      enemyY3 = random(10, 530);
    }

    if (dist(missileX + 10, missileY + 10, enemyX4 + 30, enemyY4 + 30) < 10 + 30) {
      points = points + 4;
      missileFired = false;
      enemyX4 = 991;
      enemyY4 = random(10, 530);
    }

    if (dist(missileX + 10, missileY + 10, enemyX5 + 30, enemyY5 + 30) < 10 + 30) {
      points = points + 4;
      missileFired = false;
      enemyX5 = 991;
      enemyY5 = random(10, 530);
    }

    // Remove missile when it goes off-screen
    if (missileX > width) {
      missileFired = false;
    }
  }
  
    // Collision (Enemy + Defender), lives -1 , if  enemy  touches defender lives -1 
    
     if (dist(defenderX + 30, defenderY + 30, enemyX1 + 20, enemyY1 + 20) < 30 + 20) {
      lives = lives -1;
      missileFired = false;
      enemyX1 = 991;
      enemyY1 = random(10, 530);
    }
    
     if (dist(defenderX + 30, defenderY + 30, enemyX2 + 20, enemyY2 + 20) < 30 + 20) {
      lives = lives -1;
      missileFired = false;
      enemyX2 = 991;
      enemyY2 = random(10, 530);
    }
    
     if (dist(defenderX + 30, defenderY + 30, enemyX3 + 20, enemyY3 + 20) < 30 + 20) {
      lives = lives -1;
      missileFired = false;
      enemyX3 = 991;
      enemyY3 = random(10, 530);
    }
    
     if (dist(defenderX + 30, defenderY + 30, enemyX4 + 20, enemyY4 + 20) < 30 + 20) {
      lives = lives -1;
      missileFired = false;
      enemyX4 = 991;
      enemyY4 = random(10, 530);
    }
    
    if (dist(defenderX + 30, defenderY + 30, enemyX5 + 20, enemyY5 + 20) < 30 + 20) {
      lives = lives -1;
      missileFired = false;
      enemyX5 = 991;
      enemyY5 = random(10, 530);
    }
    
      // Make enemies move
    
  enemyX1 = enemyX1 - 1.3;
  enemyX2 = enemyX2 - 1.3;
  enemyX3 = enemyX3 - 1.3;
  enemyX4 = enemyX4 - 1.3;
  enemyX5 = enemyX5 - 1.3;
  

  // Enemy go off-screen, lives -1
   
  if (enemyX1 < -100) {
    lives = lives -1;
    enemyX1 = width;
    enemyY1 = random(10, 530);
  }

  if (enemyX2 < -100) {
    lives = lives -1;
    enemyX2 = width;
    enemyY2 = random(10, 530);
  }

  if (enemyX3 < -100) {
    lives = lives -1;
    enemyX3 = width;
    enemyY3 = random(10, 530);
  }

  if (enemyX4 < -100) {
    lives = lives -1;
    enemyX4 = width;
    enemyY4 = random(10, 530);
  }

  if (enemyX5 < -100) {
    lives = lives -1;
    enemyX5 = width;
    enemyY5 = random(10, 530);
  }

  // Score and lives
  fill(255);
  textSize(20);
  text("Points: " + points, 50, 30);
  text("Lives: " + lives, 40, 60);  
  
}   // end of stage 2
}// End of void draw


//   making my defender move and shoot by pressing wasd and m button

void keyPressed() {
  if (stage == 2 && key == 'm' && !missileFired) {
    missileX = defenderX + 50;
    missileY = defenderY + 25;
    missileFired = true;
  }
}
