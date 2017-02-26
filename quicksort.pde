class Quicksort<T extends Comparable<T>> extends SortingAlg<T>{
  int currentDiv = -1;
  int currentL = -1;
  int currentR = -1;
  
  class Step{
    int l;
    int r;
    Step(int l_, int r_){
      l = l_;
      r = r_;
    }
  }
  
  ArrayList<Step> heap = new ArrayList<Step>();
  
  Quicksort(T[] e){
    elements = e;
    count = elements.length;
    heap.add(new Step(0,count-1));
  }
  
  T[] execute(){
    quicksort(0,count-1);
    return elements;
  }
  
  T[] executeStep(){
    if (heap.size() > 0){
      Step next = heap.get(heap.size()-1);
      quicksortStep(next.l,next.r);
      heap.remove(next);
    }else{
      finished = true;
    }
    return elements;
  }
  
  void quicksort(int left, int right){
    if (left < right){
      int div = divide(left,right);
      quicksort(left, div-1);
      quicksort(div+1, right);
    }
  }
  
  void quicksortStep(int left, int right){
    if (left < right){
      int div = divide(left,right);
      currentDiv = div;
      currentL = left;
      currentR = right;
      heap.add(new Step(left, div-1));
      heap.add(new Step(div+1, right));
    }
  }
  
  int divide(int left, int right){
    int i = left;
    int j = right-1;
    T pivot = elements[right];
    do {
      while(elements[i].compareTo(pivot) <= 0 && i < right){
        i++;
      }
      while(elements[j].compareTo(pivot) >= 0 && j > left){
        j--;
      }
      if(i<j){
        swap(i,j);
      }
    } while(i<j);
    
    if (elements[i].compareTo(pivot) > 0){
      swap(i,right);
    }
    
    return i;
  }
  color colorForIndex(int i){
    color r = color(360);
    if (i == currentDiv){
      r = color(180, 100, 100);
    }
    if (i == currentL || i == currentR){
      r = color(300,50,100);
    }
    return r;
  }
  
}