class Mergesort<T extends Comparable<T>> extends SortingAlg<T>{
  
  boolean merging = false;
  ArrayList<MergeLeaf> tree = new ArrayList<MergeLeaf>();
  
  MergeLeaf next;
  
  int curMid, curC;
  ArrayList<T> workL;
  ArrayList<T> workR;
  
  int frL, frM;
  
  Mergesort(T[] e){
    elements = e;
    count = elements.length;
    initTree(0,count-1);
  }
  class MergeLeaf{
    int l;
    int r;
    MergeLeaf(int l_, int r_){
      l = l_;
      r = r_;
    }
  }
  
  void execute(){
    mergeSort(0,count-1);
  }
  void executeStep(){
    if(tree.size() == 0 && !merging){
      finished = true;
      return;
    }
    
    if (merging){
      remergeStep();
    }else{
      next = tree.get(0);
      int mid = (next.l + next.r) / 2;
      remergeStart(mid);
      tree.remove(next);
    }
  }
  
  void initTree(int left, int right){
    if (left<right){
      int mid = (left+right) / 2;
      initTree(left,mid);
      initTree(mid+1,right);
      tree.add(new MergeLeaf(left,right));
    }
  }
  
  void mergeSort(int left, int right){
    if (left<right){
      int mid = (left+right) / 2;
      mergeSort(left,mid);
      mergeSort(mid+1,right);
      remerge(left,mid,right);
    }
  }
  
  void remerge(int left, int mid, int right){
    workL = new ArrayList<T>();
    workR = new ArrayList<T>();
    for (int i = left; i<=mid; i++){
      workL.add(elements[i]);
    }
    for (int i = mid+1; i<=right; i++){
      workR.add(elements[i]);
    }
    int c = left;
    while(workL.size() > 0 && workR.size() > 0){
      compCount++;
      if(workL.get(0).compareTo(workR.get(0)) < 0){
        elements[c] = workL.get(0);
        workL.remove(0);
      }else{
        elements[c] = workR.get(0);
        workR.remove(0);
      }
      c++;
    }
    while(workL.size() > 0){
      elements[c] = workL.get(0);
      workL.remove(0);
      c++;
    }
    while(workR.size() > 0){
      elements[c] = workR.get(0);
      workR.remove(0);
      c++;
    }
    
  }
  
  void remergeStart(int mid){
    merging = true;
    curMid = mid;
    curC = next.l;
    workL = new ArrayList<T>();
    workR = new ArrayList<T>();
    
    for (int i = next.l; i<=mid; i++){
      workL.add(elements[i]);
    }
    for (int i = mid+1; i<=next.r; i++){
      workR.add(elements[i]);
    }
  }
  
  void remergeStep(){
    if(workL.size() > 0 && workR.size() > 0){
      compCount++;
      if(workL.get(0).compareTo(workR.get(0)) < 0){
        elements[curC] = workL.get(0);
        workL.remove(0);
      }else{
        elements[curC] = workR.get(0);
        workR.remove(0);
      }
      curC++;
      return;
    }
    if(workL.size() > 0){
      elements[curC] = workL.get(0);
      workL.remove(0);
      curC++;
      return;
    }
    if(workR.size() > 0){
      elements[curC] = workR.get(0);
      workR.remove(0);
      curC++;
      return;
    }
    merging = false;
  }
  
  color colorForIndex(int i){
    color r = color(360);
    if (i == curC){
      r = color(180, 100, 100);
    }
    if (i == next.r - workR.size()){
      r = color(300,50,100);
    }
    return r;
  }
  
  float freqToPlay(){
    //Default implementation, to be overwritten
    return (float) elements[constrain(curC-1,0,count-1)];
  }
  
}