class MemoryGroup extends Memory {
  int aIndex;
  ArrayList<Memory> mem;
  public MemoryGroup(Register[] allocation, int start, int len) {
    super(allocation, start, len);
    mem = new ArrayList<Memory>();
  }
  public int malloc(int len) {
    
  }
  public ArrayList<Memory> getAllocations () {return mem;}
}
