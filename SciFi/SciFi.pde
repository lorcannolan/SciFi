oTwo oxygen;
Temp temperature;
Fuel fuel;
Menu menu;
Crew astronauts;
//BackG back;
PFont font;
void setup()
{
  //fullScreen();
  size(1000, 700);
  font = createFont("AR DESTINE", 60);
  textFont(font);
  emergencyOx = 14;
  oxStartAngle = (emergencyOx / 100) * 360;
  oxygenLevel = random(90, 100);
  oxFinishAngle = (oxygenLevel / 100) * 360;
  oxygen = new oTwo(width / 3, height / 8,  width / 10, "o2 Level:");
  temperature = new Temp(width - (width / 8), height / 4,  width / 10, color(255, 0, 0), color(0, 0, 255));
  fuelLevel = random(75, 100);
  fuel = new Fuel(width / 3 - (width / 10) / 2, height / 2, (width / 10) * 3, (width / 10) / 2);
  bottomLineY1 = height - (height / 5);
  bottomLineY2 = height - (height / 4);
  bottomLineX1 = width - (width / 25);
  bottomLineX2 = width - 3 * (width / 4);
  gap = width / 300;
  col1 = color(59, 71, 72);
  col2 = color(0, 103, 111);
  menu = new Menu(bottomLineY1 - bottomLineY2, bottomLineX2 - gap, ((bottomLineY2 - (bottomLineY1 - bottomLineY2)) - (bottomLineY1 - bottomLineY2)));
  //back = new BackG(0, 0, width, height, col1, col2);
  tempLine = height / 4 + (width / 10) / 2;
}

float bottomLineY1, bottomLineY2, bottomLineX1, bottomLineX2, gap;
color col1, col2;
int chosenMenu = 1;
float oxygenLevel, emergencyOx, oxStartAngle, oxFinishAngle;
float tempLine;
float fuelLevel;

void draw()
{
  background(59, 71, 72);
  //back.gradient();
  drawLines();
  oxygen.value();
  oxygen.decrease();
  temperature.tempValue();
  fuel.decrease();
  fuel.value();
  menu.options();
  menu.hover();
  if (chosenMenu == 3)
  {
      oxygen.circle();
      oxygen.outerBlueArc();
      oxygen.outerRedArc();
      oxygen.increase();
      temperature.display();
      temperature.increase();
      temperature.decrease();
      fuel.display();
      fuel.increase();
  }
  if (chosenMenu == 4)
  {
    exit();
  }
}

void drawLines()
{
  strokeWeight(1);
  stroke(255);
  //stroke(234, 228, 12);
  
  //drawing bottom box
  line(width, bottomLineY1, bottomLineX1, bottomLineY2 + gap);
  line(bottomLineX1, bottomLineY2 + gap, bottomLineX2 + (width - bottomLineX1), bottomLineY2 + gap);
  line(bottomLineX2 + (width - bottomLineX1), bottomLineY2 + gap, bottomLineX2 + gap, bottomLineY1);
  line(bottomLineX2 + gap, bottomLineY1, bottomLineX2 + gap, height - (bottomLineY1 - bottomLineY2));
  line(bottomLineX2 + gap, height - (bottomLineY1 - bottomLineY2), bottomLineX2 + (width - bottomLineX1), height);
  
  //drawing corner box
  line(0, bottomLineY1, width / 25, bottomLineY2 + gap);
  line(width / 25, bottomLineY2 + gap, bottomLineX2 - (width - bottomLineX1), bottomLineY2 + gap);
  line(bottomLineX2 - (width - bottomLineX1), bottomLineY2 + gap, bottomLineX2 - gap, bottomLineY1);
  line(bottomLineX2 - gap, bottomLineY1, bottomLineX2 - gap, height - (bottomLineY1 - bottomLineY2));
  line(bottomLineX2 - gap, height - (bottomLineY1 - bottomLineY2), bottomLineX2 - (width - bottomLineX1), height);
  
  //drawing left box
  line(0, bottomLineY2 - (bottomLineY1 - bottomLineY2), width / 25, bottomLineY2 - gap);
  line(width / 25, bottomLineY2 - gap, bottomLineX2 - (width - bottomLineX1), bottomLineY2 - gap);
  line(bottomLineX2 - (width - bottomLineX1), bottomLineY2 - gap, bottomLineX2 - gap, bottomLineY2 - (bottomLineY1 - bottomLineY2));
  line(bottomLineX2 - gap, bottomLineY2 - (bottomLineY1 - bottomLineY2), bottomLineX2 - gap, 0 + (bottomLineY1 - bottomLineY2));
  line(bottomLineX2 - gap, 0 + (bottomLineY1 - bottomLineY2), bottomLineX2 - (width - bottomLineX1), 0);
  
  //drawing main box
  line(bottomLineX2 + (width - bottomLineX1), 0, bottomLineX2 + gap, 0 + (bottomLineY1 - bottomLineY2));
  line(bottomLineX2 + gap, 0 + (bottomLineY1 - bottomLineY2), bottomLineX2 + gap, bottomLineY2 - (bottomLineY1 - bottomLineY2));
  line(bottomLineX2 + gap, bottomLineY2 - (bottomLineY1 - bottomLineY2), bottomLineX2 + (width - bottomLineX1), bottomLineY2 - gap);
  line(bottomLineX2 + (width - bottomLineX1), bottomLineY2 - gap, bottomLineX1, bottomLineY2 - gap);
  line(bottomLineX1, bottomLineY2 - gap, width, bottomLineY2 - (bottomLineY1 - bottomLineY2));
}