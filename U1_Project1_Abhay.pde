import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

ArrayList<star> s = new ArrayList<star>();
ArrayList<planet> p = new ArrayList<planet>();

int k;

void setup()
{
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMaximumDistance(3000);
  cam.setMinimumDistance(0);

  fullScreen(P3D);

  sphereDetail(2);
}

void draw()
{
  background(0);
  
  k += 8;

  for (int i = 0; i < 5; i++)
  { 
    s.add(new star(random(-2500, 2500), random(-2500, 2500), random(-2500, 2500), random(2, 5), (int) random(8)));
  }

  for (int i = 0; i < s.size() - 1; i++)
  {
    s.get(i).display();

    //if(i < 10)
    //{
    // s.remove(i); 
    //}
    
    //comment

    if (i != s.size())
    {
      p.add(new planet(s.get(i).x + random(-50, 50), s.get(i).y + random(-50, 50), s.get(i).z + random(-50, 50), random(2), (int) random(9)));
    }

    for (int j = 0; j < p.size(); j++)
    {
      p.get(j).display();

      //if(j > 30)
      //{
      // p.remove(j); 
      //}
    }
  }
}