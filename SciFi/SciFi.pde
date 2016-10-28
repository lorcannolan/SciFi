PFont font;

void setup()
{
  fullScreen(P2D);
  background(59, 71, 72);
  font = createFont("AR DESTINE", 60);
  textFont(font);
  oxygenLevel = random(0, 100);
  oxygenLevelDegrees = (oxygenLevel / 100) * 360;
  println(oxygenLevel, oxygenLevelDegrees);
}

float c1x;
float c1y;
float oxygenLevel;
float oxygenLevelDegrees;
String o2 = "O2 Level:";

void draw()
{
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