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
  
  T[] executeStep(){
    if (j>0 && elements[j-1].compareTo(insert) > 0){
      elements[j] = elements[j-1];
      swapCount++;
      j--;
    }else{
      elements[j] = insert;
      currentP++;
      j = currentP;
      if (currentP >= count){
        finished = true;
      }else{
        insert = elements[currentP];
      }
    }
    
    
    return elements;
  }
}