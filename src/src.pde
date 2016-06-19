
Slider s1, s2;
Button b1, b2;

float u = 100;
float t = 0;
float theta = 45;
float x0=20, y0=300;
boolean myflag=false;

//output var
Slider s3, s4, s5, s6, s7;

void setup()
{
  size(700, 400);
  noStroke();
  background(bg);
  displayGrid();
  frameRate(10);
  surface.setTitle("psim");
  uiInit();
}

void draw()
{
  if (myflag==true)
  {
    stroke(255);
    float vx=u*cos(theta);
    float vy=u*sin(theta)-9.8*t;
    float x=20+(u*t*cos(theta));
    float y=300-(u*t*sin(theta)-4.9*t*t);

    if (y>300)
    {
      y=300.1;
      t=2*u*sin(theta)/9.8;
      x=20+u*t*cos(theta);
    }

    s3.changeValue(t);
    s4.changeValue(vx);
    s5.changeValue(vy);
    s6.changeValue(u*t*cos(theta));
    s7.changeValue(u*u*sin(theta)*sin(theta)/(2*9.8));

    stroke(255, 0, 0, 200);
    strokeWeight(5);
    point(x, y) ;
    stroke(255, 100);
    strokeWeight(1);
    line(x0, y0, x, y);
    t+=1;

    if (y>300)
    {
      myflag=false;
      t=0;
      x0=20;
      y0=300;
      println("Trajectory end.");
    } else {
      x0=x;
      y0=y;
    }
  }
}