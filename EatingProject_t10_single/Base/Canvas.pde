class Canvas{
  
  
  
  
  FloatList x_fl;
  FloatList y_fl;
  IntList c_il;
  
  FloatList xp_fl;
  FloatList yp_fl;
  
  ColorPalette currentColor;
  
  
  IntDict x_id;
  IntDict y_id;
  
  IntDict xp_id;
  IntDict yp_id;
  int[][] pp;
  
  //Dictionary<Pair, Integer>  dict;
  
  Canvas(){
    x_fl = new FloatList();
    y_fl = new FloatList();
    c_il = new IntList();
    
    xp_fl = new FloatList();
    yp_fl = new FloatList();
    
    x_id = new IntDict();
    y_id = new IntDict();
    
    //dict = new Dictionary<String, Integer>();
    
    pp = new int[height][width];
    for(int i = 0; i < height; i++)
    {
      
      for(int j = 0; j < width; j++)
      {
        pp[i][j] = -1;
        
      }
    }
   
    currentColor = new ColorPalette(0);
  }
  
  void AddPixel(PVector pv0, int i, PVector pv1){
    x_fl.append((int)pv0.x);
    y_fl.append((int)pv0.y);
    c_il.append(i);
    
    xp_fl.append((int)pv1.x);
    yp_fl.append((int)pv1.y);
    
    x_id.set(str((int)pv0.x) + " " + str((int)pv0.y), i);
    y_id.set(str((int)pv0.y), i);
    c_il.append(i % 100);
    
   
  }
  
  
  void Display(){
    
    String[] theKeys = x_id.keyArray();
    for(int i = 0; i < x_id.size(); i++)
    {
      int[] nums = int(split(theKeys[i], ' '));
      fill( currentColor.GetColor(x_id.get(theKeys[i]) % 100) );
      int rectSize = x_id.get(theKeys[i]) / 100 *3;
      rect(nums[0], nums[1], rectSize, rectSize);
      
    }
    
    
   
  }


   void DrawLine(float x0, float y0, float x1, float y1)
   {
     fill(255, 255, 0);
    stroke(0);
    strokeWeight(10);
     line(x0, y0, x1, y1);
   }
   

}
