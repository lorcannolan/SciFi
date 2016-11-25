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
        while (fuelLevel < 100 && refill != 0)
        {
          fuelLevel += .01;
        }
        if (refill > 0)
        {
          refill -= 1;
        }
      }
    }
  }
  
  void value()
  {
    textAlign(CENTER);
    fill(255);
    textSize((width / 10) / 4);
    text("Feul Level:", width - (width / 8) * 5, height - (height / 7));
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
    text(nf(fuelLevel, 0, 1) + "%", width - (width / 8) * 5, height - (height / 20));
  }
  
  void warning()
  {
    if (fuelLevel < 15)
    {
      stroke(255);
      fill(230);
      rect(tlPos.x + w / 6, tlPos.y / 2, w * 2 - w /6, h * 2);
      textAlign(CENTER);
      textSize(h / 1.3);
      fill(250, 48, 38);
      text("Warning Fuel Level Critical", (tlPos.x + w / 6) + (w * 2 - w /6) / 2, (tlPos.y / 2) + h);
    }
  }
  
  void description()
  {
    textAlign(LEFT);
    textSize(h / 3);
    fill(255);
    text("The shuttle only has " + refill + " refill(s) left so wait until the fuel "
         + "level drops low to to refill again."
         , tlPos.x + w * 1.1, tlPos.y, w * 1.25, h * 2);
  }
}