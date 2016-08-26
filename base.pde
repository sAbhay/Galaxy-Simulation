class Base
{
  PImage sRed;
  PImage sBlueDark;
  PImage sCyan;
  PImage sBlueLight;
  PImage sGreen;
  PImage sPurple;
  PImage sYellow;

  float x;
  float y;
  float z;

  float r;
  float g;
  float b;

  float size;

  int textureNo;
  
  PShape sphere;

  Base(float _x, float _y, float _z, float _size, int _textureNo)
  {
    x = _x;
    y = _y;
    z = _z;

    textureNo = _textureNo;

    size = _size;
    
    sRed = loadImage("sRed.jpg");
    sBlueDark = loadImage("sBlueDark.jpg");
    sCyan = loadImage("sCyan.jpg");
    sBlueLight = loadImage("sBlueLight.jpg");
    sGreen = loadImage("sGreen.jpg");
    sPurple = loadImage("sPurple.jpg");
    sYellow = loadImage("sYellow.jpg");
    
    sphere = createShape(SPHERE, size);

    if (textureNo == 0)
    {
      sphere.setTexture(sRed);
    }

    if (textureNo == 1)
    {
     sphere.setTexture(sBlueDark);
    }

    if (textureNo == 2)
    {
      sphere.setTexture(sCyan);
    }

    if (textureNo == 3)
    {
      sphere.setTexture(sBlueLight);
    }

    if (textureNo == 4)
    {
      sphere.setTexture(sGreen);
    }

    if (textureNo == 5)
    {
      sphere.setTexture(sPurple);
    }

    if (textureNo == 6)
    {
      sphere.setTexture(sYellow);
    }

    if (textureNo == 7)
    {
      r = random(100, 200);
      g = 255;
      b = random(100, 200);
    }

    if (textureNo == 8)
    {
      r = random(15055);
      g = random(255);
      b = random(255);
    }
  }

  void display()
  {
    pushMatrix();

    translate(x, y, z);
    //stroke(r, g, b);
    //stroke(255);
    //fill(r, g, b);
    //texture(texture);
    //sphere(size);
    shape(sphere);

    popMatrix();
  }
}