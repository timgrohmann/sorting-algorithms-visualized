import processing.sound.*;
Float[] toSort = new Float[500];

int swapCount = 0;
int compCount = 0;
int timeWarp = 1;
SinOsc sine;
SortingAlg alg;

long startTime;
long endTime;

void setup(){
  colorMode(HSB, 360, 100, 100, 100);
  size(1000,600);
  ArrayList<Float> list = new ArrayList<Float>();
  for (int i = 1; i < toSort.length+1; i++){
    list.add((float)i/toSort.length*height);
  }
  
  for (int i = 0; i < toSort.length; i++){
    int ind = floor(random(0,list.size()));
    toSort[i] = list.get(ind);
    list.remove(ind);
  }
  
  //Change this line to use another algorithm to sort your data
  startTime = System.currentTimeMillis();
  alg = new Mergesort<Float>(toSort);
  //alg.execute();
  //endTime = System.currentTimeMillis();
  //println(endTime-startTime);
  sine = new SinOsc(this);
  sine.play();
}
void draw(){
  background(51);
  for (int timer = 0; timer < timeWarp; timer++){
    alg.executeStep();
  }
  sine.freq(alg.freqToPlay()/height * 400 + 100);
  
  if(alg.finished){
    noLoop();
    println("finished");
    
    sine.stop();
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
    noStroke();    
    if (alg.finished) fill(100,10,100);
    rect(x,height-curval,w,curval);
  }
  fill(200);
  textSize(20);
  textAlign(LEFT,TOP);
  text("Swaps: " + ((Integer) swapCount).toString(), 10, 5);
  text("Comps: " + ((Integer) compCount).toString(), 10, 25);
  text("Frame: " + ((Integer) frameCount).toString(), 10, 45);
  text("Warp: " + ((Integer) timeWarp).toString(), 10, 65);
}

void mouseWheel(MouseEvent event){
  timeWarp -= event.getCount();
  if (timeWarp > 500){
    timeWarp -= event.getCount()*9;
  }
  timeWarp = constrain(timeWarp,1,5000);
}