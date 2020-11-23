class Particle {
  PVector pos;
  PVector vel;
  PVector acc;
  float radius;

  PVector rC;
  float rR;

  public Particle(PVector c, float r) {
  //  pos = new PVector(random(width/2.-width/4, width/2.+width/4), random(height/2.-height/4, height/2.+height/4));
    
    PVector center = c.copy();
    float ran = random(0,PI*2);
    //pos = new PVector(cos(ran),sin(ran));
    pos = new PVector(center.x+random(10),center.y+random(10));
    println(pos.x,pos.y);
    //pos = new PVector(width/2,random(height/2.-50, height/2.+50));
    vel = new PVector(0,0);
    acc = new PVector();

    radius = 4;

    rC = c.copy();
    rR= r;
   // acc = new PVector(1, 1);
  }
  void tick() {

    vel.add(acc);
    pos.add(vel);
    acc.mult(0); // clear Acceleration

    checkBoundry();
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }

  // Might move this logic to ParticleSystem]
  // Makes it easier to work with outside parameters like the Ring's 
  // origin and radius
  void checkBoundry() {

    if (pos.dist(rC)>rR) {

      PVector normal = PVector.sub(pos, rC);
      float t= 2 *PVector.dot(vel, normal)/PVector.dot(normal, normal);
      normal.mult(t);

      vel.sub(normal);
      vel.mult(.75);



      // fixes the particle to the boundy
      // prevents the particle from leaving boundry and glitching out
      PVector temp = PVector.sub(pos, rC);
      temp.normalize();
      temp.mult(rR);

      pos = PVector.add(rC, temp);
    }
  }
  void display() {


   

    tick();

    fill(0);
    noStroke();


    ellipse(pos.x, pos.y, radius*2., radius*2.);
    
  }
}
