class Ring{
  PVector center;
  float radius;
  color myFill;
  color myStroke;
 
 
 Particle testParticle;
  public Ring(){
    center = new PVector(width/2.,height/2.);
    radius =100;
    myStroke = color(0);
    myFill = color(66, 245, 236);
   // testParticle = new Particle(center,radius);
  }
  
   void  display(){
     noStroke();
    //stroke(myStroke);
    fill(myFill);
     ellipse(center.x,center.y,radius*2,radius*2);
     //testParticle.display();
  }
  
  PVector getCenter(){
   return center.copy(); 
  }
  
  float getRadius(){
    return radius;
  }
}
