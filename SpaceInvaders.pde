Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
int currentLevel = 1;
int currentScore = 0;
boolean gameOver = false;

PImage enemyImage;
void setup() {
  background(0);
  size(800, 600);
  rectMode(CENTER);
  player = new Player();
  
  enemyImage = loadImage("enemy.png");
  
  for (int i = 0; i < 10; i++) {
    Enemy newEnemy = new Enemy((int) random(width), (int) random(height - 300));
    newEnemy.setImage(enemyImage);
    enemies.add(newEnemy);
  }
}
void draw() {
  background(0);
  player.show();
  player.update();
  ArrayList<Enemy> deadEnemies = new ArrayList<Enemy>();
  
   for (Enemy e : enemies) {
    e.update();
    e.show();
    if (e.hitpoints <= 0) {
      deadEnemies.add(e);
      currentScore += 100 * currentLevel;
    }
    for (Player.Bullet b : player.bullets) {
      if(e.calculateHit(b)) {
        currentScore += 10 * currentLevel;
      };
    }
    
    if (e.y > player.y) {
      gameOver = true;
    }
  }
  
  if (gameOver) {
    fill(255);
    textSize(25);
    text("GAME OVER", 0, 100);
    text("Level: " + currentLevel + " Score: " + currentScore, 0, 150);
    noLoop();
  
    
  }

  for (Enemy e : deadEnemies) {
    enemies.remove(e);
  }
  
  if (enemies.size() == 0) {
    currentScore *= 10;
    currentLevel += 1;
    for (int i = 0; i < 10; i++) {
      Enemy newEnemy = new Enemy((int) random(width), (int) random(height - 300), currentLevel * 50);
      newEnemy.setImage(enemyImage);

      enemies.add(newEnemy);
    }
  }
  
  fill(255);
  textSize(20);
  text("Level: " + currentLevel, 10, height - 50);
  text("Score: " + currentScore, 10, height - 30);
  
  
}

void keyPressed() {
  if (key == 32) {
    if (!gameOver) { 
      player.fireBullet();
    } else {
      gameOver = false;
      enemies.clear();
      for (int i = 0; i < 10; i++) {
        Enemy newEnemy = new Enemy((int) random(width), (int) random(height - 300));
        newEnemy.setImage(enemyImage);
        enemies.add(newEnemy);
      }
      currentLevel = 1;
      currentScore = 0;
      redraw();
      loop();
    }
  }
}

void mousePressed() {
  if (!gameOver) { 
      player.fireBullet();
    } else {
      gameOver = false;
      enemies.clear();
      for (int i = 0; i < 10; i++) {
        Enemy newEnemy = new Enemy((int) random(width), (int) random(height - 300));
        enemies.add(newEnemy);
      }
      currentLevel = 1;
      currentScore = 0;
      redraw();
      loop();
    }
}
