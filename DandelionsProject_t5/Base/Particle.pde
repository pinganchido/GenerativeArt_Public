class Particle{
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float rotation;
  float ro_a;
  
  float lifespan;//alpha
  
  Dandelions tanpopoParticle = new Dandelions();
  
  int lineNum;
  color[] c;
  
  
  Particle(PVector p){
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-4, 4), random(-4, 4));
    position = p.copy();
    lifespan = 255.0;
    
    rotation = random(-180, 180);
    ro_a = random(-15, 15);
    
    
    int diceNum = int(random(1, 21));
    
      
    if(diceNum <= 6){
      lineNum = 1;
    }
    else if(diceNum <= 1){
      lineNum = 2;
    }
    else if(diceNum <= 12){
      lineNum = 3;
    }
    else if(diceNum <= 19){
      lineNum = 4;
    }
    else{
      lineNum = 5;
    }
    
    c = new color[lineNum];
    for(int i = 0; i < lineNum; i++){
      
        int diceNumc = int(random(1, 6));
     
       color circleColor = color(255, 255, 255);
       switch(diceNumc){
         ///*
         case 1://blue
            circleColor = color(100, 244, 255);//color(138, 244, 255);
           break;
         case 2://y
           circleColor = color(255, 252, 100);//color(255, 252, 138);
           break;
         case 3://r
           circleColor = color(255, 80, 80);//color(255, 102, 102);
           break;
         case 4://g
           circleColor = color(120, 230, 120);//color(162, 230, 164);
           break;
         case 5://p
           circleColor = color(208, 163, 233);//color(250, 197, 250);      
           break;
         default:
           break;
         //*/
         /*
         case 1://blue
            circleColor = color(138, 244, 255);
           break;
         case 2://y
           circleColor = color(255, 252, 138);
           break;
         case 3://r
           circleColor = color(255, 102, 102);
           break;
         case 4://g
           circleColor = color(162, 230, 164);
           break;
         case 5://p
           circleColor = color(250, 197, 250);      
           break;
         default:
           break;
         */
       }
       c[i] = circleColor;
    }
    
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    acceleration = new PVector(random(-0.8, 0.8), random(-0.8, 0.8));
    velocity.add(acceleration); 
    position.add(velocity);
    lifespan -= 1.0;
    //rotation += PI / 2;
    rotation += ro_a;
  }
  
  void display(){
    tanpopoParticle.display(lifespan, position, lineNum, c, rotation);
    /*
    stroke(255, lifespan);
    fill(255, lifespan);
    ellipse(position.x, position.y, 8, 8);
    */
  }
  
  boolean isDead() {
    if (lifespan < 0.0 ) {
      if(position.x < -10 || position.y < 10 || position.x > 1290 || position.y > 1290){
        return true;
      }
      return false;
    } else {
      return false;
    }
  }
  
  
  
  

  
}
