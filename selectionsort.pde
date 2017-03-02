class Selectionsort<T extends Comparable<T>> extends SortingAlg<T>{
  int alreadyDone = 0;
  int i = 0;
  int min = 0;
  
  Selectionsort(T[] e){
    elements = e;
    count = elements.length;
  }
  
  void execute(){
    for (int i = 0; i < count; i++){
      min = i;
      for (int j = i; j < count; j++){
        compCount++;
        if (elements[min].compareTo(elements[j]) > 0){
          min = j;
        }
      }
      swap(min,i);
    }
  }
  
  void executeStep(){
    if (i < count){
      compCount++;
      if (elements[min].compareTo(elements[i]) > 0){
        min = i;
      }
      
      i++;
    }else{
      swap(min, alreadyDone);
      alreadyDone++;
      
      i = alreadyDone;
      min = alreadyDone;
      
      if (alreadyDone == count){
        alreadyDone--;
        finished = true;
      }
    }
    
  }
  
  color colorForIndex(int ind){
    if (ind == alreadyDone) return color(0,100,100);
    if (ind == i) return color(100,100,100);
    if (ind == min) return color(200,100,100);
    return color(360);
  }
  float freqToPlay(){
    if (min >= count) return 0;
    return (float) elements[min];
  }
}