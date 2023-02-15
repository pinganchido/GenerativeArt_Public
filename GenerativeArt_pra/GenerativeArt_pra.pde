int canvasWidth = 640;
int canvasHeight = 640;
int px = 1080;
int n = 16;//one side has 16 
float part_widthSize = canvasWidth / 16;//one little square side's size
int[] colors = new int[4];



void setup(){
  
  
  size(640, 640);
  noLoop();
}
void draw(){
  
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      float posX = 0 + part_widthSize * i;
      float posY = 0 + part_widthSize * j;
      
      noStroke();
      fill(150, 180, int(random(120, 255)));
      int diceNum = int(random(1, 7));
      
      
      
      
      switch(diceNum){
        case 1:
          triangle(posX, posY + part_widthSize, posX + part_widthSize, posY + part_widthSize, posX + part_widthSize, posY);
          break;
        case 2:
          triangle(posX, posY + part_widthSize, posX + part_widthSize, posY + part_widthSize, posX + part_widthSize, posY);
          break;
        case 3:
          triangle(posX, posY, posX + part_widthSize, posY, posX, posY + + part_widthSize);
          break;
        case 4:
          triangle(posX, posY, posX + part_widthSize, posY, posX + part_widthSize, posY + part_widthSize);
          break;
        case 5:
          triangle(posX, posY, posX, posY + part_widthSize, posX + part_widthSize, posY + part_widthSize);
          break;
        case 6:
          //rect(posX, posY, posX + part_widthSize, posY + part_widthSize);//????
          //triangle(posX, posY, posX + part_widthSize, posY + part_widthSize, posX + part_widthSize, posY + part_widthSize);//line
           
          //triangle(posX, posY + part_widthSize, posX + part_widthSize, posY + part_widthSize, posX + part_widthSize, posY);
          //triangle(posX, posY, posX + part_widthSize, posY, posX, posY + + part_widthSize);
          
          triangle(posX, posY, posX, posY + part_widthSize, posX + part_widthSize, posY + part_widthSize);
          break;
        default:
          break;
       
      
      }
    }
  }
  
}
