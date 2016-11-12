class oTwo
{
  float cx;
  float cy;
  float size;
  float startAngle;
  float oxygenLevel;
  float finishAngle;
  String oxLevel;
  
  oTwo(float cx, float cy, float size, float startAngle, float oxygenLevel, String oxLevel)
  {
    this.cx = cx; 
    this.cy = cy;
    this.size = size;
    this.startAngle = (startAngle / 100) * 360;
    this.oxygenLevel = oxygenLevel;
    finishAngle = (oxygenLevel / 100) * 360;
    this.oxLevel = oxLevel;
  }
   
  void circle()
  {
    stroke(255);
    strokeWeight(2);
    fill(59, 71, 72);
    ellipse(cx, cy, size, size);
    textAlign(CENTER);
    fill(255);
    textSize(size / 6);
    text(oxLevel, cx, cy - (size / 8));
    text(nf(oxygenLevel, 0, 1) + "%", cx, cy + (size / 8));
  }
  
  void outerBlueArc()
  {
    stroke(36, 231, 255);
    strokeWeight(7);
    noFill();
    arc(cx, cy, size, size, -HALF_PI + radians(startAngle), radians(finishAngle) - HALF_PI);
  }
  
  void outerRedArc()
  {
    stroke(250, 48, 38);
    strokeWeight(7);
    noFill();
    arc(cx, cy, size, size, -HALF_PI, -HALF_PI + radians(startAngle));
  }
  
  /*void decrease()
  {
    oxygenLevel--;
  }*/
}