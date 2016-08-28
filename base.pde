class Base
{
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

    sphere = createShape(SPHERE, size);

    if (textureNo == 0)
    { 
      sphere.setTexture(sTexture[(int) random(7)]);
    }

    if (textureNo == 1)
    {
      sphere.setTexture(rPTexture[(int) random(7)]);
    }
    
    if (textureNo == 2)
    {
      sphere.setTexture(gPTexture[(int) random(7)]);
    }
  }

  void display()
  {
    pushMatrix();

    translate(x, y, z);
    shape(sphere);

    popMatrix();
  }
}