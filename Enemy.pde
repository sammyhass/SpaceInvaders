class Enemy {
  int x, y;
  int hitpoints;
  int moveDirection = 1;// -1 for left, +1 for right, 0 for still
  final int initX, initY;
  final int speedMultiplier = 2;
  
  static final int moveRange = 50;
  static final int size = 40;
  
  PImage image;
 
  
  Enemy(int x, int y) {
    this.x = x;
    this.y = y;
    this.initX = x;
    this.initY = y;
    this.hitpoints = 100;
  
  }
  
  void setImage(PImage image) {
    this.image = image;
  }
  
  Enemy(int x, int y, int hitpoints) {
    this.x = x;
    this.y = y;
    this.initX = x;
    this.initY = y;
    this.hitpoints = hitpoints;
  }
  
  
  void show() {
    tint(255, (int) hitpoints * 0.01 * 255);
    image(image, x, y, size, size);
  }
  
  void move(int disp) {
    x += disp;
  }
   
  void update() {
    move(moveDirection * speedMultiplier);
    if (x > initX + moveRange || x < initX - moveRange || x > width || x < 0) {
      moveDirection *= -1;
      y += 10;
    };
    
  }
  
  boolean calculateHit(Player.Bullet b) {
    if (b.y > y && b.y < y + size && b.x > x - size && b.x < x + size) { 
      hitpoints -= b.damage; 
      b.didHit = true;
      return true;
    }
    return false;
  }
  
} 
