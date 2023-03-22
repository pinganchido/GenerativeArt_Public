class Monster{
  
  int[][] origiArr;
  int[][] nextArr;
  int[][] edgeArr;
  
  int colSize = 0;
  int rowSize = 0;
  
  PVector currPosition;
  
  int hasEaten = 1;//include origi
  
  
  int cR_color = 255;
  int cG_color = 255;
  int cB_color = 255;
  color c  = color(255, 255, 255);
  String color_str = "red";
  ColorPalette currentColor;
  int currentColorId = 0;
  
  int pixelSize = 5;
  
  int s = 0;
  
  int rSeed = 0;
  
  PVector velocity;
  PVector acceleration;
  
  
  int changeState = 0;
  public int currState = 0;
  //int stayState = 0;
  
  //path
  PVector center;
  float angle;
  float radius;
  Routes routes;
  
  
  Monster(PVector pos, int colS, int rowS, int seed, int colorId)
  {  
     currPosition = new PVector(pos.x, pos.y);//println("1 ",currPosition);
     colSize = colS + 2;//add edge
     rowSize = rowS + 2;// add edge
     origiArr = new int[rowSize + 2][colSize + 2];
     rSeed = seed;
     //move
     velocity = new PVector(random(-2, 2) * pixelSize, random(-2, 2) * pixelSize);
     acceleration = new PVector(random(-2, 2) * pixelSize, random(-2, 2) * pixelSize);
     //color
     currentColorId = colorId;
     currentColor = new ColorPalette(currentColorId);
     
     //path
     routes = new Routes(currentColorId);
     float[] f= new float[3];
     
     f = routes.InitRoute(currentColorId, currPosition);
   
    currPosition.x = f[0];
    currPosition.y = f[1];
    angle = f[2];//println("2 ",currPosition);
    
  
     
  }
  //all zero, only have edge situation
  boolean isAllZero(){
    
    for(int i = 0; i < rowSize; i++)
      {
        for(int j = 0; j < colSize; j++)
        {     
          if(origiArr[i][j] ==1)
          {
             return false;
          }
        }
      }
      return true;
  
  }
  //display
  void Display()
  { 
     
      
      for(int i = 0; i < rowSize; i++)
      {
        for(int j = 0; j < colSize; j++)
        {     
          if(origiArr[i][j] ==1)
          {
             fill(currentColor.GetColor(currentColorId));
             
             noStroke();
             //rect(currPosition.x, currPosition.y, 10, 10);
             rect(currPosition.x + j * pixelSize , currPosition.y + i * pixelSize, pixelSize, pixelSize);
          }
        }
      }
      //currState = 2;
      DisplayMirror();
  }
  //mirror
  void DisplayMirror()
  {
    
    
    for(int i = 0; i < rowSize; i++)
      {
        int k = (colSize - 2 )* 2;
        float midPosX = currPosition.x + pixelSize * k;
        for(int j = 1; j < colSize - 1; j++)
        {     
          if(origiArr[i][j] ==1)
          {
             fill(currentColor.GetColor(currentColorId));
             
             noStroke();
             //rect(currPosition.x, currPosition.y, 10, 10);
             //rect(midPosX + k * pixelSize , currPosition.y + i * pixelSize, pixelSize, pixelSize);
             rect(currPosition.x + (k ) * pixelSize , currPosition.y + i * pixelSize, pixelSize, pixelSize);
             
          }
          
          k -= 1;
        }
        
         // midPosX = currPosition.x + pixelSize * k;
      }
      DisplayEdge();
  }
  //display edge
  void DisplayEdge()
  {
      
      
     
      for(int i = 0; i < rowSize ; i++)
      {
        for(int j = 0; j < colSize - 1; j++)
        {     
          if(edgeArr[i][j] ==1)
          {
             color edgeC = color(255);
             fill(currentColor.GetColor(currentColorId + 1));
             noStroke();
             //rect(currPosition.x, currPosition.y, 10, 10);
             rect(currPosition.x + j * pixelSize , currPosition.y + i * pixelSize, pixelSize, pixelSize);
          }
        }
      }
      
      for(int i = 0; i < rowSize; i++)
      {
        int k = (colSize - 2 )* 2 + 1;
        float midPosX = currPosition.x + pixelSize * k;
        for(int j = 0; j < colSize - 1; j++)
        {     
          if(edgeArr[i][j] ==1)
          {
             fill(currentColor.GetColor(currentColorId + 1));
             noStroke();
             //rect(currPosition.x, currPosition.y, 10, 10);
             //rect(midPosX + k * pixelSize , currPosition.y + i * pixelSize, pixelSize, pixelSize);
             rect(currPosition.x + (k ) * pixelSize , currPosition.y + i * pixelSize, pixelSize, pixelSize);
             
          }
          
          k -= 1;
        }
        
        
      }
  }
  //do celluar automation
  void Grow()
  {
    int haveChange = 0;
    int genCnt = 0;
    nextArr = new int[rowSize + 2][colSize + 2];
    
    
    //nextArr = origiArr;
    for(int i = 1; i < rowSize - 1; i++)
    {
      for(int j = 1; j < colSize - 1; j++)
      { 
        int n = NeighborCnt(i, j);
        if(origiArr[i][j] == 0 && n <= 1 )
        {
          nextArr[i][j] = 1;
          haveChange = 1;
          genCnt += 1;
          
        }
        else if(origiArr[i][j] == 1 && (n == 2 || n == 3))
        {
          nextArr[i][j] = 1;
          haveChange = 1;
          genCnt += 1;
        }
        else
        {
          nextArr[i][j] = 0;
          
        }
        
      }
    }
 
    
    for(int i = 1; i < rowSize + 2; i++)
    {
      for(int j = 1; j < colSize+2; j++)
      { 
        origiArr[i][j] = nextArr[i][j];
        
      }
    }
   
    
    if(genCnt > 1000)//haveChange == 0)
    {
      currState = 2;
      
      DrawEdge();
      
      
    }
    
    DrawEdge();
    
  }
  
  
  void DrawEdge()
  {
   
   
    
    
    //nextArr = origiArr;
    for(int i = 0; i < rowSize; i++)
    {
      for(int j = 0; j < colSize; j++)
      { 
        int n = NeighborCnt_Edge(i, j);
        if(origiArr[i][j] == 0 && n >= 1 )
        {
          edgeArr[i][j] = 1;
         
        }
        else
        {
          edgeArr[i][j] = 0;
        }
        
        
      }
    }
    
    if(isAllZero())
    {
        for(int i = 0; i < rowSize; i++)
        {
          for(int j = 0; j < colSize; j++)
          { 
            if(i == 0 || j == 0){
              edgeArr[i][j] = 1;
            }
            if(i == rowSize - 1 )
            edgeArr[i][j] = 1;
          }
        }
     }
    
  }
  
  int NeighborCnt(int currI, int currJ)
  {
    
    int cnt = 0;
    
    for(int i = -1; i < 2; i++)
    {
      for(int j = -1; j < 2; j++)
      {
        
        cnt += origiArr[currI + i][currJ + j];

      }
    }
    cnt -= origiArr[currI][currJ];
    
    return cnt;
  }
  
  int NeighborCnt_Edge(int currI, int currJ)
  {
    
    int cnt = 0;
    
    if(currI - 1 >= 0)
    {
      cnt += origiArr[currI-1][currJ];//origiArr[currI][currJ - 1] + origiArr[currI+1][currJ] + origiArr[currI][currJ+1];
    }
    if(currI + 1 < rowSize)
    {
      cnt += origiArr[currI+1][currJ];
    }
    if(currJ - 1 >= 0)
    {
      cnt += origiArr[currI][currJ - 1];
    }
    if(currJ + 1 < colSize )
    {
      cnt += origiArr[currI][currJ + 1];
    }
    
    //cnt = origiArr[currI-1][currJ] + origiArr[currI][currJ - 1] + origiArr[currI+1][currJ] + origiArr[currI][currJ+1];
    /*
    if(currI- 1 > 0 && currI + 1 < rowSize && currJ- 1 > 0 && currJ + 1 < colSize)
    {
      cnt = origiArr[currI-1][currJ] + origiArr[currI][currJ - 1] + origiArr[currI+1][currJ] + origiArr[currI][currJ+1];
    }
    else if(currI- 1 < 0)
    {
      cnt = origiArr[currI][currJ - 1] + origiArr[currI+1][currJ] + origiArr[currI][currJ+1];
    }
    else if(currI+ 1 > rowSize)
    {
      cnt = origiArr[currI-1][currJ] + origiArr[currI][currJ - 1]  + origiArr[currI][currJ+1];
    }
    else if(currJ- 1 < 0)
    {
      cnt = origiArr[currI-1][currJ]  + origiArr[currI+1][currJ] + origiArr[currI][currJ+1];
    }
    else if(currJ+ 1 > colSize )
    {
      cnt = origiArr[currI-1][currJ] + origiArr[currI][currJ - 1] + origiArr[currI+1][currJ] ;
    }
    */
    return cnt;
  }
  
  
  
  //initial state
  void Init()
  {
    //randomSeed(rSeed);
    
    for(int i = 0; i < rowSize; i++)
    {
      for(int j = 0; j < colSize; j++)
      { 
        
        origiArr[i][j] = 0;
      }
    }
    
    for(int i = 1; i < rowSize - 1; i++)
    {
      for(int j = 1; j < colSize - 1; j++)
      { 
        
        origiArr[i][j] = random(1) < 0.5 ? 0 : 1;
        //origiArr[i][j] = 0;
      }
    }
     edgeArr = new int[rowSize + 2][colSize + 2];
    for(int i = 0; i < rowSize + 2; i++)
    {
      for(int j = 0; j < colSize + 2; j++)
      { 
        edgeArr[i][j] = 0;
      }
    }
    
    DrawEdge();
    
    //currState += 1;
    
    //Display();
    //Grow();
    
  }
  //moving
  void Move()
  {
    //println("3 ",currPosition);
    //PVector prePosition = new PVector(currPosition.x, currPosition.y, currPosition.z);
    
    
    //CollideCheck();
    currPosition = routes.GetRoute(currentColorId, currPosition, pixelSize);
    //canvas.AddPixel(prePosition, pixelSize * 100 + currentColorId, currPosition);
    
   
    
   
  }
  
  void Run()
  {
    if(frameCount % 60 == 0)
    {
      Grow();
     
    }
    if(currentColorId == 16){
      
      if(frameCount % 10 == 0)
      {
        Move();
       
      }
    }
    else
    {
      if(frameCount % 3 == 0)
      {
        Move();
       
      }
    }
    
    Display();
  }
  
  boolean isDead()
  {
    return false;
  }
  
  int GetColorId()
  {
    return currentColorId;
  }
  void SetColorId(int cid)
  {
    currentColorId = cid;
  }
  
  
}
