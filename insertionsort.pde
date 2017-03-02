class Insertionsort<T extends Comparable<T>> extends SortingAlg<T>{
  int currentP = 0;
  int j = 0;
  T insert;
  
  Insertionsort(T[] e){
    elements = e;
    count = elements.length;
    insert = elements[0];
  }
  
  color colorForIndex(int i){
    if (i == j) return color(0,100,100);
    return color(360);
  }
  
  void execute() {
    for (int i = 1; i< count; i++){
      T sortin = elements[i];
      int k = i;
      while (k > 0 && elements[k-1].compareTo(sortin) > 0){
        compCount++;
        swapCount++;
        elements[k] = elements[k-1];
        k--;
      }
      elements[k] = sortin;
    }
  }
  
  void executeStep(){
    compCount++;
    if (j>0 && elements[j-1].compareTo(insert) > 0){
      elements[j] = elements[j-1];
      swapCount++;
      j--;
    }else{
      elements[j] = insert;
      currentP++;
      j = currentP;
      if (currentP >= count){
        j--;
        finished = true;
      }else{
        insert = elements[currentP];
      }
    }
   }
   
   float freqToPlay(){
    return (float) elements[j];
  }
}