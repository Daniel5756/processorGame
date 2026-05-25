class MemoryGroup extends Memory {
  private int aIndex;
  private ArrayList<Memory> ram;
  public MemoryGroup(Register[] r) {
    super(r, 0, r.length);
    ram = new ArrayList<Memory>();
  }
  public Memory allocate(int len) {
    int out = aIndex;
    aIndex+=len;
    
    if (aIndex >= super.len) {
      println("Not enough memory");
      return null;
    }
    ram.add(new Memory(super.mem, out, len));
    return ram.get(ram.size()-1);
  }
public Display allocateDisplay(int len) {
    int out = aIndex;
    aIndex+=len;
    
    if (aIndex >= super.len) {
      println("Not enough memory");
      return null;
    }
    ram.add(new Display(super.mem, out, len));
    return (Display) ram.get(ram.size()-1);
  }
public Stack allocateStack(int len) {
    int out = aIndex;
    aIndex+=len;
    
    if (aIndex >= super.len) {
      println("Not enough memory");
      return null;
    }
    ram.add(new Stack(super.mem, out, len));
    return (Stack) ram.get(ram.size()-1);
  }
  public ArrayList<Memory> getAllocations () {return ram;}
}
