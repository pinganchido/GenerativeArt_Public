class ColorPalette{
 
  private int useColorId;
  
  
  /*
  //0: red_1, 1: green_1, 2: blue_1
  */
  private IntList colorPalette = new IntList();
  
  /*
  //0: red_1, 1: green_1, 2: blue_1
  */
  //HashMap<int,color> colorPalette = new HashMap<int,color>();
  
  ColorPalette(int colorId)
  {
    Init();
    useColorId = colorId;
    
  }
  
  
  void Init()
  {
    //00_red
    colorPalette.append(color(238,67,67));
    colorPalette.append(color(190,0,0));
    //02_green
    colorPalette.append(color(170,240,100));
    colorPalette.append(color(130,200,60));
    //04_yelllow
    colorPalette.append(color(250,240,70));
    colorPalette.append(color(210,200,30));
    //06_greyblue
    colorPalette.append(color(180,200,200));
    colorPalette.append(color(140,160,160));
    //08_white
    colorPalette.append(color(255,255,255));
    colorPalette.append(color(100,100,100));
    //10_blue
    colorPalette.append(color(130,180,235));
    colorPalette.append(color(90,140,195));
    //12_blue
    colorPalette.append(color(0, 0, 0));
    colorPalette.append(color(255, 255, 255));
    //14_black
    colorPalette.append(color(40, 40, 40,255));
    colorPalette.append(color(20, 20, 20,255));
    //16_black2
    colorPalette.append(color(50, 50, 50,255));
    colorPalette.append(color(30, 30, 30,255));
  }
  
  color GetColor(int id)
  {
    
    useColorId = id;//no use...
    color c = colorPalette.get(id);
    return c;
  }


}
