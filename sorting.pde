import processing.sound.*;
Integer[] toSort = new Integer[10];

int swapCount = 0;


SortingAlg alg;

void setup(){
  colorMode(HSB, 360, 100, 100, 100);
  size(1000,600);
  for (int i = 0; i < toSort.length; i++){
    toSort[i] = floor(random(0,height));
  }
  
  //Change this line to use another algorithm to sort your data
  alg = new Insertionsort<Integer>(toSort);
  
}
void draw(){
  background(51);
  
  toSort = (Integer[]) alg.executeStep();
  
  if(alg.finished){
    noLoop();
    print("finished");
  }
  float w = (float) width / toSort.length;
  if (w<5){
    noStroke();
  }else{
    stroke(0);
    strokeWeight(1);
  }
  for (int i = 0; i < toSort.length; i++){
    float x = w * i;
    float curval = toSort[i];
    fill(alg.colorForIndex(i));
    if (alg.finished) fill(100,10,100);
    rect(x,height-curval,w,curval);
    fill(0);
    
    if (w>10 && false){
      textAlign(CENTER,BOTTOM);
      textSize(7);
      text(toSort[i].toString(), x + w/2, height);
    }
    fill(360);
    textAlign(LEFT,TOP);
    textSize(15);
    text("Swaps: " + ((Integer) swapCount).toString(), 0, 0);
  }
}