class Star extends Base
{
  ArrayList<Planet> planet = new ArrayList<Planet>();

  Star(float _x, float _y, float _z, float _size, int _colourScheme)
  {
    super(_x, _y, _z, _size, _colourScheme);

    for (int i = 0; i < (int) random(10); i++)
    {
      planet.add(new Planet(_x + random(-50, 50), _y + random(-5, 5), _z + random(-50, 50), random(2), (int) random(9)));
    }
  }
  
  void display()
  {
   super.display();
   
   for (int i = 0; i < planet.size(); i++)
    {
      planet.get(i).display();
    }
  }
}