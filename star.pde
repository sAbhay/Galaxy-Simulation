class Star extends Base
{
  ArrayList<Planet> planet = new ArrayList<Planet>();

  float rot;
  float rotSpeed;
  
  float distance;

  Star(float _x, float _y, float _z, float _size, int _colourScheme)
  { 
    super(_x, _y, _z, _size, _colourScheme);
    
    distance = dist(_x, _y, _z, 0, 0, 0);

    rotSpeed = random(10, 100)/distance;

    for (int i = 0; i < (int) random(10); i++)
    {
      planet.add(new Planet(_x + random(-50, 50), _y + random(-5, 5), _z + random(-50, 50), random(2), (int) random(9)));
    }
  }

  void display()
  { 
    pushMatrix();
    
    rotate(rot);
    rot += rotSpeed;
    
    super.display();
    
    for (int i = 0; i < planet.size(); i++)
    {
      planet.get(i).display();
    }
    
    popMatrix();
  }
}