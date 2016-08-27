import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

float centerX = 0;
float centerY = 0;
float centerZ = 0;

ArrayList<Star> s = new ArrayList<Star>();

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;
boolean depthUp;
boolean depthDown;

float movementSpeed;

float starPlace;

PImage[] sTexture = new PImage[7]; 

void setup()
{
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMaximumDistance(7500);
  cam.setMinimumDistance(500);

  movementSpeed = 30;

  fullScreen(P3D);

  sphereDetail(10);

  sTexture[0] = loadImage("sRed.jpg");
  sTexture[1] = loadImage("sBlueDark.jpg");
  sTexture[2] = loadImage("sCyan.jpg");
  sTexture[3] = loadImage("sBlueLight.jpg");
  sTexture[4] = loadImage("sGreen.jpg");
  sTexture[5] = loadImage("sPurple.jpg");
  sTexture[6] = loadImage("sYellow.jpg");

  noStroke();
}

void draw()
{
  background(0);

  translate(centerX, centerY, centerZ);

  int numberOfStars = s.size();
  float maxStars = 1500;

  starPlace = random(24.5);

  if (numberOfStars < maxStars + 1)
  {
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

      //loading percentage
      println(numberOfStars/(maxStars/100) + "%   " + millis()/1000 + "     " + numberOfStars);
    }
  }

  if (numberOfStars > maxStars - 1)
  {
    for (int i = 0; i < s.size() - 1; i++)
    {
      s.get(i).display();
      
      println(i/(maxStars/100) + "%");
    }
  }
  move();
}

void move()
{
  if (upPressed)
  {
    centerY -= movementSpeed;
  }

  if (downPressed)
  {
    centerY += movementSpeed;
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

void reset()
{
  centerX = 0;
  centerY = 0;
  centerZ = 0;
}

void newStar(float rPos, float rZ, float lowStarPlace, float highStarPlace)
{
  if (starPlace >= lowStarPlace && starPlace <= highStarPlace)
  {
    s.add(new Star(random(-rPos, -rPos + 200), random(-rPos, -rPos + 200), random(rZ, 1050 - rZ), random(5, 8), 0));
  }
}