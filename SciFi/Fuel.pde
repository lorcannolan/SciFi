class Fuel
{
  PVector tlPos;
  float w;
  float h;
  float fuelBar;
  color fuelCol;
  
  Fuel(float x, float y, float w, float h)
  {
    tlPos = new PVector(x, y);
    this.w = w;
    this.h = h;
  }
  
  void display()
  {
    stroke(255);
    noFill();
    strokeWeight(2);
    rect(tlPos.x, tlPos.y, w, h);
    noStroke();
    fill(fuelCol);
    fuelBar = map(fuelLevel, 0, 100, tlPos.x, tlPos.x + w);
    rect(tlPos.x + 1, tlPos.y + 1, fuelBar - 1 - tlPos.x, h - 1);
  }
  
  void decrease()
  {
    if (frameCount % 100 == 0)
    {
      if (fuelLevel > .1)
      {
        fuelLevel -= .1;
      }
    }
  }
  
  void increase()
  {
    stroke(255);
    strokeWeight(2);
    noFill();
    rect(tlPos.x + w / 3, (tlPos.y + h) + h / 10, w / 3, h / 1.25);
    textAlign(CENTER);
    textSize(h / 2);
    fill(255);
    text("Re-Fuel", tlPos.x + w / 2, ((tlPos.y + h) + h / 10) + h / 1.75);
    if (mouseX >= tlPos.x + w / 3 && mouseX <= (tlPos.x + w / 3) + (w / 3) && mouseY >= (tlPos.y + h) + h / 10 && mouseY <= (((tlPos.y + h) + h / 10) + h / 1.25))
    {
      fill(255, 230);
      rect(tlPos.x + w / 3, (tlPos.y + h) + h / 10, w / 3, h / 1.25);
      fill(59, 71, 72);
      text("Re-Fuel", tlPos.x + w / 2, ((tlPos.y + h) + h / 10) + h / 1.75);
      if (mousePressed)
      {
        stroke(59, 71, 72);
        noFill();
        rect(tlPos.x + w / 3, (tlPos.y + h) + h / 10, w / 3, h / 1.25);
        fuelLevel = 100;
      }
    }
  }
  
  void value()
  {
    textAlign(CENTER);
    textSize((width / 10) / 2);
    if (fuelLevel > 66)
    {
      fuelCol = color(0, 255, 0);
    }
    else if (fuelLevel < 66 && fuelLevel > 25)
    {
      fuelCol = color(250, 200, 18);
    }
    else
    {
      fuelCol = color(250, 48, 38);
    }
    fill(fuelCol);
    text(nf(fuelLevel, 0, 1) + "%", width - (width / 8) * 5, height - (height / 10));
  }
}