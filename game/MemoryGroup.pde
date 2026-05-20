class MemoryGroup extends Memory {
  private int aIndex;
  private ArrayList<Memory> ram;
  public MemoryGroup(int len) {
    super(new Register[len], 0, len);
    ram = new ArrayList<Memory>();
  }
  public Memory allocate(int len) {
    int out = aIndex;
    aIndex+=len;
    ram.add(new Memory(super.mem, out, len));
    if (aIndex >= super.len) {
      println("Not enough memory");
      return null;
    }
    return ram.get(ram.size()-1);
  }
  public ArrayList<Memory> getAllocations () {return ram;}
}
