class oTwo
{
  PVector centre;
  float size;
  String oxLevel;
  
  oTwo(float x, float y, float size, String oxLevel)
  {
    centre = new PVector(x, y);
    this.size = size;
    this.oxLevel = oxLevel;
  }
  
  void circle()
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    //fill(59, 71, 72);
    ellipse(centre.x, centre.y, size, size);
    textAlign(CENTER);
    fill(255);
    textSize(size / 6);
    text(oxLevel, centre.x, centre.y - (size / 8));
    text(nf(oxygenLevel, 0, 1) + "%", centre.x, centre.y + (size / 8));
  }
  
  void outerBlueArc()
  {
    stroke(36, 231, 255);
    strokeWeight(7);
    noFill();
    arc(centre.x, centre.y, size, size, -HALF_PI + radians(oxStartAngle), radians(oxFinishAngle) - HALF_PI);
  }
  
  void outerRedArc()
  {
    stroke(250, 48, 38);
    strokeWeight(7);
    noFill();
    arc(centre.x, centre.y, size, size, -HALF_PI, -HALF_PI + radians(oxStartAngle));
  }
  
  void decrease()
  {
    if (frameCount % 90 == 0)
    {
        if (oxygenLevel >= emergencyOx)
        {
          oxygenLevel = oxygenLevel - .1;
          oxFinishAngle = (oxygenLevel / 100) * 360;
        }
        else if (oxygenLevel <= emergencyOx && emergencyOx > 0)
        {
          emergencyOx = emergencyOx - .1;
          oxStartAngle = (emergencyOx / 100) * 360;
        }
    }
  }
  
  void value()
  {
    fill(255);
    textAlign(CENTER);
    textSize(size / 4);
    text(oxLevel, width - (width / 8), height - (height / 7));
    textSize(size / 2);
    if (oxygenLevel > emergencyOx)
    {
      fill(36, 231, 255);
    }
    else if (oxygenLevel < emergencyOx)
    {
      fill(250, 48, 38);
    }
    text(nf(oxygenLevel, 0, 1) + "%", width - (width / 8), height - (height / 20));
  }
  
  void increase()
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(centre.x + (size / 1.75), centre.y - (size / 8), size / 1.5, size / 3);
    textAlign(CENTER, CENTER);
    textSize(size / 4);
    fill(255);
    text("Fill", centre.x + size / 1.75 + ((size / 1.5) / 2), centre.y - size / 8 + ((size / 3) / 2.5));
    
    if (mouseX >= centre.x + (size / 1.75) && mouseX <= centre.x + (size / 1.75) + size / 1.5
        && mouseY >= centre.y - (size / 8) && mouseY <= centre.y - (size / 8) + size / 3)
    {
      fill(255, 230);
      rect(centre.x + (size / 1.75), centre.y - (size / 8), size / 1.5, size / 3);
      fill(59, 71, 72);
      text("Fill", centre.x + size / 1.75 + ((size / 1.5) / 2), centre.y - size / 8 + ((size / 3) / 2.5));
      if (mousePressed)
      {
        stroke(59, 71, 72);
        noFill();
        rect(centre.x + (size / 1.75), centre.y - (size / 8), size / 1.5, size / 3);
        oxygenLevel += 25;
        if (oxygenLevel > 100)
        {
          oxygenLevel = 100;
        }
      }
    }
  }
  
  void warning()
  {
    if (oxygenLevel < 14)
    {
      stroke(255);
      fill(230);
      rect(centre.x, centre.y * 4, size * 5.5, size);
      textAlign(CENTER);
      textSize(size / 2.5);
      fill(250, 48, 38);
      text("Warning o2 Level Critical", centre.x + (size * 5.5) / 2, centre.y * 4 + size / 2);
    }
  }
  
  void description()
  {
    textAlign(LEFT);
    textSize(size / 6);
    fill(255);
    text("The oxygen on this shuttle is pumped out from 4 sets of oxygen tanks. "
         + "When one empties out, or the oxygen level is low press fill to refill "
         + "one of the tanks."
         , centre.x + size * 1.5, centre.y - size / 2, size * 4, size);
  }
}