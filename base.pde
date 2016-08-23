class Base
{
  
  float x;
  float y;
  float z;
  
  float r;
  float g;
  float b;
  
  float size;
  
  int colourScheme;
  
  Base(float _x, float _y, float _z, float _size, int _colourScheme)
  {
    x = _x;
    y = _y;
    z = _z;
    
    colourScheme = _colourScheme;
    
    size = _size;
    
    if (colourScheme == 1)
    {
      r = random(200, 255);
      g = random(50);
      b = 0;
    }
    
    if (colourScheme == 2)
    {
      r = random(200, 255);
      g = random(50, 150);
      b = 0;
    }

    if (colourScheme == 3)
    {
      r = random(200, 255);
      g = random(50, 200);
      b = 0;
    }

    if (colourScheme == 4)
    {
      r = random(200, 255);
      g = random(200, 255);
      b = 0;
    }
    
    if (colourScheme == 5)
    {
      r = random(225, 255);
      g = random(225, 255);
      b = random(100, 200);
    }
    
    if (colourScheme == 6)
    {
      r = 255;
      g = 255;
      b = 255;
    }
    
    if (colourScheme == 7)
    {
      r = random(100, 200);
      g = random(100, 200);
      b = 255;
    }
    
    if (colourScheme == 8)
    {
      r = random(100, 200);
      g = 255;
      b = random(100, 200);
    }
    
    if (colourScheme == 9)
    {
      r = random(255);
      g = random(255);
      b = random(255);
    }
  }
  
  void display()
  {
    pushMatrix();
    
    translate(x, y, z);
    stroke(r, g, b);
    fill(r, g, b);
    sphere(size);
    
    popMatrix();
  }
}