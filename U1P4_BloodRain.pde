int[] Xs = new int [1000];
int[] Ys = new int [1000];
int x = 25;
int y = 25;
int x2 = 100;
int y2 = 100;
int x3 = 700;
int y3 = 700;
int scene = -1;
void setup()
{
  size(800, 800);

  for (int i=0; i < 1000; i++)
  {
    Xs[i] = (int)random(0, 800);
    Ys[i] = (int)random(0, 800);
  }
}
void draw()
{
  if (scene==-1)
  {
    intro();
  }
ellipse(x3,y3,50,50);
 if (dist(x3, y3, mouseX, mouseY)<25)
  {
    scene=0;
  }
  if (scene==0)
  {
    game();
  }

  if (scene==1)
  {
    loss();
  }
}

void intro()
{
  background(94,47,188);
  text("the goal of this game is to move your mouse to the circle in the top left corner of the screen", 50,50);
  text("Navigate through the blood rain and reach the coveted ellipse to win",50,100);
  text("if the blood rain touches you, you are not an epic gamer",50,150);
  text("move ur mouse to the circle to start u noob",380,380);
  text("you win when the screen goes blue, might only go blue for a second or two but ur still an epic gamer", 200,420);
}

void game()
{
  background(94, 47, 188);
  for (int i=0; i < 1000; i++)
  {
    noStroke();
    ellipse(Xs[i], Ys[i], 10, 10);
    Xs[i] = Xs[i] +  (int)random(-1, 2);
    Ys[i] = Ys[i] + (int)random(-1, 2);


    if (Xs[i] > 825)
    {
      Xs[i] = 0;
    }

    if (dist(Xs[i], Ys[i], mouseX, mouseY)< 5)
    {
      scene=1;
    }
    if (Ys[i] > 825)
    {
      Ys[i] = 0;
    }
  }
  fill(0, 255, 255);

  ellipse(x, y, 100, 100);

  fill(255, 0, 0);
  if (dist(x, y, mouseX, mouseY)<50)
  {
    win();
  }
}

void win()
{
  background(0,0,255);
   text("epic vicroy", 380, 380);
}


void loss()
{
  background(255, 0, 0);  
  fill(0, 0, 0);
  text("u lose", 380, 380);
  text("press 'r' to restart or move your mouse to the black circle", 250,420);
  ellipse(x2, y2, 50, 50);
  fill(255, 0, 0);
  if (dist(x2, y2, mouseX, mouseY)<50)
  {
    scene=-1;
  }
  
    if (keyPressed)
  {
    if (key == 'r')
    {
      scene = -1;
    }
    if(scene== -1)
    {
    intro();
 
    }
  }
}
