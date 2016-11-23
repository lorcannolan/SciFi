class Earth 
{
  PVector topLeft;
  float w;
  float h;
  
  PShape shape;
  
  Earth (float x, float y, float w, float h)
  {
    topLeft = new PVector(x, y);
    this.w = w;
    this.h = h;
    
    create();
  }
  
  void create()
  {
     shape = createShape();
     shape.beginShape();
     shape.stroke(255);
     shape.strokeWeight(2);
     shape.fill(0);
     println("Co-ordinates:");
     shape.vertex(topLeft.x + w / 6, topLeft.y);
     shape.vertex(topLeft.x, topLeft.y + h / 6);
     shape.vertex(topLeft.x, topLeft.y + (h - h / 6));
     shape.vertex(topLeft.x + w / 6, topLeft.y + h);
     shape.vertex(topLeft.x + (w - w / 6), topLeft.y + h);
     shape.vertex(topLeft.x + w, topLeft.y + (h - h / 6));
     shape.vertex(topLeft.x + w, topLeft.y + h / 6);
     shape.vertex(topLeft.x + (w - w / 6), topLeft.y);
     shape.endShape(CLOSE);
  }
  
  void display()
  {
    shape(shape, 0, 0);
    tint(255);
    image(myAnimation, topLeft.x + w / 24, topLeft.y + h / 24);
  }
}