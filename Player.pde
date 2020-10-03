class Player {
  int x;
  int paddleWidth = 50;
  int paddleHeight = 50;
  
  int y = height - paddleHeight * 2;

  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
  static final int MOVE_DISTANCE = 15;
  
  PImage img;
  
  Player() {
    x = width / 2;
    this.img = loadImage("cannon.png");
  }
  
  void show() {
    noFill();
    noTint();
    noStroke();
    image(img, x, y, paddleWidth, paddleHeight);
  }
  
  void goTo(int x) {
    this.x = x;
  }
  
  void update() {
    ArrayList<Bullet> bulletsHit = new ArrayList<Bullet>();
    for (Bullet b : bullets) {
      if (b.didHit) {
        bulletsHit.add(b);
      }
      b.update();
      b.show();
    }
    
    for (Bullet b : bulletsHit) {
      bullets.remove(b);
    }
    goTo(mouseX);
  }
  
  void fireBullet() {
    Bullet bullet = new Bullet(x + paddleWidth /2, y);
    bullets.add(bullet);
  }
  
  class Bullet {
    int x, y;
    static final int SPEED = 5;
    boolean didHit = false;
    int damage = 20;
    
    Bullet(int x, int y) {
      this.x = x;
      this.y = y;
    }
    
    void update() {
      this.y -= SPEED;
    }
    
    void show() {
      fill(150);
      ellipse(x, y, 5, 5);
    }
    
  }
}
