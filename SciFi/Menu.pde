class Menu
{
  float menuTop;
  float menuWidth;
  float menuHeight;
  
  Menu(float menuTop, float menuWidth, float menuHeight)
  {
    this.menuTop = menuTop;
    this.menuWidth = menuWidth;
    this.menuHeight = menuHeight;
  }
  
  void hover()
  {
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop && mouseY <= menuTop + (menuHeight / 4))
    {
      strokeWeight(1);
      stroke(255);
      rect(0, menuTop, menuWidth, menuHeight / 4);
    }
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop + (menuHeight / 4) && mouseY <= menuTop + (menuHeight / 4) * 2)
    {
      strokeWeight(1);
      stroke(255);
      rect(0, menuTop + (menuHeight / 4), menuWidth, menuHeight / 4);
    }
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop + (menuHeight / 4) * 2 && mouseY <= menuTop + (menuHeight / 4) * 3)
    {
      strokeWeight(1);
      stroke(255);
      rect(0, menuTop + (menuHeight / 4) * 2, menuWidth, menuHeight / 4);
    }
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop + (menuHeight / 4) * 3 && mouseY <= menuTop + (menuHeight / 4) * 4)
    {
      strokeWeight(1);
      stroke(255);
      rect(0, menuTop + (menuHeight / 4) * 3, menuWidth, menuHeight / 4);
    }
  }
}