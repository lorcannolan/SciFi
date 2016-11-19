class Temp
{
  PVector topLeft;
  float size;
  color c1;
  color c2;
  
  Temp(float x, float y, float size, color c1, color c2)
  {
    topLeft = new PVector(x, y);
    this.size = size;
    this.c1 = c1;
    this.c2 = c2;
  }
  
  void display()
  {
    pushMatrix();
    translate(topLeft.x, topLeft.y);
    for (float i = 0; i < size; i++)
    {
      float inter = map(i, 0, size, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      strokeWeight(2);
      noFill();
      line(0, i, size, i);
    }
    popMatrix();
    stroke(255);
    line(topLeft.x, tempLine, topLeft.x + size, tempLine);
  }
  
  void increase()
  {
    strokeWeight(2);
    stroke(255);
    noFill();
    rect(topLeft.x - size / 2, topLeft.y, size / 2.5, size / 2.5);
    line((topLeft.x - size / 2) + (size / 2.5) / 2, topLeft.y + (size / 10), (topLeft.x - size / 2) + (size / 2.5) / 2, topLeft.y + (size / 2.5) - (size / 10));
    line((topLeft.x - size / 2) + (size / 10), topLeft.y + (size / 2.5) / 2, (topLeft.x - size / 2) + (size / 2.5) - (size / 10), topLeft.y + (size / 2.5) / 2);
    if (mouseX >= topLeft.x - size / 2 && mouseY >= topLeft.y && mouseX <= (topLeft.x - size / 2) + size / 2.5 && mouseY <= topLeft.y + size / 2.5)
    {
      fill(255);
      rect(topLeft.x - size / 2, topLeft.y, size / 2.5, size / 2.5);
      stroke(59, 71, 72);
      line((topLeft.x - size / 2) + (size / 2.5) / 2, topLeft.y + (size / 10), (topLeft.x - size / 2) + (size / 2.5) / 2, topLeft.y + (size / 2.5) - (size / 10));
      line((topLeft.x - size / 2) + (size / 10), topLeft.y + (size / 2.5) / 2, (topLeft.x - size / 2) + (size / 2.5) - (size / 10), topLeft.y + (size / 2.5) / 2);
      if (mousePressed)
      {
        if(tempLine > topLeft.y)
        {
          tempLine -= .1;
        }
      }
    }
  }
  
  void decrease()
  {
    strokeWeight(2);
    stroke(255);
    noFill();
    rect(topLeft.x - size / 2, topLeft.y + size / 2, size / 2.5, size / 2.5);
    line((topLeft.x - size / 2) + (size / 10), (topLeft.y + size / 2) + (size / 2.5) / 2, (topLeft.x - size / 2) + (size / 2.5) - (size / 10), (topLeft.y + size / 2) + (size / 2.5) / 2);
    if (mouseX >= topLeft.x - size / 2 && mouseY >= topLeft.y + size / 2 && mouseX <= (topLeft.x - size / 2) + size / 2.5 && mouseY <= topLeft.y + size)
    {
      fill(255);
      rect(topLeft.x - size / 2, topLeft.y + size / 2, size / 2.5, size / 2.5);
      stroke(59, 71, 72);
      line((topLeft.x - size / 2) + (size / 10), (topLeft.y + size / 2) + (size / 2.5) / 2, (topLeft.x - size / 2) + (size / 2.5) - (size / 10), (topLeft.y + size / 2) + (size / 2.5) / 2);
      if (mousePressed == true)
      {
        if (tempLine < topLeft.y + size)
        {
          tempLine += .1;
        }
      }
    }
  }
  
  void tempValue()
  {
    textAlign(CENTER);
    textSize(size / 2);
    fill(255);
    float degreesCel = map(tempLine, topLeft.y, topLeft.y + size, 24, 20);
    text(nf(degreesCel, 0, 1) + "\u00b0" + "C", width - (width / 8) * 3, height - (height / 8));
  }
}