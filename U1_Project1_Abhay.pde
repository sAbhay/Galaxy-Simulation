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

void setup()
{
  cam = new PeasyCam(this, cameraX, cameraY, cameraZ, 500);
  cam.setMaximumDistance(7500);
  cam.setMinimumDistance(0);
  
  movementSpeed = 30;

  fullScreen(P3D);

  sphereDetail(5);
}

void draw()
{
  background(0);

  /*cam = new PeasyCam(this, cameraX, cameraY, cameraZ, 500);
  cam.setMaximumDistance(3000);
  cam.setMinimumDistance(0);*/


  for (int i = 0; i < 5; i++)
  { 
    s.add(new Star(random(-2500, 2500), random(-2500, 2500), random(-750, 750), random(5, 8), (int) random(8)));
  }

  for (int i = 0; i < s.size() - 1; i++)
  {
    s.get(i).display();

    //while (i > 100)
    //{
    //  s.remove(i);
    //}
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