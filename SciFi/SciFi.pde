oTwo oxygen;
Menu menu;
PFont font;

void setup()
{
  fullScreen();
  //size(1000, 700);
  font = createFont("AR DESTINE", 60);
  textFont(font);
  oxygen = new oTwo(width - (width / 8), height - (height / 8),  width / 10, 14, random(95, 100), "o2 Level:");
  bottomLineY1 = height - (height / 5);
  bottomLineY2 = height - (height / 4);
  bottomLineX1 = width - (width / 25);
  bottomLineX2 = width - 3 * (width / 4);
  gap = width / 300;
  menu = new Menu(bottomLineY1 - bottomLineY2, bottomLineX2 - gap, ((bottomLineY2 - (bottomLineY1 - bottomLineY2)) - (bottomLineY1 - bottomLineY2)));
  menuX = (bottomLineX2 - gap) / 2;
  menuY1 = bottomLineY2 - 4 * (bottomLineY2 / 5);
  menuY2 = bottomLineY2 - 3 * (bottomLineY2 / 5);
  menuY3 = bottomLineY2 - 2 * (bottomLineY2 / 5);
  menuY4 = bottomLineY2 - (bottomLineY2 / 5);
  menuGap = menuY2 - menuY1;
}

float bottomLineY1, bottomLineY2, bottomLineX1, bottomLineX2, gap;
float menuX, menuY1, menuY2, menuY3, menuY4, menuGap;

void draw()
{
  background(59, 71, 72);
  drawLines();
  oxygen.circle();
  oxygen.outerBlueArc();
  oxygen.outerRedArc();
  oxygen.decrease();
  menu.options();
  menu.hover();
  //drawMenu();
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

void drawMenu()
{
  textAlign(CENTER);
  fill(255);
  textSize(height / 25);
  text("Menu", menuX, menuY1);
  noFill();
  strokeWeight(1);
  stroke(255);
  rect(0, menuY1 / 2, bottomLineX2 - gap, menuGap);
  text("Menu", menuX,  menuY2);
  text("Menu", menuX,  menuY3);
  text("Menu", menuX,  menuY4);
}