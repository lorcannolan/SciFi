import gifAnimation.*;
import controlP5.*;
ControlP5 cp5;
Gif myAnimation;
oTwo oxygen;
Temp temperature;
Fuel fuel;
Menu menu;
Earth earth;
PFont font, loginFont;
Table table;
PImage cassidy, rubins, williams, glover, nasa;
void setup()
{
  fullScreen(P2D);
  myAnimation = new Gif(this, "earth.gif");
  myAnimation.play();
  font = createFont("AR DESTINE", 60);
  textFont(font);
  table = loadTable("astronauts.tsv", "header");
  cassidy = loadImage("CJCassidy.jpg");
  rubins = loadImage("KathleenRubins.jpg");
  williams = loadImage("SunitaWilliams.jpg");
  glover = loadImage("VJGlover.jpg");
  nasa = loadImage("nasa.png");
  loadData();
  emergencyOx = 14;
  oxStartAngle = (emergencyOx / 100) * 360;
  oxygenLevel = random(14, 100);
  oxFinishAngle = (oxygenLevel / 100) * 360;
  oxygen = new oTwo(width / 3, height / 8,  width / 10, "o2 Level:");
  temperature = new Temp(width - (width / 8), height / 4,  width / 10, color(255, 0, 0), color(0, 0, 255));
  fuelLevel = random(15, 100);
  fuel = new Fuel(width / 3 - (width / 10) / 2, height / 2, (width / 10) * 3, (width / 10) / 2);
  bottomLineY1 = height - (height / 5);
  bottomLineY2 = height - (height / 4);
  bottomLineX1 = width - (width / 25);
  bottomLineX2 = width - 3 * (width / 4);
  gap = width / 300;
  menu = new Menu(bottomLineY1 - bottomLineY2, bottomLineX2 - gap, ((bottomLineY2 - (bottomLineY1 - bottomLineY2)) - (bottomLineY1 - bottomLineY2)));
  tempLine = height / 4 + (width / 10) / 2;
  picWidth = width / 6.2;
  picHeight = height / 1.92;
  earthWidth = width / 4.5;
  earthHeight = height / 2.6;
  earth = new Earth(bottomLineX2 + (width - bottomLineX1) + picWidth * 2.75, bottomLineY1 - bottomLineY2 + picHeight / 2.5, picWidth * 1.5, picHeight / 1.25);
  startingTime = millis() - (int)random(1500000000, 2000000000);
  distRemaining = (int)random(6000000, 7000000);
  speed = 14400;
  maintCall = 0;
  refill = 2;
  textFieldW = (int)(width / 2.5);
  textFieldH = height / 10;
  bangW = width / 5;
  textSize = height / 25;
  loginFont = createFont("AR DESTINE", textSize);
  nasaW = width / 3.6;
  nasaH = height / 2.3;
  if (chosenMenu == 0)
  { 
    cp5 = new ControlP5(this);
    
    cp5.addTextfield("").setPosition(width / 2 - width / 5, (height / 3) * 1.75).
    setSize(textFieldW, textFieldH).setAutoClear(false).setColor(255).setFont(font);
    
    cp5.addBang("Login").setPosition(width / 2 - width / 10, (height / 4) * 3).setSize(bangW, textFieldH).
    getCaptionLabel().setFont(font).align(ControlP5.CENTER, ControlP5.CENTER);
  }
}

float bottomLineY1, bottomLineY2, bottomLineX1, bottomLineX2, gap;
int chosenMenu = 0;
float oxygenLevel, emergencyOx, oxStartAngle, oxFinishAngle;
float tempLine;
float fuelLevel;
float picWidth, picHeight, chosenCrew, nasaW, nasaH;
float earthWidth, earthHeight;
int startingTime, seconds, minutes, hours, days;
String countdown;
int distRemaining;
long distTravelled;
int speed;
color generate, c1, c2, c3, c4;
String status, status1, status2, status3, status4;
int maintCall;
int refill;
String loginName;
int textFieldW, textFieldH, bangW, textSize;

void draw()
{
  background(59, 71, 72);
  //back.gradient();
  if (chosenMenu != 0)
  {
    drawLines();
    textAlign(CENTER);
    textSize(picWidth / 8);
    fill(255, 249, 57);
    text("Logged in as:", (bottomLineX2 - gap) / 2, bottomLineY1);
    fill(255);
    textSize(picWidth / 6);
    text("Commander", (bottomLineX2 - gap) / 2, bottomLineY1 + bottomLineY1 / 13);
    text(loginName, (bottomLineX2 - gap) / 2, bottomLineY1 + bottomLineY1 / 7);
    oxygen.value();
    oxygen.decrease();
    temperature.tempValue();
    fuel.decrease();
    fuel.value();
    menu.options();
    menu.hover();
    if (frameCount % 10 == 0)
    {
      distRemaining--;
    }
    distTravelled = 56000000 - distRemaining;
    if (chosenMenu == 1)
    {
      textAlign(CENTER);
      textSize(picWidth / 4);
      fill(255, 132, 0);
      text("Ares II Mars Mission", (bottomLineX2 + (width - bottomLineX1)) + (picWidth * 2) + 4, bottomLineY1 - bottomLineY2 + 5);
      fill(255, 249, 57);
      textAlign(LEFT);
      textSize(picWidth / 8);
      text("Time to Destination:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 3);
      timer();
      text("Mission Phase:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 4.5);
      text("Distance Travelled:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 6);
      text("Distance To Destination:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 6.75, picWidth, picWidth / 2);
      text("Speed:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 9.75);
      text("Maintenance:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 11);
      fill(255);
      text(countdown, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 3);
      text("Return Trip", bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 4.5);
      text(distTravelled + " km", bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 6);
      text(distRemaining + " km", bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 8);
      text(speed + " km/h", bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 10);
      text("Waste & Hegiene:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 12);
      text("Fire Safety:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 12.75);
      text("Air Con:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 13.5);
      text("Comms Systems:", bottomLineX2 + (width - bottomLineX1), (bottomLineY1 - bottomLineY2) * 14.25);
      if (maintCall < 4)
      {
        status = maintenance();
        status1 = status;
        fill(generate);
        c1 = generate;
        text(status, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 12);
        status = maintenance();
        status2 = status;
        fill(generate);
        c2 = generate;
        text(status, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 12.75);
        status = maintenance();
        status3 = status;
        fill(generate);
        c3 = generate;
        text(status, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 13.5);
        status = maintenance();
        status4 = status;
        fill(generate);
        c4 = generate;
        text(status, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 14.25);
      }
      fill(c1);
      text(status1, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 12);
      fill(c2);
      text(status2, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 12.75);
      fill(c3);
      text(status3, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 13.5);
      fill(c4);
      text(status4, bottomLineX2 + (width - bottomLineX1) + (picWidth * 1.5), (bottomLineY1 - bottomLineY2) * 14.25);
      textAlign(CENTER);
      fill(255, 249, 57);
      text("Time (GMT):", (bottomLineX2 + (width - bottomLineX1) + picWidth * 2.75) + (picWidth * 1.5) / 2, (bottomLineY1 - bottomLineY2) + picHeight / 4);
      fill(255);
      text(hour() + ":" + minute(), (bottomLineX2 + (width - bottomLineX1) + picWidth * 2.75) + (picWidth * 1.5) / 2, (bottomLineY1 - bottomLineY2) + picHeight / 2.75);
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
      oxygen.description();
      temperature.display();
      temperature.increase();
      temperature.decrease();
      temperature.description();
      fuel.display();
      fuel.increase();
      fuel.description();
    }
    else if (chosenMenu == 4)
    {
      exit();
    }
    oxygen.warning();
    fuel.warning();
  }
  else
  {
    image(nasa, bottomLineX2 + (width - bottomLineX1) + picWidth / 2, (bottomLineY1 - bottomLineY2) * 2, nasaW, nasaH);
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
  countdown = days + "d " + hours + "h " + minutes + "m " + seconds + "s";
}

String maintenance()
{
  int i = (int)random(1, 3);
  if (i == 1)
  {
    generate = color(255, 0, 0);
    status = "Incomplete";
  }
  else
  {
    generate = color(0, 255, 0);
    status = "Complete";
  }
  if (maintCall <= 3)
  {
    maintCall++;
  }
  return status;
}

void Login()
{
  loginName = cp5.get(Textfield.class, "").getText();
  chosenMenu = 1;
  cp5.get("").remove();
  cp5.get("Login").remove();
}