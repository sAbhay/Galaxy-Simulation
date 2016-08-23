import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PeasyCam cam;

ArrayList<Star> s = new ArrayList<Star>();

void setup()
{
  cam = new PeasyCam(this, 0, 0, 0, 500);
  cam.setMaximumDistance(3000);
  cam.setMinimumDistance(0);

  fullScreen(P3D);

  sphereDetail(10);
}

void draw()
{
  background(0);

  for (int i = 0; i < 5; i++)
  { 
    s.add(new Star(random(-2500, 2500), random(-2500, 2500), random(-2500, 2500), random(5, 8), (int) random(8)));
  }

  for (int i = 0; i < s.size() - 1; i++)
  {
    s.get(i).display();
  }
}