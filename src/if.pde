color bg=#17181A;

void displayGrid()
{
  for (int i=0; i<width; i+=100)
  {
    stroke(255, 30);
    line(i, 0, i, height);
  }

  for (int j=0; j<height; j+=100)
  {
    stroke(255, 30);
    line(0, j, width, j);
  }

  for (int i=0; i<width; i+=20)
  {
    stroke(255, 20);
    line(i, 0, i, height);
  }

  for (int j=0; j<height; j+=20)
  {
    stroke(255, 20);
    line(0, j, width, j);
  }

  stroke(255, 100);
  line(0, 300, width, 300);
}

void keyPressed() {
  if (key == ESC) {
    key = 0;
  }
}