class Bubblesort<T extends Comparable<T>> extends SortingAlg<T>{
  int currentP = 0;
  int alreadyDone = 0;
  
  Bubblesort(T[] e){
    elements = e;
    count = elements.length;
  }
  
  T[] executeStep(){
    if (currentP < count - alreadyDone - 1){
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
    return elements;
  }
  
  color colorForIndex(int i){
    if (i == currentP) return color(0,100,100);
    return color(360);
  }
}