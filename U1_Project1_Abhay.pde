import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

float cameraX = 0;
float cameraY = 0;
float cameraZ = 0;

ArrayList<Star> s = new ArrayList<Star>();

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean depthUp;
boolean depthDown;

float movementSpeed;

float starPlace;

void setup()
{
  cam = new PeasyCam(this, cameraX, cameraY, cameraZ, 500);
  cam.setMaximumDistance(7500);
  cam.setMinimumDistance(500);

  movementSpeed = 30;

  fullScreen(P3D);

  sphereDetail(5);
}

void draw()
{
  background(0);

  starPlace = random(24.5);

  for (int i = 0; i < 5; i++)
  { 
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
  }

  for (int i = 0; i < s.size() - 1; i++)
  {
    s.get(i).display();
  }

  //move();
}

void move()
{
  if (upPressed)
  {
    cameraY -= movementSpeed;
  }

  if (downPressed)
  {
    cameraY += movementSpeed;
  }

  if (leftPressed)
  {
    cameraX -= movementSpeed;
  }

  if (rightPressed)
  {
    cameraX += movementSpeed;
  }

  if (depthUp)
  {
    cameraZ += movementSpeed;
  }

  if (depthDown)
  {
    cameraZ -= movementSpeed;
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
}

void newStar(float rPos, float rZ, float lowStarPlace, float highStarPlace)
{
  if (starPlace >= lowStarPlace && starPlace <= highStarPlace)
  {
    s.add(new Star(random(-rPos, -rPos + 200), random(-rPos, -rPos + 200), random(rZ, 1050 - rZ), random(5, 8), (int) random(8)));
  }
}