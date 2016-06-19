import controlP5.*;

ControlP5 cp5;

color bg=#17181A;

void uiInit() {
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

  s6=new Slider(cp5, "Range")
    .setPosition(20, 360)
    .setRange(0, 2000)
    .setSize(100, 21)
    .setLabel("Range(m)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;

  s7=new Slider(cp5, "Max.Height")
    .setPosition(220, 360)
    .setRange(0, 2000)
    .setSize(100, 21)
    .setLabel("Max.Height(m)")
    .setColor(ControlP5.THEME_RETRO)
    .lock()
    ;
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