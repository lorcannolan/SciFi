class oTwo
{
  PVector centre;
  float size;
  float startAngle;
  float oxygenLevel;
  float emergencyOxygen;
  float finishAngle;
  String oxLevel;
  
  oTwo(float x, float y, float size, float emergencyOxygen, float oxygenLevel, String oxLevel)
  {
    centre = new PVector(x, y);
    this.size = size;
    this.emergencyOxygen = emergencyOxygen;
    startAngle = (emergencyOxygen / 100) * 360;
    this.oxygenLevel = oxygenLevel;
    finishAngle = (oxygenLevel / 100) * 360;
    this.oxLevel = oxLevel;
  }
  
  void circle()
  {
    stroke(255);
    strokeWeight(2);
    fill(59, 71, 72);
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
    arc(centre.x, centre.y, size, size, -HALF_PI + radians(startAngle), radians(finishAngle) - HALF_PI);
  }
  
  void outerRedArc()
  {
    stroke(250, 48, 38);
    strokeWeight(7);
    noFill();
    arc(centre.x, centre.y, size, size, -HALF_PI, -HALF_PI + radians(startAngle));
  }
  
  void decrease()
  {
    if (frameCount % 100 == 0)
    {
        if (oxygenLevel >= emergencyOxygen)
        {
          oxygenLevel = oxygenLevel - .1;
          finishAngle = (oxygenLevel / 100) * 360;
        }
        else if (oxygenLevel <= emergencyOxygen && emergencyOxygen > 0)
        {
          emergencyOxygen = emergencyOxygen - .1;
          startAngle = (emergencyOxygen / 100) * 360;
        }
    }
  }
}