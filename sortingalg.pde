abstract class SortingAlg<T extends Comparable<T>>{
  T[] elements;
  int count;
  boolean finished = false;
  
  void swap(int i, int j){
    swapCount++;
    T s = elements[i];
    elements[i] = elements[j];
    elements[j] = s;
  }
  
  abstract void execute();
  abstract void executeStep();
  color colorForIndex(int i){
    return color(360);
  }
  float freqToPlay(){
    //Default implementation, to be overwritten
    return 0f;
  }
}