class Dandelions{
  int a = 0;
  color brown = color(150, 70, 70);
  float dScale = 1.2;
  float stem = 1.2;
  float circleR = 2.4;
  
  
  void display(float lifespan, PVector position, int lineNum, color[] c, float ro)
  {
    /*
    //pushMatrix();
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
    */
    
    
      pushMatrix();
        noStroke();
        fill(255);
        translate(position.x, position.y);
        rotate(PI/180*ro);
        scale(dScale);
        for(int i = 1; i <= lineNum; i++){
          drawLine_circle(i, c, lineNum, ro);
        }
       
      popMatrix();
    
    
 }
  
  void drawLine_circle(int i, color[] c, int ln, float r){
  
    
    if(i <= ln / 2 ){
    fill(255);
    rotate(PI/180*20 );
    //rect(0, 0, 2, 20);
    strokeWeight(0.1);
    arc(0, 0, stem, 40 , PI / 10, PI / 2);
    }
    else
    {
      
      fill(255);
    rotate(PI/180*20 );
    //rect(0, 0, 2, 20);
    
    arc(0, 0, stem , 40, PI / 2, PI / 1);
    }
    
    
     
     fill(c[i-1]);
     
     circle(20 * cos(PI/2), 20 * sin(PI/2), circleR);
     
  }
    

}
