class GenerateController{

  ArrayList<Monster> monsters;
  PVector origin;
  int colSize = 0;
  int rowSize = 0;
  
  int pixelSize = 5;
  
  
  GenerateController()
  {
    origin = new PVector(0, 0);
    monsters = new ArrayList<Monster>();
  }
  
  void addMonster(PVector pos,int colS,int rowS, int seed, int c) 
  {

    Monster m = new Monster(pos, colS, rowS, seed, c);
    m.Init();
    monsters.add(m);
     
  }
  void Init()
  {
    //p.Init();
  }
  void Run() 
  {
    for (int i = monsters.size()-1; i >= 0; i--) 
    {
      Monster p = monsters.get(i);     
      p.Run();
      
    }
    Collide();
    Divide();
  }
  //check if there are monsters collide others
  void Collide()
  {
    
    
    
    for (int i = 0; i < monsters.size() ; i++) 
    {
      for (int j = i+1; j < monsters.size(); j++) 
      {
        
        
       if(i != j){
           Monster m1 = monsters.get(i);
           Monster m2 = monsters.get(j);
           float d = m1.currPosition.dist(m2.currPosition);
           if((m2.currPosition.x < m1.currPosition.x + m1.pixelSize * (m1.colSize - 2) * 2 +2&& 
               m2.currPosition.y < m1.currPosition.y + m1.pixelSize * (m1.rowSize - 2) +2&&
               m1.currPosition.x < m2.currPosition.x + m2.pixelSize * (m2.colSize - 2) * 2 +2&& 
               m1.currPosition.y < m2.currPosition.y + m2.pixelSize * (m2.rowSize - 2) +2) )//d < m1.pixelSize * (m1.rowSize- 2)
                                                // || (m1.currPosition.x < m2.currPosition.x + m2.pixelSize * (m2.colSize - 2) * 2 && 
                                                //     m1.currPosition.y < m2.currPosition.y + m2.pixelSize * (m2.rowSize - 2) &&
                                                //     m2.currPosition.x < m1.currPosition.x + m1.pixelSize * (m1.colSize - 2) * 2 && 
                                                //     m2.currPosition.y < m1.currPosition.y + m1.pixelSize * (m1.rowSize - 2) )  )
           {
             //println("c", i, j);
             PVector pos = m2.currPosition;
             int colS = 4;//m1.colSize + m2.colSize - 4;
             int rowS = 8;//m1.rowSize + m2.rowSize - 4;
             int seed = 0;
             int maxEatenSizeNum = 4;
             int cId = m2.GetColorId();
             //monsters.remove(m1);
             //monsters.remove(m2);
             
             Monster m = new Monster(pos, colS, rowS, seed, cId);
             m.hasEaten = m2.hasEaten + m1.hasEaten;
             println(m2.hasEaten, m1.hasEaten, m.hasEaten);
             if(m2.pixelSize >= m1.pixelSize){
               if(m2.hasEaten + m1.hasEaten <= maxEatenSizeNum){//m2.pixelSize * 2 < height / 8
                 
                 m.pixelSize = pixelSize * (int)pow(2, (m2.hasEaten + m1.hasEaten) - 1) ;
                
                 
               }
               else{
                  m.pixelSize = pixelSize * (int)pow(2, maxEatenSizeNum - 1);//m2.pixelSize;
               }
             }
             else{
               if(m2.hasEaten + m1.hasEaten <= maxEatenSizeNum){//m1.pixelSize * 2 < height / 8
                 
                 m.pixelSize = pixelSize * (int)pow(2, (m2.hasEaten + m1.hasEaten) - 1) ;
                 
               }
               else{
                  m.pixelSize = pixelSize * (int)pow(2, maxEatenSizeNum - 1);//m1.pixelSize;
               }
             }
             
             
             
                       
             monsters.remove(m1);
             monsters.remove(m2);
             monsters.add(m);
             m.Init(); 
             println( m.hasEaten);
             
             
           }
       }
        
       
       
      }
    }
  }
  //  check if there is the monster need to be divided
  void Divide()
  {
    if(monsters.size() == 1)
    {
      
    }
    for (int i = 0; i < monsters.size(); i++) 
    {
      Monster m = monsters.get(i);
      if(m.hasEaten >= 5)
      {
        
        
        //monsters.remove(m);
        
        
        for(int j = 1; j < m.hasEaten; j++)
        {
          
          
          int rSeed = j + 1;
          int monsterSizeWidth = 4;
          int monsterSizeHeight = 8;
          //int cId = m2.GetColorId();
          
          PVector pos = new PVector(pixelSize*(int)random(0, colNum - monsterSizeWidth * 2), pixelSize*(int)random(0, rowNum - monsterSizeHeight));
          
          //int[] colorSetting_arr = {0, 2, 4, 6, 0, 2, 4, 6};
          int[] colorSetting_arr = {16, 16, 14, 14, 14, 14, 14, 14, 14, 16, 16, 14, 14, 14, 14, 14, 14, 14, 16, 16, 14, 14, 14, 14, 14, 14, 14};
          
          
          addMonster(pos, monsterSizeWidth, monsterSizeHeight, rSeed, colorSetting_arr[j]);
          
        
        }
        
        m.pixelSize = 5;
        m.hasEaten = 1;
         
      }
    }
  }
//*/
}
