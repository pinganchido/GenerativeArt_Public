class ParticleSystem{

  ArrayList<Particle> particles;
  PVector origin;
  
  ParticleSystem(PVector position){
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }
  
  void addParticle() {

    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.acceleration = new PVector(random(-1, 1), random(-1, 1));
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

}
