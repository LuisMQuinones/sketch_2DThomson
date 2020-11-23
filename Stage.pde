class Stage{
  color myFill;
  Ring ring;
  ParticleSystem ps;
  
  public Stage(){
    myFill = color(255,255,0);
    ring = new Ring();
    
    PVector center = new PVector(width/2.,height/2.);
    ps = new ParticleSystem(center,100);

  }

 
  void display(){
   background(myFill); 
   ring.display();
   
   ps.run();
   
  }
  
}
