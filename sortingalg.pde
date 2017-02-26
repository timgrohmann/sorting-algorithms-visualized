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
  
  //abstract Integer[] execute();
  abstract T[] executeStep();
  abstract color colorForIndex(int i);
}