/*
Abhay Singhal's Project - Galaxy
 
This is a simulation of a galaxy. 
*/

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

float centerX = 0;
float centerY = 0;
float centerZ = 0;

//declare arraylist of stars
ArrayList<Star> s = new ArrayList<Star>();

//movement
boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean depthUp;
boolean depthDown;

//changing rotation speed
boolean rotSpeedUp;
boolean rotSpeedDown;

//declare speed at which galaxy moves
float movementSpeed = 2;
float rotSpeedChanger = 1;
float rotSpeedChange = 0.01;

//used to stagger star spawn
float starPlace;

//declare arrays for texture images
PImage[] sTexture = new PImage[7]; 
PImage[] rPTexture = new PImage[7]; 
PImage[] gPTexture = new PImage[7]; 

void setup()
{
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMaximumDistance(7500);
  cam.setMinimumDistance(250);

  fullScreen(P3D);

  sphereDetail(20);

  //load star textures
  sTexture[0] = loadImage("sRed.jpg");
  sTexture[1] = loadImage("sBlueDark.jpg");
  sTexture[2] = loadImage("sCyan.jpg");
  sTexture[3] = loadImage("sBlueLight.jpg");
  sTexture[4] = loadImage("sGreen.jpg");
  sTexture[5] = loadImage("sPurple.jpg");
  sTexture[6] = loadImage("sYellow.jpg");

  //load rocky planet textures
  rPTexture[0] = loadImage("rP1.jpg");
  rPTexture[1] = loadImage("rP2.jpg");
  rPTexture[2] = loadImage("rP3.jpg");
  rPTexture[3] = loadImage("rP4.jpg");
  rPTexture[4] = loadImage("rP5.jpg");
  rPTexture[5] = loadImage("rP6.jpg");
  rPTexture[6] = loadImage("rP7.jpg");

  //load gas planet textures
  gPTexture[0] = loadImage("gP1.jpg");
  gPTexture[1] = loadImage("gP2.jpg");
  gPTexture[2] = loadImage("gP3.jpg");
  gPTexture[3] = loadImage("gP4.jpg");
  gPTexture[4] = loadImage("gP5.jpg");
  gPTexture[5] = loadImage("gP6.jpg");
  gPTexture[6] = loadImage("gP7.jpg");

  noStroke();
}

void draw()
{
  background(0);

  translate(centerX, centerY, centerZ);

  int numberOfStars = s.size();

  //use this to control the number of stars you want to render
  //if the sketch lags or freezes, reduce maxStars
  float maxStars = 2000;

  starPlace = random(24.5);

  if (numberOfStars < maxStars + 1)
  {
    for (int i = 0; i < 1; i++)
    { 
      //stagger star spawn placement

      newStar(3000, 490, 0, 1);
      newStar(2800, 455, 1, 2.1);
      newStar(2600, 420, 2.1, 3.3);
      newStar(2400, 385, 3.3, 4.6);
      newStar(2200, 350, 4.6, 5.0);
      newStar(2000, 315, 5.0, 6.5);
      newStar(1800, 280, 6.5, 8.1);
      newStar(1600, 245, 8.1, 9.8);
      newStar(1400, 210, 9.8, 11.6);
      newStar(1200, 175, 11.6, 13.5);
      newStar(1000, 140, 13.5, 15.5);
      newStar(800, 105, 15.5, 17.6);
      newStar(600, 70, 17.6, 19.8);
      newStar(400, 35, 19.8, 22.1);
      newStar(200, 0, 22.1, 24.5);

      //loading bar

      fill(255);
      rect(-100, -20, 200, 40);

      fill(0, 255, 0);
      rect(-100, -20, (numberOfStars/(maxStars/100))*2, 40);

      fill(0);
      text((int) (numberOfStars/(maxStars/100)) + "%", 60, 5);

      fill(255);
    }
  }

  if (numberOfStars > maxStars - 1)
  {
    //display stars

    for (int i = 0; i < s.size() - 1; i++)
    {
      s.get(i).display();
    }
  }

  moveGalaxy();
  changeRotSpeed();
}

void moveGalaxy()
{
  if (upPressed)
  {
    centerY += movementSpeed;
  }

  if (downPressed)
  {
    centerY -= movementSpeed;
  }

  if (leftPressed)
  {
    centerX += movementSpeed;
  }

  if (rightPressed)
  {
    centerX -= movementSpeed;
  }

  if (depthUp)
  {
    centerZ += movementSpeed;
  }

  if (depthDown)
  {
    centerZ -= movementSpeed;
  }
}

void keyPressed()
{
  if (key == 'w')
  {
    upPressed = true;
  }

  if (key == 's')
  {
    downPressed = true;
  }

  if (key == 'a')
  {
    leftPressed = true;
  }

  if (key == 'd')
  {
    rightPressed = true;
  }

  if (key == 'e')
  {
    depthUp = true;
  }

  if (key == 'q')
  {
    depthDown = true;
  }

  if (key == 'r')
  {
    reset();
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      rotSpeedUp = true;
    }

    if (keyCode == DOWN)
    {
      rotSpeedDown = true;
    }
  }
}

void keyReleased()
{
  if (key == 'w')
  {
    upPressed = false;
  }

  if (key == 's')
  {
    downPressed = false;
  }

  if (key == 'a')
  {
    leftPressed = false;
  }

  if (key == 'd')
  {
    rightPressed = false;
  }

  if (key == 'e')
  {
    depthUp = false;
  }

  if (key == 'q')
  {
    depthDown = false;
  }

  if (key == CODED)
  {
    if (keyCode == UP)
    {
      rotSpeedUp = false;
    }

    if (keyCode == DOWN)
    {
      rotSpeedDown = false;
    }
  }
}

void reset()
{
  centerX = 0;
  centerY = 0;
  centerZ = 0;

  rotSpeedChanger = 1;
}

//controls rotation speed

void changeRotSpeed()
{
  if (rotSpeedUp)
  {
    rotSpeedChanger += rotSpeedChange;
  }

  if (rotSpeedDown)
  {
    rotSpeedChanger -= rotSpeedChange;
  }

  if (rotSpeedChanger < 0)
  {
    rotSpeedChanger = 0;
  }

  if (rotSpeedChanger > 2)
  {
    rotSpeedChanger = 2;
  }
}

//spawn star
void newStar(float rPos, float rZ, float lowStarPlace, float highStarPlace)
{
  if (starPlace >= lowStarPlace && starPlace <= highStarPlace)
  {
    s.add(new Star(random(-rPos, -rPos + 200), random(-rPos, -rPos + 200), random(rZ, 1050 - rZ), random(6, 10), 0));
  }
}