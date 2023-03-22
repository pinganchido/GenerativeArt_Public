class Routes{
  
  
  //circle path
  PVector center;
  float angle;
  float origiangle;
  float radius;
  int direct;
  int circleSpeed;
  
  
  //rect path
  PVector nextPosition;
  float step;
  
  //line path
  PVector velocity;
  PVector acceleration;
  
  float pixelSize;
  
  
  Routes(int colorId)
  {
    Init();
    //useColorId = colorId;
    
  }
  
  
  void Init()
  {
    
    
  }
  float[] InitRoute(int id, PVector currp)
  {
    switch(id)
    {
      case 0:
        return InitCirclePath(currp);
      case 2:
        return InitCirclePath(currp);
      case 4:
        return InitCirclePath(currp);
      case 6:
        return InitCirclePath(currp);
      case 8:
        return InitCirclePath(currp);
      case 14:
        return InitCirclePath(currp);
      case 16:
        return InitLinePath(currp);
        
      default:
        break;
    }
    return new float[]{0, 0, 0};
  }
  PVector GetRoute(int id, PVector currp,float ps)
  {
    pixelSize = ps;
    switch(id)
    {
      case 0:
        return CirclePath(currp);
        
      case 2:
        return CirclePath(currp);
      case 4:
        return CirclePath(currp);
      case 6:
        return CirclePath(currp);
      case 8:
        return CirclePath(currp);
      case 14:
        return CirclePath(currp);
      case 16:
        return LinePath(currp);
        
      default:
        break;
    }
    return currp;
    
  }
  
  PVector CirclePath(PVector currPosition){
    
    
    //println("6 ",degrees(angle));
    
    //println("4 ",currPosition);
    float x = center.x + cos(angle)*radius;
    float y = center.y + sin(angle)*radius;
    //println("5 ",x);
    
    
    
    
    currPosition.x = x;
    currPosition.y = y;
    
    velocity.add(acceleration); 
    CollideCheck2(currPosition);
    //currPosition.add(velocity);
    
    //angle += PI/120;
    angle += direct * PI/circleSpeed;
    //println(angle);
    
    if(direct == 1)
    {
       if(angle > origiangle + direct * 2*PI )
      {
        InitCirclePath(currPosition);
      }
    }
    if(direct == -1)
    {
       if(angle < origiangle + direct * 2*PI )
      {
        InitCirclePath(currPosition);
      }
    }
    
    
   return currPosition;
    
    
  
  }
  PVector LinePath(PVector currPosition){
    
    PVector acceleration = new PVector((int)random(-2, 2)*5, (int)random(-2, 2)*5);
      
    velocity.add(acceleration); 
    CollideCheck(currPosition);
    currPosition.add(velocity);
    
   return currPosition;
    
    
  
  }
  
  void CollideCheck(PVector currPosition)//collide wall
  {
    
    int colSize = 4+2;
    int rowSize = 8+2;
    
     if (currPosition.x > width - pixelSize * ((colSize - 1) *2 )) {
      currPosition.x = width -  pixelSize * ((colSize - 1) *2 );
      velocity.x *= -1;
    } else if (currPosition.x < 0) {
      currPosition.x = 0;
      velocity.x *= -1;
    } else if (currPosition.y > height - pixelSize * rowSize) {
      currPosition.y = height - pixelSize * rowSize;
      velocity.y *= -1;
    } else if (currPosition.y < 0) {
      currPosition.y = 0;
      velocity.y *= -1;
    } 
  }
  void CollideCheck2(PVector currPosition)//collide wall
  {
    
    int colSize = 4+2;
    int rowSize = 8+2;
    
     if (currPosition.x > width - pixelSize * ((colSize - 1) *2 )) {
       
      currPosition.x = width -  pixelSize * ((colSize - 1) *2 );
      InitCirclePath(currPosition);
      
      velocity.x *= -1;
      currPosition.add(velocity);
    } else if (currPosition.x < 0) {
      
      currPosition.x = 0;
      InitCirclePath(currPosition);
      
      velocity.x *= -1;
      currPosition.add(velocity);
    } else if (currPosition.y > height - pixelSize * rowSize) {
      
      currPosition.y = height - pixelSize * rowSize;
      InitCirclePath(currPosition); 
      velocity.y *= -1;
      currPosition.add(velocity);
    } else if (currPosition.y < 0) {
      
      currPosition.y = 0;
      InitCirclePath(currPosition);
      
      velocity.y *= -1;
      currPosition.add(velocity);
    } 
  }
  float[] InitCirclePath(PVector currPosition){
    
    velocity = new PVector(random(-2, 2) * pixelSize, random(-2, 2) * pixelSize);
    acceleration = new PVector(random(-2, 2) * pixelSize, random(-2, 2) * pixelSize);
    
    
    //center = new PVector(currPosition.x + (int)random(-100, 100), currPosition.y + (int)random(-100, 100));
    float centerX = currPosition.x + (int)random(-200, 200);
    float centerY = currPosition.y + (int)random(-200, 200);
    center = new PVector(centerX, centerY);
    
    float deltaX = currPosition.x - center.x;
    float deltaY = currPosition.y - center.y;
    origiangle = atan2(deltaY, deltaX);
    angle = atan2(deltaY, deltaX);
    //println("7 ",degrees(angle));
        
    radius = dist(center.x, center.y, currPosition.x, currPosition.y);
    
    //float x = center.x + cos(angle)*radius;
    //float y = center.y + sin(angle)*radius;
    float x = currPosition.x;
    float y = currPosition.y;
    
    direct  = random(1) < 0.5 ? -1 : 1;
    circleSpeed = (int) random(8, 12) * 10;
    
    return new float[]{x, y, angle};
  
  }
  
  float[] InitLinePath(PVector currPosition){
    
    velocity = new PVector(random(-2, 2) * pixelSize, random(-2, 2) * pixelSize);
    acceleration = new PVector(random(-2, 2) * pixelSize, random(-2, 2) * pixelSize);
    
    return new float[]{currPosition.x, currPosition.y, angle};
  
  }
  
}
