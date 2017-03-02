class Quicksort<T extends Comparable<T>> extends SortingAlg<T>{
  int currentDiv = -1;
  int currentL = -1;
  int currentR = -1;
  
  boolean isInitialized, stillIn = false;
  int divResult = -1;
  int divI, divJ;
  T divPivot;
  
  Step next = null;
  
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
  
  void execute(){
    quicksort(0,count-1);
  }
  
  void executeStep(){
    if (heap.size() > 0){
      if (next == null){
        next = heap.get(heap.size()-1);
      }
      if (divResult == -1 && next.l<next.r){
        currentL = next.l;
        currentR = next.r;
        currentDiv = divI;
        divisionStep(next.l,next.r);
      }else{
        quicksortStep(next.l,next.r, divResult);
        divResult = -1;
        heap.remove(next);
        next = null;
      }
      
    }else{
      finished = true;
    }
  }
  
  void quicksort(int left, int right){
    if (left < right){
      int div = divide(left,right);
      quicksort(left, div-1);
      quicksort(div+1, right);
    }
  }
  
  void quicksortStep(int left, int right, int div){
    if (left < right){
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
        compCount++;
        i++;
      }
      while(elements[j].compareTo(pivot) >= 0 && j > left){
        compCount++;
        j--;
      }
      if(i<j){
        swap(i,j);
      }
    } while(i<j);
    compCount++;
    if (elements[i].compareTo(pivot) > 0){
      swap(i,right);
    }
    
    return i;
  }
  
  void divisionStep(int left, int right){
    if (!isInitialized){
      divI = left;
      divJ = right - 1;
      divPivot = elements[right];
      isInitialized = true;
    }
    compCount++;
    if(divI < right && elements[divI].compareTo(divPivot) <= 0){
      divI++;
      stillIn = true;
      return;
    }
    compCount++;
    if(divJ > left && elements[divJ].compareTo(divPivot) >= 0){
      divJ--;
      stillIn = true;
      return;
    }
    if(divI<divJ){
      swap(divI,divJ);
      return;
    }
    compCount++;
    if (elements[divI].compareTo(divPivot) > 0){
      swap(divI,right);
    }
    divResult = divI;
    isInitialized = false; 
  }
  
  color colorForIndex(int i){
    color r = color(360);
    if (i == divI || i == divJ){
      r = color(180, 100, 100);
    }
    if (i == currentL || i == currentR){
      r = color(300,50,100);
    }
    if (i == currentR){
      stroke(200,100,100);
      line(0,height-(float)elements[i],width,height-(float)elements[i]);
    }
    return r;
  }
  
  float freqToPlay(){
    return (float) elements[currentL];
  }
}