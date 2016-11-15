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
  
  void options()
  {
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(menuTop);
    text("Home", menuWidth / 2, (menuHeight / 4) - menuTop);
    text("Crew", menuWidth / 2, 2 * (menuHeight / 4) - menuTop);
    text("Info", menuWidth / 2, 3 * (menuHeight / 4) - menuTop);
    text("More Info", menuWidth / 2, menuHeight - menuTop);
  }
  
  void hover()
  {
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop && mouseY <= menuTop + (menuHeight / 4))
    {
      noStroke();
      fill(255, 230);
      rect(0, menuTop, menuWidth, menuHeight / 4);
      textAlign(CENTER, CENTER);
      fill(59, 71, 72);
      textSize(menuTop);
      text("Home", menuWidth / 2, (menuHeight / 4) - menuTop);
    }
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop + (menuHeight / 4) && mouseY <= menuTop + (menuHeight / 4) * 2)
    {
      noStroke();
      fill(255, 230);
      rect(0, menuTop + (menuHeight / 4), menuWidth, menuHeight / 4);
      textAlign(CENTER, CENTER);
      fill(59, 71, 72);
      textSize(menuTop);
      text("Crew", menuWidth / 2, 2 * (menuHeight / 4) - menuTop);
    }
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop + (menuHeight / 4) * 2 && mouseY <= menuTop + (menuHeight / 4) * 3)
    {
      noStroke();
      fill(255, 230);
      rect(0, menuTop + (menuHeight / 4) * 2, menuWidth, menuHeight / 4);
      textAlign(CENTER, CENTER);
      fill(59, 71, 72);
      textSize(menuTop);
      text("Info", menuWidth / 2, 3 * (menuHeight / 4) - menuTop);
    }
    if (mouseX >= 0 && mouseX <= menuWidth && mouseY >= menuTop + (menuHeight / 4) * 3 && mouseY <= menuTop + (menuHeight / 4) * 4)
    {
      noStroke();
      fill(255, 230);
      rect(0, menuTop + (menuHeight / 4) * 3, menuWidth, menuHeight / 4);
      textAlign(CENTER, CENTER);
      fill(59, 71, 72);
      textSize(menuTop);
      text("More Info", menuWidth / 2, menuHeight - menuTop);
    }
  }
}