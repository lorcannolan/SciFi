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
    if (frameCount % 100 == 0)
    {
        if (oxygenLevel >= emergencyOx)
        {
          oxygenLevel = oxygenLevel - .05;
          oxFinishAngle = (oxygenLevel / 100) * 360;
        }
        else if (oxygenLevel <= emergencyOx && emergencyOx > 0)
        {
          emergencyOx = emergencyOx - .05;
          oxStartAngle = (emergencyOx / 100) * 360;
        }
    }
  }
  
  void value()
  {
    if (oxygenLevel > emergencyOx)
    {
      fill(36, 231, 255);
    }
    else if (oxygenLevel <= emergencyOx)
    {
      fill(250, 48, 38);
    }
    textAlign(CENTER);
    textSize(size / 2);
    text(nf(oxygenLevel, 0, 1) + "%", width - (width / 8), height - (height / 10));
  }
}