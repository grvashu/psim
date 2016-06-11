import controlP5.*;

ControlP5 cp5;

Slider s1, s2;
Button b1, b2;


float u = 100;
float t = 0;
float theta = 45;
float x0=20, y0=300;
color bg=#17181A;
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
  cp5 = new ControlP5(this);
  
  s1=new Slider(cp5, "Initial Velocity")
    .setPosition(20, 20)
    .setRange(0, 100)
    .setSize(100, 21)
    .setLabel("Initial Velocity (m/s)")
    .setColor(ControlP5.THEME_RED)
    ;

  s2=new Slider(cp5, "Theta")
    .setPosition(240, 20)
    .setRange(0, 90)
    .setSize(100, 21)
    .setLabel("Theta (deg)")
    .setColor(ControlP5.THEME_RED)
    ;

  b1=new Button(cp5, "Start")
    .setPosition(420, 20)
    .setSize(60, 21)
    .setValue(200)
    .setColor(ControlP5.THEME_RED);

  b1.addCallback(new CallbackListener()
  {
    public void controlEvent(CallbackEvent theEvent)
    {
      if (theEvent.getAction()==ControlP5.PRESS)
      {
        myflag=true;
        u=s1.getValue();
        theta=radians(s2.getValue());
      }
    }
  }
  );

  b2=new Button(cp5, "Reset")
    .setPosition(500, 20)
    .setSize(60, 21)
    .setValue(200)
    .setColor(ControlP5.THEME_RED);

  b2.addCallback(new CallbackListener()
  {
    public void controlEvent(CallbackEvent theEvent)
    {
      if (theEvent.getAction()==ControlP5.PRESS)
      {
        background(bg);
        displayGrid();
      }
    }
  }
  );

  //output var

  s3=new Slider(cp5, "Time")
    .setPosition(20, 320)
    .setRange(0, 20)
    .setSize(100, 21)
    .setLabel("Time(s)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;

  s4=new Slider(cp5, "X Velocity")
    .setPosition(220, 320)
    .setRange(0, 100)
    .setSize(100, 21)
    .setLabel("X Velocity(m/s)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;


  s5=new Slider(cp5, "Y Velocity")
    .setPosition(420, 320)
    .setRange(0, 100)
    .setSize(100, 21)
    .setLabel("Y Velocity(m/s)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;

  s6=new Slider(cp5, "X Displacement")
    .setPosition(20, 360)
    .setRange(0, 2000)
    .setSize(100, 21)
    .setLabel("X Displacement(m)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;

  s7=new Slider(cp5, "Y Displacement")
    .setPosition(220, 360)
    .setRange(0, 2000)
    .setSize(100, 21)
    .setLabel("Y Displacement(m)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;
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
    s6.changeValue(20+x);
    s7.changeValue(300-y);
    
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