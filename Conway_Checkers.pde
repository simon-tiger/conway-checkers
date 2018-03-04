int cols = 8;
int rows = 8;
int scl;

boolean[][] checkers = new boolean[cols][rows];
int[] selected = new int[] {-1, -1};

void setup() {
  size(400, 400);
  scl = width / cols;
}

void draw() {
  background(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      fill(102);
      noStroke();
      
      if (i % 2 == 0) {
        if (j % 2 == 0) {
          fill(204);
        }
      } else {
        if (j % 2 == 1) {
          fill(204);
        }
      }
      
      rect(i*scl, j*scl, scl, scl);
      
      if (checkers[i][j]) {
        fill(255, 0, 0);
        ellipse(i*scl + scl/2, j*scl + scl/2, 5*scl/8, 5*scl/8);
      }
    }
  }
  
  int i = selected[0];
  int j = selected[1];
  
  if (i > -1 && j > -1) {
    stroke(0, 0, 255);
    strokeWeight(3);
    noFill();
    rect(i*scl, j*scl, scl, scl);
  }
  
  stroke(255, 0, 0);
  strokeWeight(3);
  line(0, height/2, width, height/2);
}

void keyPressed() {
  if (key == 'c' || key == 'C') {
    int i = int(mouseX / scl);
    int j = int(mouseY / scl);
    
    if (j >= rows/2) {
      checkers[i][j] = true;
    }
  } else if (key == 'd' || key == 'D') {
    int i = selected[0];
    int j = selected[1];
    
    checkers[i][j] = false;
    selected = new int[] {-1, -1};
  } else if (key == CODED) {
    if (keyCode == UP) {
      int i = selected[0];
      int j = selected[1];
      
      if (checkers[i][j-1]) {
        checkers[i][j] = false;
        checkers[i][j-1] = false;
        checkers[i][j-2] = true;
      }
    } else if (keyCode == RIGHT) {
      int i = selected[0];
      int j = selected[1];
      
      if (checkers[i+1][j]) {
        checkers[i][j] = false;
        checkers[i+1][j] = false;
        checkers[i+2][j] = true;
      }
    } else if (keyCode == DOWN) {
      int i = selected[0];
      int j = selected[1];
      
      if (checkers[i][j+1]) {
        checkers[i][j] = false;
        checkers[i][j+1] = false;
        checkers[i][j+2] = true;
      }
    } else if (keyCode == LEFT) {
      int i = selected[0];
      int j = selected[1];
      
      if (checkers[i-1][j]) {
        checkers[i][j] = false;
        checkers[i-1][j] = false;
        checkers[i-2][j] = true;
      }
    }
  }
  
  selected = new int[] {-1, -1};
}

void mousePressed() {
  int i = int(mouseX / scl);
  int j = int(mouseY / scl);
  
  if (checkers[i][j]) {
    selected = new int[] {i, j};
  } else {
    selected = new int[] {-1, -1};
  }
}