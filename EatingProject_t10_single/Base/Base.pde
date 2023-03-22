//t10_single
import java.util.Map;
import java.util.Dictionary;

float rowNum = 60;
float colNum = 80;
float pixelSize = 5;

//ArrayList<Monster> monsters = new ArrayList<Monster>();

GenerateController gc;

Monster m;


ArrayList<Canvas> allDraw_arrL;
Canvas canvas;

int state = 0;

void setup()
{
  fullScreen();
  //fullScreen grid size
  rowNum = height / pixelSize;
  colNum = width / pixelSize;
  print(height, width);
  frameRate(60);
  
  allDraw_arrL = new ArrayList<Canvas>();
  canvas = new Canvas();
  
  gc = new GenerateController();
  
  
  
  //randomSeed(0);
  
  
  //create monsters
  //int[] colorSetting_arr = {0, 2, 4, 6, 0, 2, 4, 6, 8};
  int[] colorSetting_arr = {16, 16, 14, 14, 14, 14, 14, 14, 14, 14, 14, 16, 16, 14, 14, 14, 14, 14, 14, 14, 14, 14};
  
  for(int i = 0; i < 15; i++)
  {
    int rSeed = i + 1;
    int monsterSizeWidth = 4;
    int monsterSizeHeight = 8;
    
    
    PVector pos = new PVector(pixelSize*(int)random(0, colNum - monsterSizeWidth * 2), pixelSize*(int)random(0, rowNum - monsterSizeHeight));
 
    gc.addMonster(pos, monsterSizeWidth, monsterSizeHeight, rSeed, colorSetting_arr[i]);
  
  }
    //delay(3000);
}

void draw()
{
  
  //background(130, 135, 90);
  //background(143, 148, 112);
  background(76, 79, 51);
  
    canvas.Display();
    gc.Run();
    
    
   
      
}
