class BackG
{
  PVector startPos;
  float w;
  float h;
  color c1;
  color c2;
  
  BackG(float x, float y, float w, float h, color c1, color c2)
  {
    startPos = new PVector(x, y);
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
  }
  
  void gradient()
  {
    for (float i = startPos.x; i < startPos.x + w; i++)
    {
      float inter = map(i, startPos.x, startPos.x + w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      noFill();
      line(0, startPos.y + i, startPos.x + i, 0);
    }
    for (float i = startPos.x; i <= w - startPos.x; i++)
    {
      float inter = map(i, startPos.x, w - startPos.x, 0, 1);
      color c = lerpColor(c2, c1, inter);
      stroke(c);
      noFill();
      line(w, i - startPos.y, i - startPos.x, h);
    }
  }
}