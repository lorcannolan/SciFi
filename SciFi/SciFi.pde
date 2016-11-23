import gifAnimation.*;
Gif myAnimation;
oTwo oxygen;
Temp temperature;
Fuel fuel;
Menu menu;
Earth earth;
//BackG back;
PFont font;
Table table;
PImage cassidy, rubins, williams, glover;
void setup()
{
  fullScreen();
  //size(1000, 700);
  myAnimation = new Gif(this, "earth.gif");
  myAnimation.play();
  font = createFont("AR DESTINE", 60);
  textFont(font);
  table = loadTable("astronauts.tsv", "header");
  cassidy = loadImage("CJCassidy.jpg");
  rubins = loadImage("KathleenRubins.jpg");
  williams = loadImage("SunitaWilliams.jpg");
  glover = loadImage("VJGlover.jpg");
  loadData();
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
  picWidth = width / 6.2;
  picHeight = height / 1.92;
  earthWidth = width / 4.5;
  earthHeight = height / 2.6;
  earth = new Earth(bottomLineX2 + (width - bottomLineX1) + picWidth * 2.65, bottomLineY1 - bottomLineY2 + picHeight / 2.5, picWidth * 1.5, picHeight / 1.25);
  startingTime = millis() - (int)random(1500000000, 2000000000);
}

float bottomLineY1, bottomLineY2, bottomLineX1, bottomLineX2, gap;
color col1, col2;
int chosenMenu = 1;
float oxygenLevel, emergencyOx, oxStartAngle, oxFinishAngle;
float tempLine;
float fuelLevel;
float picWidth, picHeight, chosenCrew;
float earthWidth, earthHeight;
int startingTime, seconds, minutes, hours, days;
String countdown;

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
  if (chosenMenu == 1)
  {
    textAlign(CENTER);
    textSize(picWidth / 4);
    fill(255, 249, 57);
    text("Aether II Mars Mission", (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4, bottomLineY1 - bottomLineY2);
    fill(255);
    textAlign(LEFT);
    textSize(picWidth / 6);
    text("Time to Destination:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 3);
    timer();
    text(countdown, (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2), (bottomLineY1 - bottomLineY2) * 3);
    earth.display();
  }
  else if (chosenMenu == 2 && chosenCrew == 0)
  {
    tint(100);
    image(cassidy, bottomLineX2 + (width - bottomLineX1), bottomLineY1 - bottomLineY2, picWidth, picHeight);
    if (mouseX >= bottomLineX2 + (width - bottomLineX1) && mouseY >= bottomLineY1 - bottomLineY2
        && mouseX <= bottomLineX2 + (width - bottomLineX1) + picWidth && mouseY <= bottomLineY1 - bottomLineY2 + picHeight)
    {
      tint(255);
      image(cassidy, bottomLineX2 + (width - bottomLineX1), bottomLineY1 - bottomLineY2, picWidth, picHeight);
      stroke(255);
      strokeWeight(2);
      noFill();
      rect(bottomLineX2 + (width - bottomLineX1) - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
      fill(255);
      textAlign(LEFT);
      textSize(picWidth / 10);
      text("Name: " + (table.getString(0, "firstname")), bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 1.5 + picHeight);
      textAlign(LEFT);
      text("Surname: " + (table.getString(0, "lastname")), bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 2 + picHeight);
      text("Age:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      textAlign(CENTER);
      text((table.getInt(0, "age")), bottomLineX2 + (width - bottomLineX1) + picWidth / 2, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      if (mousePressed)
      {
        stroke(59, 71, 72);
        strokeWeight(1);
        noFill();
        rect(bottomLineX2 + (width - bottomLineX1) - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
        chosenCrew = 1;
      }
    }
    tint(100);
    image(rubins, (bottomLineX2 + (width - bottomLineX1)) + picWidth + 2, bottomLineY1 - bottomLineY2, picWidth, picHeight);
    if (mouseX >= (bottomLineX2 + (width - bottomLineX1)) + picWidth + 2 && mouseY >= bottomLineY1 - bottomLineY2
    && mouseX <= (bottomLineX2 + (width - bottomLineX1)) + picWidth + 2 + picWidth && mouseY <= bottomLineY1 - bottomLineY2 + picHeight)
    {
      tint(255);
      image(rubins, (bottomLineX2 + (width - bottomLineX1)) + picWidth + 2, bottomLineY1 - bottomLineY2, picWidth, picHeight);
      stroke(255);
      strokeWeight(2);
      noFill();
      rect((bottomLineX2 + (width - bottomLineX1)) + picWidth + 2 - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
      fill(255);
      textAlign(LEFT);
      textSize(picWidth / 10);
      text("Name: " + (table.getString(1, "firstname")), bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 1.5 + picHeight);
      textAlign(LEFT);
      text("Surname: " + (table.getString(1, "lastname")), bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 2 + picHeight);
      text("Age:", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      textAlign(CENTER);
      text((table.getInt(1, "age")), bottomLineX2 + (width - bottomLineX1) + picWidth + 2 + picWidth / 2, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      if (mousePressed)
      {
        stroke(59, 71, 72);
        strokeWeight(1);
        noFill();
        rect((bottomLineX2 + (width - bottomLineX1)) + picWidth + 2 - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
        chosenCrew = 2;
      }
    }
    tint(100);
    image(williams, (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4, bottomLineY1 - bottomLineY2, picWidth, picHeight);
    if (mouseX >= (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4 && mouseY >= bottomLineY1 - bottomLineY2
    && mouseX <= (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4 + picWidth && mouseY <= bottomLineY1 - bottomLineY2 + picHeight)
    {
      tint(255);
      image(williams, (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4, bottomLineY1 - bottomLineY2, picWidth, picHeight);
      stroke(255);
      strokeWeight(2);
      noFill();
      rect((bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4 - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
      fill(255);
      textAlign(LEFT);
      textSize(picWidth / 10);
      text("Name: " + (table.getString(3, "firstname")), bottomLineX2 + (width - bottomLineX1) + (picWidth * 2) + 4, (bottomLineY1 - bottomLineY2) * 1.5 + picHeight);
      textAlign(LEFT);
      text("Surname: " + (table.getString(3, "lastname")), bottomLineX2 + (width - bottomLineX1) + (picWidth * 2) + 4, (bottomLineY1 - bottomLineY2) * 2 + picHeight);
      text("Age:", bottomLineX2 + (width - bottomLineX1) + (picWidth * 2) + 4, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      textAlign(CENTER);
      text((table.getInt(3, "age")), bottomLineX2 + (width - bottomLineX1) + (picWidth * 2) + 4 + picWidth / 2, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      if (mousePressed)
      {
        stroke(59, 71, 72);
        strokeWeight(1);
        noFill();
        rect((bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4 - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
        chosenCrew = 3;
      }
    }
    tint(100);
    image(glover, (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 3) + 6, bottomLineY1 - bottomLineY2, picWidth, picHeight);
    if (mouseX >= (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 3) + 6 && mouseY >= bottomLineY1 - bottomLineY2
    && mouseX <= (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 3) + 6 + picWidth && mouseY <= bottomLineY1 - bottomLineY2 + picHeight)
    {
      tint(255);
      image(glover, (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 3) + 6, bottomLineY1 - bottomLineY2, picWidth, picHeight);
      stroke(255);
      strokeWeight(2);
      noFill();
      rect((bottomLineX2 + (width - bottomLineX1)) + (picWidth * 3) + 6 - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
      fill(255);
      textAlign(LEFT);
      textSize(picWidth / 10);
      text("Name: " + (table.getString(2, "firstname")), bottomLineX2 + (width - bottomLineX1) + (picWidth * 3) + 6, (bottomLineY1 - bottomLineY2) * 1.5 + picHeight);
      textAlign(LEFT);
      text("Surname: " + (table.getString(2, "lastname")), bottomLineX2 + (width - bottomLineX1) + (picWidth * 3) + 6, (bottomLineY1 - bottomLineY2) * 2 + picHeight);
      text("Age:", bottomLineX2 + (width - bottomLineX1) + (picWidth * 3) + 6, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      textAlign(CENTER);
      text((table.getInt(2, "age")), bottomLineX2 + (width - bottomLineX1) + (picWidth * 3) + 6 + picWidth / 2, (bottomLineY1 - bottomLineY2) * 2.5 + picHeight);
      if (mousePressed)
      {
        stroke(59, 71, 72);
        strokeWeight(1);
        noFill();
        rect((bottomLineX2 + (width - bottomLineX1)) + (picWidth * 3) + 6 - 1, bottomLineY1 - bottomLineY2 - 1, picWidth + 1, picHeight + 1);
        chosenCrew = 4;
      }
    }
  }
  else if (chosenMenu == 2 && chosenCrew == 1)
  {
    tint(255);
    textAlign(LEFT, TOP);
    textSize(height / 34);
    image(cassidy, bottomLineX2 + (width - bottomLineX1), bottomLineY1 - bottomLineY2, picWidth, picHeight);
    fill(255, 249, 57);
    text("Firstame: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2));
    text("Surname: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 2);
    text("Age: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 3);
    text("Born: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 4);
    text("Height: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 5);
    text("Weight: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 6);
    text("Profession: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 7);
    text("Bio: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 8);
    for (int i = 0; i < table.getColumnCount(); i++)
    {
      fill(255);
      text((table.getString(0, i)), bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * (i + 1));
    }
    text("NASA astronaut and United States Navy SEAL. Chris Cassidy "
         + "achieved the rank of Captain in the U.S. Navy and Chief "
         + "of the Astronaut Office at NASA. This is his third voyage. "
         + "Chris is the senior most crew member aboard this shuttle.", 
          bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * 8, picWidth * 2, picWidth);
  }
  else if (chosenMenu == 2 && chosenCrew == 2)
  {
    tint(255);
    textAlign(LEFT, TOP);
    textSize(height / 34);
    image(rubins, bottomLineX2 + (width - bottomLineX1), bottomLineY1 - bottomLineY2, picWidth, picHeight);
    fill(255, 249, 57);
    text("Firstame: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2));
    text("Surname: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 2);
    text("Age: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 3);
    text("Born: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 4);
    text("Height: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 5);
    text("Weight: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 6);
    text("Profession: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 7);
    text("Bio: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 8);
    for (int i = 0; i < table.getColumnCount(); i++)
    {
      fill(255);
      text((table.getString(1, i)), bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * (i + 1));
    }
    text("Kathleen \"Kate\" Rubins became the 60th woman to fly in space "
         + "and has spent 115d 02h 22m in space already prior to this mission. "
         + "Kate is a vital member of this crew with her previous experience as "
         + "a flight engineer.", 
          bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * 8, picWidth * 2, picWidth);
  }
  else if (chosenMenu == 2 && chosenCrew == 3)
  {
    tint(255);
    textAlign(LEFT, TOP);
    textSize(height / 35);
    image(williams, bottomLineX2 + (width - bottomLineX1), bottomLineY1 - bottomLineY2, picWidth, picHeight);
    fill(255, 249, 57);
    text("Firstame: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2));
    text("Surname: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 2);
    text("Age: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 3);
    text("Born: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 4);
    text("Height: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 5);
    text("Weight: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 6);
    text("Profession: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 7);
    text("Bio: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 8);
    for (int i = 0; i < table.getColumnCount(); i++)
    {
      fill(255);
      text((table.getString(3, i)), bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * (i + 1));
    }
    text("Sunita \"Suni\" Williams holds the records for total spacewalks by "
         + "a woman (7) and most spacewalk time by a woman (50 hours, 40 minutes). "
         + "On board her final expidition, Suni currently holds the rank of Captain.", 
          bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * 8, picWidth * 2, picWidth);
  }
  else if (chosenMenu == 2 && chosenCrew == 4)
  {
    tint(255);
    textAlign(LEFT, TOP);
    textSize(height / 35);
    image(glover, bottomLineX2 + (width - bottomLineX1), bottomLineY1 - bottomLineY2, picWidth, picHeight);
    fill(255, 249, 57);
    text("Firstame: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2));
    text("Surname: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 2);
    text("Age: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 3);
    text("Born: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 4);
    text("Height: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 5);
    text("Weight: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 6);
    text("Profession: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 7);
    text("Bio: ", bottomLineX2 + (width - bottomLineX1) + picWidth + 2, (bottomLineY1 - bottomLineY2) * 8);
    for (int i = 0; i < table.getColumnCount(); i++)
    {
      fill(255);
      text((table.getString(2, i)), bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * (i + 1));
    }
    text("Victor J. Glover, Jr. was selected as an astronaut in 2013. The California native "
         + "holds a Bachelor of Science in General Engineering, a Master of Science in Flight "
         + "Test Engineering, a Master of Science in Systems Engineering and a Master of "
         + "Military Operational Art and Science.", 
          bottomLineX2 + (width - bottomLineX1) + picWidth * 2, (bottomLineY1 - bottomLineY2) * 8, picWidth * 2, picWidth);
  }
  else if (chosenMenu == 3)
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
  else if (chosenMenu == 4)
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

void loadData()
{
  Table table = loadTable("astronauts.tsv", "header");
}

void timer()
{
  seconds = (-millis() - startingTime) / 1000;
  minutes = seconds / 60;
  hours = minutes / 60;
  days = hours / 24;
  seconds -= minutes * 60;
  minutes -= hours * 60;
  hours -= days * 24;
  countdown = days + "d " + hours + "h " + minutes + "m " + seconds + "s.";
}