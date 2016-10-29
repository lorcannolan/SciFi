PFont font;

void setup()
{
  fullScreen(P2D);
  background(59, 71, 72);
  font = createFont("AR DESTINE", 60);
  textFont(font);
  oxygenLevel = random(0, 100);
  oxygenLevelDegrees = (oxygenLevel / 100) * 360;
}

float c1x;
float c1y;
float oxygenLevel;
float oxygenLevelDegrees;
String o2 = "O2 Level:";

void draw()
{
  drawLines();
  drawBottomCircle();
  drawBottomArc();
}

void drawBottomCircle()
{
  c1x = width - (width / 8);
  c1y = height - (height / 8);
  stroke(255);
  strokeWeight(2);
  fill(59, 71, 72);
  ellipse(c1x, c1y, width / 10, width / 10);
  textAlign(CENTER);
  fill(255);
  textSize(20);
  text(o2, c1x, c1y - (width / 100));
  text((int)oxygenLevel + "%", c1x, c1y + (width / 100));
}

void drawBottomArc()
{
  stroke(36, 231, 255);
  strokeWeight(7);
  noFill();
  arc(c1x, c1y, width / 10, width / 10, -HALF_PI, radians(oxygenLevelDegrees) - HALF_PI);
}

void drawLines()
{
  float bottomLineY1 = height - (height / 5);
  float bottomLineY2 = height - (height / 4);
  float bottomLineX1 = width - (width / 25);
  float bottomLineX2 = width - 3 * (width / 4);
  float gap = width / 300;
  
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
  line( bottomLineX1, bottomLineY2 - gap, width, bottomLineY2 - (bottomLineY1 - bottomLineY2));
}