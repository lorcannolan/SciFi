class Fuel
{
  PVector tlPos;
  float w;
  float h;
  float fuelBar;
  
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
    if (fuelLevel > 66)
    {
      fill(0, 255, 0);
    }
    else if (fuelLevel < 66 && fuelLevel > 25)
    {
      fill(250, 200, 18);
    }
    else
    {
      fill(250, 48, 38);
    }
    fuelBar = map(fuelLevel, 0, 100, tlPos.x, tlPos.x + w);
    rect(tlPos.x + 1, tlPos.y + 1, fuelBar - 1 - tlPos.x, h - 1);
  }
  
  void decrease()
  {
    if (frameCount % 10 == 0)
    {
      if (fuelLevel > 2)
      {
        fuelLevel--;
        println(fuelLevel);
      }
    }
  }
}