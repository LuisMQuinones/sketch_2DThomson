
//Fifty Particles is an interesting example

import java.util.*;
class ParticleSystem{
  
  ArrayList<Particle> particles;
  PVector origin;
  float  ringRadius;
  public ParticleSystem(PVector center,float radius){
    
    particles = new ArrayList<Particle>();
    origin = center.copy();
    ringRadius = radius;
    
    //addParticle(new PVector());addParticle(new PVector());addParticle(new PVector());addParticle(new PVector());
    for(int i=0; i<19;i++){
      addParticle(new PVector());
    }
  }
  
  void addParticle(PVector loc){
   Particle newParticle = new Particle(origin,ringRadius);
   particles.add(newParticle);
   
  }
  
  
  
  void coulombForce(){
    int c = 0;
    for(int i=0; i<particles.size()-1; i++){
      for(int j=i+1; j<particles.size();j++){
      c++;
       Particle p1 = particles.get(i);
       Particle p2 = particles.get(j);
       
       PVector diff = PVector.sub(p1.pos,p2.pos);
       PVector force = diff.copy();
    //  println("force b4 normalize",force);

       force.normalize();
      // println("force after normalize",force);
       force.div(diff.mag()*diff.mag());
       
       // changing the force mult from 1000 to 500 makes it converge more
       // properly
       //force.mult(25);
        force.mult(100);
       p1.applyForce(force);
       p2.applyForce(force.mult(-1)); //oppisite reaction
       
      //println("p1:",i,"p2",j);
      //println("p1:",p1.pos,"p2",p2.pos);   
      //println("diff ",i,j,diff.mag());
      // println("diff mag ",diff.mag());
      // println("force",force);
    }
    }
    //println("number of pairs: ",c);
  }
  
    float energySystem(){
     float energy =0;
     
     for(int i=0; i<particles.size()-1; i++){
      for(int j=i+1; j<particles.size();j++){
     
       Particle p1 = particles.get(i);
       Particle p2 = particles.get(j);
       
     PVector diff = PVector.sub(p1.pos,p2.pos);
     
     energy+= 1/diff.mag();
       
      // println("diff",diff.mag(), ringRadius*2);
      }
      
     }
     return energy;
    }
    void run() {
     // println("framerate",frameRate);
     
     println(energySystem()*100,energySystem()*(100/particles.size()) );
      coulombForce();
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.display();
     
    }
  }
    
  
  
  
}
