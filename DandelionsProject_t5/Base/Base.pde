Dandelions tanpopo;


ParticleSystem ps;
ParticleSystem ps2;
ParticleSystem ps3;

//color bgColor = color(239, 254, 255);
color bgColor = color(0, 0, 0);

void setup()
{
  //canvas
  //size(1280, 720);
  fullScreen();
  ps = new ParticleSystem(new PVector(width / 5 * 3, height +50));
  ps2 = new ParticleSystem(new PVector(0 - 50, 0));
  ps3 = new ParticleSystem(new PVector(width + 150, height / 2));
  
}
void draw()
{
  
  
  background(bgColor);
  delay(100);
  
  ps.addParticle();
  ps.run();
  
  ps2.addParticle();
  ps2.run();
  ps3.addParticle();
  ps3.run();
  /*
//translate(120, 80);
//rect(0, 0, 220, 220);
 // pushMatrix();
    PVector position = new PVector(width/2, 150);
    noStroke();
    //fill(brown, lifespan);
    translate(width/2, height / 2);
    rotate(PI/6.0);
    rect(0, 0, 20, 20);
 // popMatrix();
  */
}
void keyPressed(){
  if(key == 'a'){
   //acceleration.add (new PVector(0, 0.1));
  }
  if(key == 'g'){
    
  }
}
void mousePressed() {
  //acceleration.add (new PVector(0, 0.1));
}
