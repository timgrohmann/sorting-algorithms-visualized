class Bubblesort<T extends Comparable<T>> extends SortingAlg<T>{
  int currentP = 0;
  int alreadyDone = 0;
  
  Bubblesort(T[] e){
    elements = e;
    count = elements.length;
  }
  
  void execute(){
    for (int i = count-1; i > 0; i--){
      for (int j = 0; j < i; j++){
        compCount++;
        if (elements[j].compareTo(elements[j + 1]) > 0){
          swap(j, j+1);
        }
      }
    }
  }
  
  void executeStep(){
    if (currentP < count - alreadyDone - 1){
      compCount++;
      if (elements[currentP].compareTo(elements[currentP + 1]) > 0){
        swap(currentP, currentP + 1);
      }
      currentP++;
    }else{
      currentP = 0;
      alreadyDone++;
      if (alreadyDone == count){
        finished = true;
      }
    }
  }
  
  color colorForIndex(int i){
    if (i == currentP) return color(0,100,100);
    return color(360);
  }
  
  float freqToPlay(){
    return (float) elements[currentP];
  }
}